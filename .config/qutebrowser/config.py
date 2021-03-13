import pathlib
import os
import re
import sys
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401,E501 pylint: disable=unused-import
from qutebrowser.config.config import ConfigContainer  # noqa: F401,E501 pylint: disable=unused-import
config = config  # type: ConfigAPI # noqa: F821 pylint: disable=E0602,C0103
c = c  # type: ConfigContainer # noqa: F821 pylint: disable=E0602,C0103
###########################################################3
# ----------------------------------------------------------
# * Helper Functions
def bind(key, command, mode):  # noqa: E302
    """Bind key to command in mode."""
    # TODO set force; doesn't exist yet
    config.bind(key, command, mode=mode)

def nmap(key, command):
    """Bind key to command in normal mode."""
    bind(key, command, 'normal')

def imap(key, command):
    """Bind key to command in insert mode."""
    bind(key, command, 'insert')

def cmap(key, command):
    """Bind key to command in command mode."""
    bind(key, command, 'command')

#def pmap(key, command):
#    """Bind key to command in passthrough mode."""
#    bind(key, command, 'passthrough')

def unmap(key, mode):
    """Unbind key in mode."""
    config.unbind(key, mode=mode)

def nunmap(key):
    """Unbind key in normal mode."""
    unmap(key, mode='normal')


###########################################################
#              _       _
#   __ _ _   _| |_ ___| |__  _ __ _____      _____  ___ _ __
#  / _` | | | | __/ _ \ '_ \| '__/ _ \ \ /\ / / __|/ _ \ '__|
# | (_| | |_| | ||  __/ |_) | | | (_) \ V  V /\__ \  __/ |
#  \__, |\__,_|\__\___|_.__/|_|  \___/ \_/\_/ |___/\___|_|
#     |_|
#
###########################################################
# ~/.config/qutebrowser/config.py

# ** TODO alias
c.aliases = {
        "air":      "open -t http://web.airdroid.com/",
        "build_assistent": "open https://docs.google.com/spreadsheets/d/1MuyQI1GSxkdsaxuUV-QvU_7DOCRk-nIzhg0duosx0Ts/edit#gid=2081967336",
        "can":      "open -t http://localhost:631/admin",
        "df":       "open -t https://www.di.fm",
        "emoj":     "open -t https://emojify.cool/",
        "hex":      "open -t https://stackoverflow.com/questions/15852122/hex-transparency-in-colors",
        #"hexc":     "open -t https://www.google.com.ua/search?safe=strict&source=hp&ei=m3hsXJj9DuX5qwH5nLegCg&q=hex+color&btnK=%D0%9F%D0%BE%D1%88%D1%83%D0%BA+Google&oq=hex+color&gs_l=psy-ab.3...0.0..13999...0.0..0.0.0.......0......gws-wiz.",
        "gg":      "open -t https://www.google.com.sg/webhp?tab=ww",
        "gd":       "open -t https://drive.google.com/drive/my-drive",
        "gh":       "open -t https://github.com/KAlexandro82",
        "gpg":      "open -t https://eax.me/gpg/",
        "jwa":      "open -t https://apps.jw.org/U_00EE4B65-9AAB-47C8-B094-E9B53574DE36_ADMIN",
        'jwou':     "open -t https://wol.jw.org/ru/wol/h/r2/lp-u",
        'jwor':     "open -t https://wol.jw.org/rsl/wol/h/r2/lp-rsl",
        'jwok':     "open -t https://wol.jw.org/uk/wol/h/r2/lp-k",
        "jwmm":     "open -t http://our-ministry.ru",
        "jwr":      "open -t https://www.jw.org/rsl/",
        "jwk":      "open -t https://www.jw.org/uk",
        "jwu":      "open -t https://www.jw.org/ru",
        "lt":       "open -t https://www.linuxtoday.com/",
        "luk":      "open -t https://github.com/LukeSmithxyz/voidrice",
        "k":        "open -t https://vse10.ru/main/",
        "mo":       "open https://outlook.office.com/owa/?realm=gatech.edu",
        "ma":       "open https://bookdown.org/yihui/rmarkdown-cookbook/bibliography.html",
        "map_yandex": "open https://yandex.ru/maps/20553/konotop/geo/vyshneva_vulytsia/1449347102/?ll=33.194191%2C51.219324&z=17",
        "gdm":       "open -t https://docs.google.com/spreadsheets/d/1Z-0AZaGWbsSpYEXBoH0Rw-frp2HsZu8K/edit#gid=1579738534",
        "privat24": "open https://privat24.privatbank.ua/p24/web/#statements%2Fcards%2F4149499104792724",
        "s":        "open -t https://soundcloud.com/discover",
        "sd":       "open -t https://www.klickaud.co/",
        "pr":       "open -t https://proizd.ua/",
        'q':        'quit',
        "y":        "open -t https://youtube.com/",
        'yt':       'open -t http://tv.youtube.com',
        'w':        'session-save',
        'wq':       'quit --save'
        }

