
# =============================================================================
#                           QuteBrowser config
# =============================================================================
#
# config inspirations:
#     * ii.com/qutebrowser-configpy

#                                                                       GENERAL
# =============================================================================
# always restore last session
c.auto_save.session = True
# do not require confirmation before quitting
c.confirm_quit = ['never']
# automatically start playing videos
c.content.autoplay = True
# maximum number of items in cache
# c.content.cache.maximum_pages = -1
# allow websites to read canvas (needed for some sites)
c.content.canvas_reading = True
# cookies
c.content.cookies.accept = 'all'
c.content.cookies.store = True
# maximum number of undo items to save (per tab)
c.tabs.undo_stack_size = -1
# disable video playback
c.content.autoplay = False

#                                                                SEARCH ENGINES
# =============================================================================
c.url.searchengines = {
    # 'DEFAULT': 'https://duckduckgo.com/?q={}',
    'DEFAULT': 'https://google.com/search?q={}',
    'aw': 'https://wiki.archlinux.org/?search={}',
    'yt': 'https://youtube.com/results?search_query={}',
    'tw': 'https://twitter.com/{}',
    'r': 'https://reddit.com/r/{}',
    '4': 'https://4chan.org/{}',
    'w': 'https://en.wikipedia.org/?search={}',
    'wt': 'https://en.wiktionary.org/?search={}',
    'eb': 'https://ebay.com/sch/{}',
    'ebk': 'https://ebay-kleinanzeigen.de/s-{}/k0',
    'az': 'https://amazon.de/s?k={}',
    # 'tpb': 'https://thepiratebay.org/search/{}',
}


#                                                                    COMPLETION
# =============================================================================
# minimum number of chars needed to update completion list (for :open cmd)
c.completion.min_chars = 1
# height of window
c.completion.height = '50%'
# order of categories shown in the completion window
c.completion.open_categories = [
    'searchengines', 'quickmarks', 'bookmarks', 'history'
]
# quick-completion when there is only one entry
c.completion.quick = True
# padding (in px) of the scrollbar handle in the completion window
c.completion.scrollbar.padding = 2
# width of scrollbar handle in the completion window
c.completion.scrollbar.width = 10
# do not shrink the completion window to be smaller if there are no scrollbars
c.completion.shrink = False
# number of items to in history (-1 -> infinite)
c.completion.web_history.max_items = -1
# history items to hide in completion
c.completion.web_history.exclude = []
# default page
# c.url.default_page = 'https://mynoise.net/Data/OCEAN/fb.jpg'
#                                                                      MAPPINGS
# =============================================================================
# aliases
c.aliases = {
    'w': 'session-save', 'q': 'close', 'qa': 'quit',
    'wq': 'quit --save', 'wqa': 'quit --save',
}
# bindings
c.bindings.commands['normal'] = {
    # tab switching
    '<ctrl-tab>': 'tab-next',
    '<ctrl-shift-tab>': 'tab-prev',
    'zz': 'quit',
}
#                                                                        VISUAL
# =============================================================================
# position of tab bar
c.tabs.position = 'top'
# render all pages with dark mode
# c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
# c.colors.webpage.darkmode.contrast = 0.0
# c.colors.webpage.darkmode.grayscale.all = False
# c.colors.webpage.darkmode.policy.images = 'never


# c.content.user_stylesheets = [
#     './themes/solarized-dark.css',
#     './themes/custom_solarized.css'
# ]

c.fonts.hints = 'Hack Nerd Font'  # TODO: increase font size
