import dracula.draw
import nyan

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

c.aliases = {'copy-urls': 'spawn --userscript copy-urls', 'json': 'spawn --userscript format_json', 'pocket': 'spawn --userscript qutepocket', 'w': 'session-save', 'q': 'quit', 'wq': 'quit --save'}
c.auto_save.session = True
c.session.lazy_restore = True
c.content.autoplay = False
c.content.javascript.can_open_tabs_automatically = False
c.content.netrc_file = None
c.content.pdfjs = False
c.completion.use_best_match = True
c.hints.next_regexes = ['\\bvolgende\\b', '\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b', '\\bcontinue\\b']
c.hints.prev_regexes = ['\\bvorige\\b', '\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<←≪]\\b', '\\b(<<|«)\\b']
c.input.insert_mode.auto_load = False
c.tabs.background = True
c.tabs.mousewheel_switching = False
c.tabs.new_position.unrelated = 'next'
c.tabs.padding = {'bottom': 0, 'left': 5, 'right': 5, 'top': 0}
c.tabs.position = 'left'
c.tabs.select_on_remove = 'next'
c.tabs.title.format = '{audio}{private}{index}: {title}'
c.url.default_page = 'about:blank'
c.url.incdec_segments = ['path', 'query']
c.url.open_base_url = True
c.url.searchengines = {'DEFAULT': 'https://www.google.be/search?q={}', 'g': 'https://www.google.be/search?q={}', 'd': 'https://duckduckgo.com/?q={}', 'gi': 'https://www.google.be/search?tbm=isch&q={}', 'ipt': 'https://www.iptorrents.com/t?q={}&o=size#torrents', 'rut': 'https://rutracker.org/forum/tracker.php?nm={}', 'w': 'https://www.wikipedia.org/search-redirect.php?family=wikipedia&language=en&search={}&language=en&go=Go', 'tr': 'https://translate.google.com/#nl/en/{}', 'r': 'https://www.reddit.com/search?q={}&restrict_sr=&include_over_18=on&sort=relevance&t=all', 'yt': 'https://www.youtube.com/results?search_query={}', 'tv': 'https://www.thetvdb.com/search?q={}&l=en', 'rym': 'https://rateyourmusic.com/search?searchtype=a&searchterm={}', 'ud': 'https://www.urbandictionary.com/define.php?term={}', 'e': 'https://www.benl.ebay.be/sch/i.html?_from=R40&LH_PrefLoc=3&_osacat=0&_nkw={}', 't': 'http://www.thesaurus.com/browse/{}', 'gh': 'https://github.com/search?q={}', 'aur': 'https://aur.archlinux.org/packages/?O=0&SeB=nd&K={}&outdated=&SB=n&SO=a&PP=50', 'at': 'https://alternativeto.net/software/{}/', 'emp': 'https://www.empornium.me/torrents.php?taglist={}', 'syn': 'https://synoniemen.net/index.php?zoekterm={}', '4': 'https://boards.4chan.org/{}/', 'aw': 'https://wiki.archlinux.org/index.php/{}'}
c.url.start_pages = 'about:blank'
c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content']

config.bind(';v', 'spawn mpv {url}')
config.bind(';y', 'hint --rapid links yank')
config.bind('<Ctrl+Tab>', 'tab-next')
config.bind('<Ctrl+Shift+Tab>', 'tab-prev')
config.bind('<Ctrl+Shift+r>', 'config-source')
config.bind('<Ctrl+b>', 'open qute://bookmarks')
config.bind('<Ctrl+h>', 'open qute://history')
config.bind('<Ctrl+f>', 'set-cmd-text /')
config.bind('<Ctrl+k>', 'set-cmd-text --space :open g')
config.bind('<Ctrl+l>', 'set-cmd-text --space :open')
config.bind('<Ctrl+m>', 'tab-mute')
config.bind('<Ctrl+s>', 'open qute://settings')
config.bind('<Ctrl+t>', 'open -t;; set-cmd-text --space :open')
config.bind('<Ctrl+u>', 'view-source')
config.bind('T', 'set-cmd-text -s :buffer')
config.bind('X', 'undo')
config.bind('b', 'set-cmd-text -s :buffer')
config.bind('co', None)
config.bind('d', 'scroll-page 0 0.5')
config.bind('gl', 'tab-focus last')
config.bind('gn', 'open -t')
config.bind('gs', 'open -b {primary}')
config.bind('gx', 'config-cycle -p -t tabs.select_on_remove prev next')
config.bind('sc', 'spawn curl {url} -O')
config.bind('sp', 'spawn --userscript qutepocket')
config.bind('tt', 'config-cycle -p -t tabs.select_on_remove prev next')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('x', 'tab-close')
config.bind('{', 'tab-move -')
config.bind('}', 'tab-move +')

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    },
    'font': {
        'family': 'Menlo, Terminus, Monaco, Monospace',
        'size': 10
    }
})

