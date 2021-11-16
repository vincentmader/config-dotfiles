
# ================================================
#                               QuteBrowser config
# ================================================

# config inspirations:
#     * ii.com/qutebrowser-configpy

#                                          GENERAL
# ================================================
#                                          startup
config.load_autoconfig(False)
c.url.start_pages = ['mader.xyz']  
#                                             exit
c.confirm_quit = ['never']
c.auto_save.session = True
#                    max.nr. of cache & undo items
c.content.cache.maximum_pages = 1000
c.tabs.undo_stack_size = -1  
#                                          cookies
c.content.cookies.accept = 'all'
c.content.cookies.store = True
#                                          various
c.content.autoplay = False  
c.content.canvas_reading = True  # (needed for some sites)

#                                   SEARCH ENGINES
# ================================================

c.url.searchengines = {
    # web search engines
    # --------------------------------------------
    'DEFAULT':  'https://google.com/search?q={}',
    'ddg': 'https://duckduckgo.com/?q={}',
    # encyclopedias
    # --------------------------------------------
    'aw':       'https://wiki.archlinux.org/?search={}',
    'ud':       'https://urbandictionary.com/define.php?term={}',
    'w':        'https://en.wikipedia.org/?search={}',
    'wt':       'https://en.wiktionary.org/?search={}',
    # social
    # --------------------------------------------
    'li':       'https://linkedin.com/search/results/all/?keywords={}',
    'tw':       'https://twitter.com/{}',
    # github
    # --------------------------------------------
    'gh':       'https://github.com/search?q={}',
    'ghu':      'https://github.com/{}',
    'ghv':      'https://github.com/vincentmader/{}',
    # shopping
    # --------------------------------------------
    'az':       'https://amazon.de/s?k={}',
    'eb':       'https://ebay.de/sch/{}',
    'ebk':      'https://ebay-kleinanzeigen.de/s-{}/k0',
    # misc
    # --------------------------------------------
    '4':        'https://4chan.org/{}',
    'pb':       'https://piratebay.party/search/{}/1/99/0',
    'r':        'https://reddit.com/r/{}',
    'ta':       'http://xn--tierarztpraxis-schuffelen-2ec.de/gallery_{}.html',
    'yt':       'https://youtube.com/results?search_query={}',
}
#                                         MAPPINGS
# ================================================
#                                          aliases
c.aliases = {
    'w': 'session-save',
    'wq': 'quit --save',
    'wqa': 'quit --save',
    'q': 'close',
    'qa': 'quit',
}
#                                     key bindings
c.bindings.commands['normal'] = {
    ',.': 'set tabs.show always',
    ',,': 'set tabs.show never',
}

#                            COLOR PALETTE & FONTS
# ================================================
#                                color definitions
# ------------------------------------------------
color_bg = '#222222'      # background
color_black = '#000000'   # black
color_white = '#FFFFFF'   # white
color_blue = '#268BD2'    # blue
color_dark_gray = '#111111'  # gray (border color)
color_border = '#666666'  # gray (border color)
#                                            fonts
# ------------------------------------------------
#                            default family & size
c.fonts.default_family = 'Hack Nerd Font'
c.fonts.default_size = '18pt'
#                                          various
c.fonts.statusbar = '18pt Hack Nerd Font'
c.fonts.completion.entry = '20pt Hack Nerd Font'
c.fonts.completion.category = '20pt Hack Nerd Font'
c.fonts.tabs.selected = '15pt Hack Nerd Font'
c.fonts.tabs.unselected = '15pt Hack Nerd Font'
c.fonts.hints = '18pt Hack Nerd Font'
#                                    font paddings
c.tabs.padding = { 
    'top':     9, 
    'bottom':  9, 
    'left':    5, 
    'right':   5 
}
c.statusbar.padding = { 
    'top':     9, 
    'bottom':  9, 
    'left':    5, 
    'right':   5 
}

#                                        DOWNLOADS
# ================================================
#                           download save location
c.downloads.location.directory = '/home/vinc/downloads'
#                                           colors
c.colors.downloads.bar.bg = color_black
c.colors.downloads.start.bg = color_black
c.colors.downloads.start.fg = color_white
c.colors.downloads.stop.bg = color_black
c.colors.downloads.stop.fg = color_blue
c.colors.downloads.error.bg = color_black
c.colors.downloads.error.fg = "red"