# ** TODO Search / start page
c.url.start_pages = 'file:///home/alex/www/OptimizedHTML-4-master/app/index.html'
c.url.default_page = 'file:///home/alex/www/OptimizedHTML-4-master/app/index.html'
c.url.auto_search = 'naive' # Valid values: naive, dns, never
c.url.incdec_segments = ['path', 'query'] # Valid values: host, path, query, anchor
c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content']
c.url.searchengines = {
'DEFAULT': "https://google.com.ua/?q={}",
"?gh": "https://github.com/{}",
"?gl": "https://gitlab.com/{}",
"?r": "https://reddit.com/r/{}",
"?ddg": "https://duckduckgo.com/?q={}&t=ha&iar=images",
"?i": "https://duckduckgo.com/?q={}&iar=images&iax=images&ia=images",
'?y': 'http://www.youtube.com/results?search_query={}',
"?rev": "https://revolutiontt.me/browse.php?search={}",
"?a": "https://wiki.archlinux.org/?search={}",
"?w": "https://en.wikipedia.org/?search={}",
"?wt": "http://en.wiktionary.org/?search={}",
"?g": "https://google.com/?search={}",
"?bc": "https://bandcamp.com/search?q={}",
"?lh": "https://lifehacker.com/search?q={}",
"?red": "https://reddit.com/r/{}",
"?map": "http://www.openstreetmap.org/search?query={}",
"?hack": "https://hackaday.com/?s={}",
"?im": "http://www.imdb.com/find?ref_=nv_sr_fn&q={}&s=all",
"?q": "https://github.com/qutebrowser/qutebrowser/issues?utf8=%E2%9C%93&q=is%3Aissue%20is%3Aopen%20{}",
}

# ** TODO Yanking and Pasting
# don't need primary or extra yanks
nmap('yd', 'yank domain')
nmap('yD', 'yank domain -s')
nmap('ym', 'yank inline [{title}]({url})')
nmap('yp', 'yank pretty-url')
nmap('yt', 'yank title')
nmap('yy', 'yank')
nmap('p', 'open --tab -- {clipboard}')
nmap('P', 'open -- {clipboard}')
config.unbind("yD")
config.unbind("yP")
config.unbind("yY")
config.unbind("yM")
config.unbind("yT")

# ** TODO Playing Videos with MPV
config.bind(',m', 'hint links spawn --detach mpv --force-window yes {hint-url}')
nmap('ty', 'spawn --detach mpv "{url}"')
config.bind(',s', 'spawn --detach mpv "{url}"')
config.bind(',a', 'spawn st -e youtube-dl --extract-audio --audio-format mp3 --output  "~/Videos/YouTube/audio/%(title)s,%(ext)s" {url}')
config.bind(',lwt', 'spawn st -e youtube-dl --extract-audio --audio-format mp3 --output  "/srv/http/lwt/media/%(title)s,%(ext)s" {url}')
config.bind(',v', 'spawn st -e youtube-dl --all-subs --output "~/Videos/%(title)s,%(ext)s" {url}')
nmap('tg', 'spawn --detach dlg "{url}"')

