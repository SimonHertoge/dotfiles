# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

# define timeout for multipurpose_modmap
define_timeout(1)

# [Global modemap] Change modifier keys as in xmodmap
# define_modmap({
#     Key.CAPSLOCK: Key.LEFT_CTRL
# })

# [Multipurpose modmap] Give a key two meanings. A normal key when pressed and
# released, and a modifier key when held down with another key. See Xcape,
# Carabiner and caps2esc for ideas and concept.
define_multipurpose_modmap({
    # Enter is enter when pressed and released. Control when held down.
    # Key.ENTER: [Key.ENTER, Key.RIGHT_CTRL],

    # Capslock is escape when pressed and released. Control when held down.
    Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL]
    # To use this example, you can't remap capslock with define_modmap.
})

# Terminal
define_keymap(lambda wm_class: wm_class in ("XTerm", "URxvt", "St"), {
    # Fish alt-arrow functions
    K("C-Shift-b"): K("M-left"),
    K("C-Shift-f"): K("M-right"),
    K("C-Shift-p"): K("M-up"),
    K("C-Shift-n"): K("M-down"),

    # Ctrl-backspace
    K("C-Backspace"): K("M-Backspace"),
})

# Browser
define_keymap(lambda wm_class: wm_class in ("firefoxdeveloperedition"), {
    # Switch tabs
    K("M-t"): [K("C-l"), K("Shift-Key_5"), K("Space")]
}, "Firefox")

# Everywhere but terminal
define_keymap(lambda wm_class: wm_class not in ("Emacs", "URxvt", "XTerm", "St", "Subl3"), {
    # Emacs Cursor
    K("C-b"): with_mark(K("left")),
    K("C-f"): with_mark(K("right")),
    K("C-p"): K("up"),
    K("C-n"): K("down"),

    # Forward/Backward word
    K("M-b"): with_mark(K("C-left")),
    K("M-f"): with_mark(K("C-right")),

    # Page up/down
    K("M-p"): K("page_up"),
    K("M-n"): K("page_down"),

    # Beginning/End of line
    K("C-a"): K("home"),
    K("C-e"): K("end"),

    # Beginning/End of file
    K("M-Shift-comma"): K("C-home"),
    K("M-Shift-dot"): K("C-end"),

    # Newline
    K("C-m"): K("enter"),

    # Backspace
    # K("C-h"): K("backspace"),
    K("M-backspace"): K("C-backspace"),

    # Delete
    K("C-d"): [K("delete"), set_mark(False)],
    K("M-d"): [K("C-delete"), set_mark(False)],

    # Kill line
    # K("C-k"): [K("Shift-end"), K("C-x"), toggle_mark()],
    # K("C-u"): [K("C-a"), K("delete")],

    # Mark
    K("C-space"): toggle_mark(),

    # Select all
    K("C-Shift-a"): K("C-a"),

    # Search
    K("C-Shift-f"): K("C-f"),
    K("C-g"): K("F3"),
    K("C-Shift-g"): K("Shift-F3"),

    # Escape
    K("C-q"): escape_next_key,

    # Type C-j to focus to the content
    K("C-j"): K("f6"),

    # very naive "Edit in editor" feature (just an example)
    # K("C-o"): [K("C-a"), K("C-c"), launch(["gedit"]), sleep(0.5), K("C-v")]
}, "Emacs-like keys")

# # Everywhere
# define_keymap(lambda wm_class: wm_class, {
#     # Vim Cursor
#     K("M-h"): with_mark(K("left")),
#     K("M-l"): with_mark(K("right")),
#     K("M-k"): with_mark(K("up")),
#     K("M-j"): with_mark(K("down")),
# })