#                                       APPEARANCE
# ================================================
c.colors.webpage.bg = color_bg
#                               default zoom level
c.zoom.default = '200%'  # -> TODO: auto-set on mac/legion
#                      visibility of status/scroll
c.statusbar.show = 'in-mode'
c.scrolling.bar = 'never'
c.completion.scrollbar.width = 0  
c.completion.scrollbar.padding = 0  
#                                 interface colors
c.colors.prompts.bg = color_black
c.colors.prompts.fg = color_blue
c.colors.prompts.border = f"3px solid {color_blue}" # TODO: no border shown?
c.colors.completion.scrollbar.fg = color_blue
c.colors.completion.scrollbar.bg = color_bg

#                                       STATUS BAR
# ================================================
#                                           colors
# ------------------------------------------------
# c.colors.statusbar.normal.bg = color_bg
c.colors.statusbar.url.hover.fg = color_blue
# c.colors.statusbar.caret.bg = "red"
c.colors.statusbar.command.bg = color_bg
c.colors.statusbar.insert.bg = color_bg
c.colors.statusbar.insert.fg = color_blue
# c.colors.statusbar.normal.bg = "red"
# c.colors.statusbar.prompt.bg = color_black
#                col. for successfully loaded urls
c.colors.statusbar.url.success.https.fg = 'white'

#                                          TAB BAR
# ================================================
c.tabs.title.format = '{current_title}' 
c.tabs.position = 'left'
c.tabs.show = 'multiple'
#                               tab bar size/width
# ------------------------------------------------
c.tabs.favicons.scale = 1.5
c.tabs.width = '23%'
c.tabs.min_width = -1  # 300
c.tabs.max_width = -1
# ------------------------------------------------
#                                   tab bar colors
c.colors.tabs.bar.bg = color_dark_gray
# unselected
c.colors.tabs.odd.bg = color_dark_gray
c.colors.tabs.even.bg = color_dark_gray
c.colors.tabs.odd.fg = color_white
c.colors.tabs.even.fg = color_white
# selected
c.colors.tabs.selected.odd.bg = color_bg
c.colors.tabs.selected.even.bg = color_bg
c.colors.tabs.selected.odd.fg = color_blue
c.colors.tabs.selected.even.fg = color_blue

#                                COMPLETION WINDOW
# ================================================
# quick-completion when there is only 1 entry
c.completion.quick = True
# min.nr. of chars needed to update list
c.completion.min_chars = 1
#                              order of categories
# ------------------------------------------------
c.completion.open_categories = [
    'searchengines', 
    'quickmarks', 
    'bookmarks', 
    'history'
]
#                                          history
# ------------------------------------------------
# number of items to save
c.completion.web_history.max_items = -1
# items to hide in completion
c.completion.web_history.exclude = []
#                                       appearance
# ------------------------------------------------
c.completion.height = '50%'
c.completion.shrink = False  # const.
#                                completion colors
# background
c.colors.completion.category.bg = color_bg
c.colors.completion.odd.bg = color_black
c.colors.completion.even.bg = color_black
c.colors.completion.item.selected.bg = color_blue
# foreground
c.colors.completion.category.fg = color_white
c.colors.completion.fg = color_blue
c.colors.completion.item.selected.fg = color_black
c.colors.completion.match.fg = color_white
c.colors.completion.item.selected.match.fg = color_white
# borders
c.colors.completion.category.border.top = color_border
c.colors.completion.category.border.bottom = color_border
c.colors.completion.item.selected.border.top = color_blue
c.colors.completion.item.selected.border.bottom = color_blue

#                                        DARK MODE
# ================================================
# render all pages with dark mode
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.preferred_color_scheme = "dark"
# c.colors.webpage.prefers_color_scheme_dark = True
# c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
# c.colors.webpage.darkmode.contrast = 0.0
# c.colors.webpage.darkmode.grayscale.all = False
# c.colors.webpage.darkmode.policy.images = 'never'
# stylesheets
# c.content.user_stylesheets = [
#     './themes/solarized-dark.css',
#     './themes/custom_solarized.css'
# ]
# c.content.user_stylesheets = 'solarized.css'