# ** TODO scripts
config.bind(',r','spawn --userscript translate')    # translate
# bookmarks
config.bind('o', 'spawn --userscript O_marks tab')
#config.bind('O', 'spawn --userscript O_quckmarks tab')
# dic
config.bind(',d', 'spawn --userscript dict')

# ** TODO Navigation
nmap('c', 'set-cmd-text :open --related {url:pretty}')          #open in current tab
nmap('C', 'set-cmd-text :open --tab --related {url:pretty}')    #open in news tab
nmap('d', 'scroll-page 0 0.5')
nmap('u', 'scroll-page 0 -0.5')
nmap('n', 'scroll-page 0 0.2')
nmap('e', 'scroll-page 0 -0.2')
nmap('J', 'tab-next')
nmap('K', 'tab-prev')
## tools tip: dublicate tab (yy, Pp)
nmap('tt',   'open -t')    # open homepage in new tab
nmap('tp', 'open -p')       # open new private window
nmap('tn', 'tab-move -')    # tn and te for tab moving
nmap('te', 'tab-move +')
config.unbind("T")
config.unbind("th")
config.unbind("tl")
config.unbind("tSh")
config.unbind("tSH")

# ** TODO Configuration
nmap(';', 'set-cmd-text :') # swap ; and :
nunmap(':')
nmap('td', 'download-open')
nmap('xc', 'download-clear')
nmap('xx', 'history-clear')
nmap('x',  'tab-close')
nmap('<Ctrl-p>', 'print')           ## PRINT
nmap('<Alt-p>', 'tab-pin')          ## TAB-PIN
# Editor
imap('<Ctrl-i>', 'open-editor')     # open source in editor
nmap('gF', 'view-source --edit')    # open source in editor
nmap('R', 'restart')                 # Restart qutebrowser (tab no change)
# zoom window
config.unbind("-")
config.bind("+", "zoom-in")
config.bind("=", "zoom-out")
config.bind("zz", "zoom")
c.zoom.default = '105%'
c.zoom.levels = ['50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%']
c.zoom.mouse_divider = 512
#c.zoom.text_only = False


# ** TODO Downloads
config.bind('<cf', 'set downloads.location.directory ~/.config ;; hint links download')
config.bind('<d', 'set downloads.location.directory ~/Documents ;; hint links download')
config.bind('<D', 'set downloads.location.directory ~/Downloads ;; hint links download')
config.bind('<h', 'set downloads.location.directory ~ ;; hint links download')
config.bind('<m', 'set downloads.location.directory ~/Music ;; hint links download')
config.bind('<r', 'set downloads.location.directory / ;; hint links download')
config.bind('<pp', 'set downloads.location.directory ~/Pictures ;; hint links download')
config.bind('<vv', 'set downloads.location.directory ~/Videos ;; hint links download')

c.downloads.location.directory = '~/Downloads/'
c.downloads.location.prompt = False
c.downloads.location.remember = False
c.downloads.location.suggestion = 'path' # Valid values: path, filename, both
c.downloads.open_dispatcher = None
c.downloads.position = 'top' # Valid values: top, bottom
#c.downloads.remove_finished = 500 # never remove (-1)
c.downloads.remove_finished = -1 # never remove (-1)



# ----------------------------------------------------------

