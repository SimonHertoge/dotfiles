# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)
import os, time
from ranger.api.commands import Command
from ranger.core.loader import CommandLoader, Loadable
from ranger.ext.signals import SignalDispatcher
from ranger.ext.shell_escape import *

class extract(Command):
    def execute(self):
        """ Extract copied files to current directory """
        copied_files = tuple(self.fm.copy_buffer)

        if not copied_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = copied_files[0]
        cwd = self.fm.thisdir
        original_path = cwd.path
        au_flags = ['-X', cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ['-e']

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(copied_files) == 1:
            descr = "extracting: " + os.path.basename(one_file.path)
        else:
            descr = "extracting files from: " + os.path.basename(one_file.dirname)
        obj = CommandLoader(args=['aunpack'] + au_flags \
                + [f.path for f in copied_files], descr=descr)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

class compress(Command):
    def execute(self):
        """ Compress marked files to current directory """
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(args=['apack'] + au_flags + \
                [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

    def tab(self):
        """ Complete with current folder name """

        extension = ['.zip', '.tar.gz', '.rar', '.7z']
        return ['compress ' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]

class MountLoader(Loadable, SignalDispatcher):
    """
    Wait until a directory is mounted
    """
    def __init__(self, path):
        SignalDispatcher.__init__(self)
        descr = "Waiting for dir '" + path + "' to be mounted"
        Loadable.__init__(self, self.generate(), descr)
        self.path = path

    def generate(self):
        available = False
        while not available:
            try:
                if os.path.ismount(self.path):
                    available = True
            except:
                pass
            yield
            time.sleep(0.03)
        self.signal_emit('after')

class mount(Command):
    def execute(self):
        selected_files = self.fm.thisdir.get_selection()

        if not selected_files:
            return

        space = ' '
        self.fm.execute_command("cdemu --bus system unload 0")
        self.fm.execute_command("cdemu --bus system load 0 " + \
                space.join([shell_escape(f.path) for f in selected_files]))
 
        mountpath = "/media/simon/"

        def mount_finished(path):
            currenttab = self.fm.current_tab
            self.fm.tab_open(9, mountpath)
            self.fm.tab_open(currenttab)

        obj = MountLoader(mountpath)
        obj.signal_bind('after', mount_finished)
        self.fm.loader.add(obj)

class fzf_select(Command):
    """
    :fzf_select
    Find a file using fzf.
    With a prefix argument select only directories.
    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        import os.path
        if self.quantifier:
            # match only directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        else:
            # match files and directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        fzf = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

# class pptx2pdf(Command):
#     def execute(self):
#         selected_files = self.fm.thisdir.get_selection()

#         for file in selected_files:
           
