
# =============================================================================
#                           QuteBrowser config
# =============================================================================

# config inspirations:
#     * ii.com/qutebrowser-configpy

#                                                                       GENERAL
# =============================================================================

# start page
c.url.start_pages = ['mader.xyz/qutebrowser']
# default zoom level
c.zoom.default = '200%'
# downloads directory
c.downloads.location.directory = '/home/vinc/downloads'

# no confirmation before quit, because: always restore last session anyways
c.confirm_quit = ['never']
c.auto_save.session = True

# maximum number of cache & undo items
c.content.cache.maximum_pages = 1000
c.tabs.undo_stack_size = -1  # undo items per tab: infinityyyyyyy

# do not automatically start playing videos
c.content.autoplay = False
# allow websites to read canvas (needed for some sites)
c.content.canvas_reading = True

# cookies
c.content.cookies.accept = 'all'
c.content.cookies.store = True

#                                                                SEARCH ENGINES
# =============================================================================
c.url.searchengines = {
    # web search engines
    'DEFAULT':  'https://google.com/search?q={}',
    'ddg': 'https://duckduckgo.com/?q={}',
    # encyclopedias
    'aw':       'https://wiki.archlinux.org/?search={}',
    'ud':       'https://urbandictionary.com/define.php?term={}',
    'w':        'https://en.wikipedia.org/?search={}',
    'wt':       'https://en.wiktionary.org/?search={}',
    # social
    'li':       'https://linkedin.com/search/results/all/?keywords={}',
    'tw':       'https://twitter.com/{}',
    # github
    'gh':       'https://github.com/search?q={}',
    'ghu':      'https://github.com/{}',
    'ghv':      'https://github.com/vincentmader/{}',
    # shopping
    'az':       'https://amazon.de/s?k={}',
    'eb':       'https://ebay.com/sch/{}',
    'ebk':      'https://ebay-kleinanzeigen.de/s-{}/k0',
    # misc
    '4':        'https://4chan.org/{}',
    'pb':       'https://piratebay.party/search/{}/1/99/0',
    'r':        'https://reddit.com/r/{}',
    'yt':       'https://youtube.com/results?search_query={}',
}


#                                                             COMPLETION WINDOW
# =============================================================================

# minimum number of chars needed to update completion list (for :open cmd)
c.completion.min_chars = 1
# order of categories shown in the completion window
c.completion.open_categories = [
    'searchengines', 'quickmarks', 'bookmarks', 'history'
]
# quick-completion when there is only one entry
c.completion.quick = True

# do not shrink the completion window to be smaller if there are no scrollbars
c.completion.shrink = False
# number of items to in history (-1 -> infinite)
c.completion.web_history.max_items = -1
# history items to hide in completion
c.completion.web_history.exclude = []

#                                                                      MAPPINGS
# =============================================================================

# aliases
c.aliases = {
    'w': 'session-save',
    'wq': 'quit --save',
    'wqa': 'quit --save',
    'q': 'close',
    'qa': 'quit',
}
# bindings
c.bindings.commands['normal'] = {
    '<ctrl-tab>': 'tab-next',
    '<ctrl-shift-tab>': 'tab-prev',
    'zz': 'quit',
}

#                                                                    APPEARANCE
# =============================================================================

# set default fonts
c.fonts.default_family = 'Hack Nerd Font'
c.fonts.default_size = '20pt'
c.fonts.completion.entry = '16pt Hack Nerd Font'
c.fonts.statusbar = '16pt Hack Nerd Font'
c.fonts.tabs.selected = '16pt Hack Nerd Font'
c.fonts.tabs.unselected = '16pt Hack Nerd Font'
c.fonts.hints = '20pt Hack Nerd Font'
# set font paddings
c.tabs.padding = {'bottom': 12, 'top': 12, 'right': 5, 'left': 5}
c.statusbar.padding = {'bottom': 12, 'top': 12, 'right': 5, 'left': 5}
# set font color for successfully loaded urls
c.colors.statusbar.url.success.https.fg = 'white'

# tab bar
c.tabs.position = 'top'
c.tabs.min_width = 300
c.tabs.favicons.scale = 1.0
c.tabs.title.format = '{audio} {current_title}'
# completion window
c.completion.height = '50%'
c.completion.scrollbar.width = 10  # completion scrollbar handle width in px
c.completion.scrollbar.padding = 2  # handle padding in px

# render all pages with dark mode
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.prefers_color_scheme_dark = True
# c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
# c.colors.webpage.darkmode.contrast = 0.0
# c.colors.webpage.darkmode.grayscale.all = False
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.bg = '#222222'
c.colors.tabs.odd.bg = '#222222'
c.colors.tabs.even.bg = '#555555'

# stylesheets
# c.content.user_stylesheets = [
#     './themes/solarized-dark.css',
#     './themes/custom_solarized.css'
# ]
# c.content.user_stylesheets = 'solarized.css'