# #--- Bindings for cycling through CSS stylesheets from Solarized Everything CSS ---# #
config.bind('>4', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/themes/css/solarized-light-all-sites.css ""')
config.bind('>2', 'config-cycle config.source(colorthemes)')


c.bindings.key_mappings = {
'<Ctrl-[>': '<Escape>',
'<Ctrl-6>': '<Ctrl-^>',
'<Ctrl-M>': '<Return>',
'<Ctrl-J>': '<Return>',
'<Shift-Return>': '<Return>',
'<Enter>': '<Return>',
'<Shift-Enter>': '<Return>',
'<Ctrl-Enter>': '<Ctrl-Return>'
}

# ** TODO passthrough
config.bind('<Ctrl-V>', 'enter-mode passthrough')
config.bind('<Ctrl-Z>', 'leave-mode', mode='passthrough')
# c.colors.statusbar.passthrough.bg = 'darkblue'
# c.colors.statusbar.passthrough.fg = 'white'

# ** TODO CARRET
#def tmap(key, command):
#    """Bind key to command in caret mode."""
#    bind(key, command, 'caret')
# config.bind('v', 'enter-mode caret')
# config.bind('$', 'move-to-end-of-line', mode='caret')
# config.bind('0', 'move-to-start-of-line', mode='caret')
# config.bind('<Ctrl-Space>', 'drop-selection', mode='caret')
# config.bind('<Escape>', 'leave-mode', mode='caret')
# config.bind('<Return>', 'yank selection', mode='caret')
# config.bind('<Space>', 'toggle-selection', mode='caret')
# config.bind('G', 'move-to-end-of-document', mode='caret')
# config.bind('H', 'scroll left', mode='caret')
# config.bind('J', 'scroll down', mode='caret')
# config.bind('K', 'scroll up', mode='caret')
# config.bind('L', 'scroll right', mode='caret')
# config.bind('Y', 'yank selection -s', mode='caret')
# config.bind('[', 'move-to-start-of-prev-block', mode='caret')
# config.bind(']', 'move-to-start-of-next-block', mode='caret')
# config.bind('b', 'move-to-prev-word', mode='caret')
# config.bind('c', 'enter-mode normal', mode='caret')
# config.bind('e', 'move-to-end-of-word', mode='caret')
# config.bind('gg', 'move-to-start-of-document', mode='caret')
# config.bind('h', 'move-to-prev-char', mode='caret')
# config.bind('j', 'move-to-next-line', mode='caret')
# config.bind('k', 'move-to-prev-line', mode='caret')
# config.bind('l', 'move-to-next-char', mode='caret')
# config.bind('o',,O'reverse-selection', mode='caret')
# config.bind('v', 'toggle-selection', mode='caret')
# config.bind('w', 'move-to-next-word', mode='caret')
# config.bind('y', 'yank selection', mode='caret')
# config.bind('{', 'move-to-end-of-prev-block', mode='caret')
# config.bind('}', 'move-to-end-of-next-block', mode='caret')

# ** TODO PROMPT
# config.bind('<Alt-B>', 'rl-backward-word', mode='prompt')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='prompt')
# config.bind('<Alt-D>', 'rl-kill-word', mode='prompt')
# config.bind('<Alt-F>', 'rl-forward-word', mode='prompt')
# config.bind('<Alt-Shift-Y>', 'prompt-yank --sel', mode='prompt')
# config.bind('<Alt-Y>', 'prompt-yank', mode='prompt')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='prompt')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='prompt')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='prompt')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='prompt')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='prompt')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='prompt')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='prompt')
# config.bind('<Ctrl-P>', 'prompt-open-download --pdfjs', mode='prompt')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='prompt')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='prompt')
# config.bind('<Ctrl-X>', 'prompt-open-download', mode='prompt')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='prompt')
# config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Escape>', 'leave-mode', mode='prompt')
# config.bind('<Return>', 'prompt-accept', mode='prompt')
# config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
# config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')

###########################################
#
# === COLOURS ===
#
###########################################
# Цвет фона заголовков категорий виджета завершения
c.colors.completion.even.bg = '#333333'
c.colors.completion.fg = 'white'
c.colors.completion.item.selected.bg = '#e8c000'
c.colors.completion.item.selected.border.bottom = '#bbbb00'
c.colors.completion.item.selected.border.top = '#bbbb00'
c.colors.completion.item.selected.fg = 'black'
c.colors.completion.match.fg = '#ff4444'
c.colors.completion.odd.bg = '#444444'
c.colors.completion.scrollbar.bg = '#333333'
c.colors.completion.scrollbar.fg = 'white'
c.colors.hints.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(255, 247, 133, 0.8), stop:1 rgba(255, 197, 66, 0.8))'
c.colors.hints.fg = 'black'
c.colors.hints.match.fg = 'green'
c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'
c.colors.keyhint.fg = '#FFFFFF'
c.colors.keyhint.suffix.fg = '#FFFF00'
c.colors.messages.error.bg = 'red'
c.colors.messages.error.border = '#bb0000'
c.colors.messages.error.fg = 'white'
c.colors.messages.info.bg = 'black'
c.colors.messages.info.border = '#333333'
c.colors.messages.info.fg = 'white'
c.colors.messages.warning.bg = 'darkorange'
c.colors.messages.warning.border = '#d47300'
c.colors.messages.warning.fg = 'white'

