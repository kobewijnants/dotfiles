from os.path import expanduser

config.load_autoconfig(True)

# ==============================================================================
# Global Vars
# ==============================================================================
js_scripts_directory = expanduser("~") + "/.config/qutebrowser/js"

c.downloads.location.directory = "~/Downloads"
c.editor.command = ["kitty", "-e", "nvim", "{}"]
c.editor.encoding = "utf-8"
c.scrolling.smooth = True
c.colors.webpage.darkmode.enabled = False
c.colors.webpage.preferred_color_scheme = "dark"

# ==============================================================================
# Search Engines
# ==============================================================================
c.url.searchengines = {
    "DEFAULT": "https://search.kobecloud.be/search?q={}",
    "google": "https://www.google.com/search?q={}",
    "ddg": "https://duckduckgo.com/?q={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "wiki": "https://en.wikipedia.org/wiki/{}",
    "arch": "https://wiki.archlinux.org/index.php?search={}",
    "aur": "https://aur.archlinux.org/packages/?O=0&K={}",
    "re": "https://www.reddit.com/search?q={}",
    "maps": "https://www.google.com/maps/search/{}",
    "gh": "https://github.com/search?q={}",
}

# Disable adblock
c.content.blocking.enabled = False

# ==============================================================================
# Keybindings
# ==============================================================================
# MPV bidnings
config.bind("e", "hint links spawn mpv {hint-url}")

# Download images
config.bind("I", "hint images download")

# ==============================================================================
# Theme
# ==============================================================================
background = "#32302f"
foreground = "#ebdbb2"
highlight = "#3c3836"
black = "#282828"
gray = "#928374"
lightgray = "#202020"
white = "#a89984"
red = "#cc241d"
lightred = "#fb4934"
green = "#98971a"
lightgreen = "#b8bb26"
orange = "#d79921"
yellow = "#fabd2f"
blue = "#458588"
lightblue = "#83a598"
magenta = "#b16286"
lightmagenta = "#d3869b"
cyan = "#689d6a"
lightcyan = "#8ec07c"

# ==================================== Fonts ===================================
# c.fonts.default_family = "Source Code Pro"
c.fonts.default_family = "Fira Code SemiBold"

# # ============================== Completion Widget =============================
# c.colors.completion.category.bg = background
# c.colors.completion.category.border.bottom = background
# c.colors.completion.category.border.top = gray
# c.colors.completion.category.fg = foreground
# c.colors.completion.even.bg = background
# c.colors.completion.odd.bg = background
# c.colors.completion.fg = [foreground, foreground, foreground]
# c.colors.completion.item.selected.bg = background
# c.colors.completion.item.selected.border.bottom = background
# c.colors.completion.item.selected.border.top = background
# c.colors.completion.item.selected.fg = yellow
# c.colors.completion.match.fg = yellow
# c.colors.completion.scrollbar.bg = background
# c.colors.completion.scrollbar.fg = foreground
#
# # ================================ Download Bar ================================
# c.colors.downloads.bar.bg = background
# c.colors.downloads.error.bg = red
# c.colors.downloads.error.fg = foreground
# c.colors.downloads.start.bg = blue
# c.colors.downloads.start.fg = foreground
# c.colors.downloads.stop.bg = green
# c.colors.downloads.stop.fg = foreground
#
# # =================================== Hinting ==================================
# c.colors.hints.bg = background
# c.colors.hints.fg = foreground
# c.colors.hints.match.fg = green
#
# # ================================== Keyhings ==================================
# c.colors.keyhint.bg = "rgba(0, 0, 0, 80%)"
# c.colors.keyhint.fg = foreground
# c.colors.keyhint.suffix.fg = yellow
#
# # ================================== Messages ==================================
# # ----------------------------------- Errors -----------------------------------
# c.colors.messages.error.bg = red
# c.colors.messages.error.border = red
# c.colors.messages.error.fg = foreground
#
# # ------------------------------------ Info ------------------------------------
# c.colors.messages.info.bg = background
# c.colors.messages.info.border = background
# c.colors.messages.info.fg = foreground
#
# # ---------------------------------- Warnings ----------------------------------
# c.colors.messages.warning.bg = background
# c.colors.messages.warning.border = background
# c.colors.messages.warning.fg = yellow
#
# # =================================== Prompts ==================================
# c.colors.prompts.bg = background
# c.colors.prompts.border = "3px solid " + background
# c.colors.prompts.fg = foreground
# c.colors.prompts.selected.bg = yellow
#
# # ==================================== Modes ===================================
# # -------------------------------- Command Mode --------------------------------
# c.colors.statusbar.command.bg = background
# c.colors.statusbar.command.fg = foreground
# c.colors.statusbar.command.private.bg = background
# c.colors.statusbar.command.private.fg = foreground
#
# # --------------------------------- Insert Mode --------------------------------
# c.colors.statusbar.insert.bg = blue
# c.colors.statusbar.insert.fg = foreground
#
# # --------------------------------- Normal Mode --------------------------------
# c.colors.statusbar.normal.bg = background
# c.colors.statusbar.normal.fg = foreground
#
# # ------------------------------ Passthrough Mode ------------------------------
# c.colors.statusbar.passthrough.bg = magenta
# c.colors.statusbar.passthrough.fg = foreground
#
# # -------------------------------- Private Mode --------------------------------
# c.colors.statusbar.private.bg = background
# c.colors.statusbar.private.fg = yellow
#
# # ==================================== URLs ====================================
# c.colors.statusbar.url.error.fg = orange
# c.colors.statusbar.url.fg = foreground
# c.colors.statusbar.url.hover.fg = foreground
# c.colors.statusbar.url.success.http.fg = foreground
# c.colors.statusbar.url.success.https.fg = "lime"
# c.colors.statusbar.url.warn.fg = yellow
#
# # ==================================== Tabs ====================================
# c.colors.tabs.selected.odd.bg = background
# c.colors.tabs.selected.odd.fg = foreground

# ==============================================================================
# Behaviour
# ==============================================================================
c.confirm_quit = ["downloads"]
c.content.cookies.accept = "no-3rdparty"
c.content.fullscreen.window = True
c.tabs.tabs_are_windows = False
c.tabs.show = "multiple"
c.spellcheck.languages = ["en-US", "nl-NL"]
c.url.default_page = "https://homepage.kobecloud.be"
c.url.start_pages = ["https://homepage.kobecloud.be"]

# Auto save session and open it on start
c.auto_save.session = True
c.session.default_name = "default"

# Theme
config.source("themes/gruvbox-theme.py")