c.colors.statusbar.command.bg = 'black'
c.colors.statusbar.command.fg = 'white'
c.colors.statusbar.command.private.bg = 'grey'
c.colors.statusbar.command.private.fg = 'white'
c.colors.statusbar.insert.bg = 'darkgreen'
c.colors.statusbar.insert.fg = 'white'
c.colors.statusbar.normal.bg = 'black'
c.colors.statusbar.normal.fg = 'white'
c.colors.statusbar.private.bg = '#666666'
c.colors.statusbar.private.fg = 'white'
c.colors.statusbar.progress.bg = 'white'
c.colors.statusbar.url.error.fg = 'orange'
c.colors.statusbar.url.fg = 'white'
c.colors.statusbar.url.hover.fg = 'aqua'
c.colors.statusbar.url.success.http.fg = 'white'
c.colors.statusbar.url.success.https.fg = 'lime'
c.colors.statusbar.url.warn.fg = 'yellow'
c.colors.tabs.bar.bg = '#555555'
c.colors.tabs.even.bg = 'darkgrey'
c.colors.tabs.even.fg = 'white'
c.colors.tabs.indicator.error = '#ff0000'
c.colors.tabs.indicator.start = '#0000aa'
c.colors.tabs.indicator.stop = '#00aa00'
c.colors.tabs.indicator.system = 'rgb'
c.colors.tabs.odd.bg = 'grey'
c.colors.tabs.odd.fg = 'white'
c.colors.tabs.selected.even.bg = 'black'
c.colors.tabs.selected.even.fg = 'white'
c.colors.tabs.selected.odd.bg = 'black'
c.colors.tabs.selected.odd.fg = 'white'
c.colors.webpage.bg = 'white'

c.colors.prompts.bg = '#444444'
c.colors.prompts.border = '1px solid gray'
c.colors.prompts.fg = 'white'
c.colors.prompts.selected.bg = 'grey'

c.colors.statusbar.caret.bg = 'purple'
c.colors.statusbar.caret.fg = 'white'
c.colors.statusbar.caret.selection.bg = '#a12dff'
c.colors.statusbar.caret.selection.fg = 'white'

c.colors.downloads.bar.bg = 'black'
c.colors.downloads.error.bg = 'red'
c.colors.downloads.error.fg = 'white'
c.colors.downloads.start.bg = '#0000aa'
c.colors.downloads.start.fg = 'white'
c.colors.downloads.stop.bg = '#00aa00'
c.colors.downloads.stop.fg = 'white'
c.colors.downloads.system.bg = 'rgb'
c.colors.downloads.system.fg = 'rgb'

# Set colors
colorthemes = os.path.expanduser('~/.config/qutebrowser/themes/qutebrowser.py')
#config.source(colorthemes)
###########################################
#
#       SETTING
#
###########################################
# Uncomment this to still load settings configured via autoconfig.yml
config.load_autoconfig()

c.auto_save.interval = 15000
c.auto_save.session = False
c.content.autoplay = False      # ** Media
c.completion.cmd_history_max_items = 100 # no history (0) unlimited (-1)
c.completion.height = '50%'
c.completion.quick = True
c.completion.scrollbar.padding = 2
c.completion.scrollbar.width = 12
c.completion.show = 'always' # Valid values: always, never, auto
c.completion.shrink = False
c.completion.timestamp_format = '%Y-%m-%d'
c.completion.web_history.max_items = -1 # no history (0) unlimited (-1)

c.confirm_quit = ['never'] # Valid values: always, never, multiple-tabs, downloads

c.content.cache.appcache = True
c.content.cache.maximum_pages = 0
c.content.cache.size = None
c.content.cookies.accept = 'no-3rdparty' # Valid values: all, no-3rdparty, no-unknown-3rdparty, never
c.content.cookies.store = True
c.content.default_encoding = 'iso-8859-1'
c.content.dns_prefetch = True
c.content.frame_flattening = False
c.content.geolocation = 'ask' # Valid values: true, false, ask
c.content.headers.accept_language = 'en-US,en'
c.content.headers.custom = {}
c.content.headers.do_not_track = True
c.content.headers.referer = 'same-domain' # Valid values: always, never, same-domain
#c.content.headers.user_agent = None
##c.content.host_blocking.enabled = True
##c.content.host_blocking.lists = ['https://www.malwaredomainlist.com/hostslist/hosts.txt', 'http://someonewhocares.org/hosts/hosts', 'http://winhelp2002.mvps.org/hosts.zip', 'http://malwaredomains.lehigh.edu/files/justdomains.zip', 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext']
##c.content.host_blocking.whitelist = ['piwik.org', 'www.googleadservices.com']
c.content.hyperlink_auditing = False
c.content.images = True

c.content.javascript.alert = True
c.content.javascript.can_access_clipboard = False
c.content.javascript.can_close_tabs = False
c.content.javascript.can_open_tabs_automatically = False
c.content.javascript.enabled = True
c.content.javascript.log = {'unknown': 'debug', 'info': 'debug', 'warning': 'debug', 'error': 'debug'}
c.content.javascript.modal_dialog = False
c.content.javascript.prompt = True

c.content.local_content_can_access_file_urls = True
c.content.local_content_can_access_remote_urls = False
c.content.local_storage = True
c.content.netrc_file = None
config.set("content.notifications", False)
config.set("content.pdfjs", True)
c.content.plugins = False
c.content.print_element_backgrounds = True
c.content.private_browsing = False
c.content.proxy = 'system' # Valid values: system, none, socks://..., http://...
c.content.proxy_dns_requests = True
c.content.ssl_strict = 'ask' # Valid values: true, false, ask
c.content.user_stylesheets = []
c.content.webgl = True
c.content.xss_auditing = False

config.set("editor.command", ["vim", "{file}"])
c.editor.encoding = 'utf-8'


###########################################
#
#       FONTS
#
###########################################
c.fonts.web.family.cursive = ''
c.fonts.web.family.fantasy = ''
c.fonts.web.family.fixed = ''
c.fonts.web.family.sans_serif = ''
c.fonts.web.family.serif = ''
c.fonts.web.family.standard = ''
c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 13
c.fonts.web.size.minimum = 0
c.fonts.web.size.minimum_logical = 6
c.fonts.default_family = '"JetBrains Mono Medium"'
c.fonts.default_size = '11pt'
c.fonts.completion.entry = '11pt "JetBrains Mono Medium"'
c.fonts.debug_console = '11pt "JetBrains Mono Medium"'
c.fonts.statusbar = '11pt "JetBrains Mono Medium"'
c.fonts.prompts = 'default_size sans-serif'

###########################################
#
#       Hints
#
###########################################
c.hints.auto_follow = 'always' # Valid values: always, never, unique-match, full-match
c.hints.auto_follow_timeout = 0
c.hints.border = '1px solid #E3BE23'
c.hints.chars = 'asdfghjkl'
c.hints.dictionary = '/usr/share/dict/words'
c.hints.find_implementation = 'python' # Valid values: javascript, python
c.hints.hide_unmatched_rapid_hints = True
c.hints.min_chars = 1
c.hints.mode = 'letter' # Valid values: number, letter, word
c.hints.next_regexes = ['\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b', '\\bcontinue\\b']
c.hints.prev_regexes = ['\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<←≪]\\b', '\\b(<<|«)\\b']
c.hints.scatter = True
c.hints.uppercase = False


c.history_gap_interval = 30 # disable separation (-1)

c.input.forward_unbound_keys = 'auto' # Valid values: all, auto, none
c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_load = False
c.input.insert_mode.plugins = False
c.input.links_included_in_focus_chain = True
c.input.partial_timeout = 5000
#c.input.rocker_gestures = False
c.input.spatial_navigation = False

c.keyhint.blacklist = []
c.keyhint.delay = 500

c.messages.timeout = 2000 # never (0)

c.new_instance_open_target = 'tab' # Valid values: tab, tab-bg, tab-silent, tab-bg-silent, window
c.new_instance_open_target_window = 'last-focused' # Valid values: first-opened, last-opened, last-focused, last-visible

c.prompt.filebrowser = True
c.prompt.radius = 8

c.qt.args = []
#c.qt.force_platform = None
c.qt.force_software_rendering = 'none' # chromium; qt-quick; software-opengl; none

c.scrolling.smooth = False

c.search.ignore_case = 'smart' # Valid values: always, never, smart

c.session.default_name = None

c.spellcheck.languages = []

#c.statusbar.hide = False
c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 0, 'right': 0}

c.tabs.background = False
c.tabs.close_mouse_button = 'middle' # Valid values: right, middle, none
c.tabs.favicons.scale = 1.0
c.tabs.favicons.show = 'always'
c.tabs.indicator.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 4}
c.tabs.indicator.width = 3
c.tabs.last_close = 'startpage' # Valid values: ignore, blank, startpage, default-page, close
c.tabs.mousewheel_switching = True
c.tabs.new_position.related = 'next' # Valid values: prev, next, first, last
c.tabs.new_position.unrelated = 'last' # Valid values: prev, next, first, last
c.tabs.padding = {'bottom': 0, 'top': 0, 'left': 5, 'right': 5}
c.tabs.position = 'bottom' # Valid values: top, bottom, left, right
c.tabs.select_on_remove = 'next' # Valid values: prev, next, last-used
c.tabs.show = 'multiple' # Valid values: always, never, multiple, switching
c.tabs.show_switching_delay = 800
c.tabs.tabs_are_windows = False
c.tabs.title.alignment = 'left'
#c.tabs.title.format = '{index}: {title}'
#c.tabs.title.format_pinned = '{index}'
c.tabs.width = '20%'
c.tabs.wrap = True

c.window.hide_decoration = False
#c.window.title_format = "{private}{perc}{title}{title_sep}qutebrowser"


# Enable JavaScript.
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')


# TODO unbinding in normal mode
config.unbind("wO")
config.unbind("wP")
config.unbind("wi")
config.unbind("wl")
config.unbind("wf")
config.unbind("wb")
config.unbind("wIh")
config.unbind("wIj")
config.unbind("wIk")
config.unbind("wIl")
config.unbind("wIf")
config.unbind("wIw")
config.unbind("wp")
config.unbind("wo")
config.unbind("wh")
config.unbind("wB")
# TODO unbinding in command mode
