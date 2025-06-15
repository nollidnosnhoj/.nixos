{pkgs, ...}: {
  home.packages = with pkgs; [
    walker
  ];
  home.file.".config/walker/config.toml".text = ''
    app_launch_prefix = ""
    terminal_title_flag = ""
    locale = ""
    close_when_open = false
    theme = "nord"
    monitor = ""
    hotreload_theme = false
    as_window = false
    timeout = 0
    disable_click_to_close = false
    force_keyboard_focus = false

    [keys]
    accept_typeahead = ["tab"]
    trigger_labels = "lalt"
    next = ["down"]
    prev = ["up"]
    close = ["esc"]
    remove_from_history = ["shift backspace"]
    resume_query = ["ctrl r"]
    toggle_exact_search = ["ctrl m"]

    [keys.activation_modifiers]
    keep_open = "shift"
    alternate = "alt"

    [keys.ai]
    clear_session = ["ctrl x"]
    copy_last_response = ["ctrl c"]
    resume_session = ["ctrl r"]
    run_last_response = ["ctrl e"]

    [events]
    on_activate = ""
    on_selection = ""
    on_exit = ""
    on_launch = ""
    on_query_change = ""

    [list]
    dynamic_sub = true
    keyboard_scroll_style = "emacs"
    max_entries = 50
    show_initial_entries = true
    single_click = true
    visibility_threshold = 20
    placeholder = "No Results"

    [search]
    argument_delimiter = "#"
    placeholder = "Search..."
    delay = 0
    resume_last_query = false

    [activation_mode]
    labels = "jkl;asdf"

    [builtins.applications]
    weight = 5
    name = "applications"
    placeholder = "Applications"
    prioritize_new = true
    hide_actions_with_empty_query = true
    context_aware = true
    refresh = true
    show_sub_when_single = true
    show_icon_when_single = true
    show_generic = true
    history = true

    [builtins.applications.actions]
    enabled = true
    hide_category = false
    hide_without_query = true

    [builtins.bookmarks]
    weight = 5
    placeholder = "Bookmarks"
    name = "bookmarks"
    icon = "bookmark"
    switcher_only = true

    [[builtins.bookmarks.entries]]
    label = "Walker"
    url = "https://github.com/abenz1267/walker"
    keywords = ["walker", "github"]

    [builtins.xdph_picker]
    hidden = true
    weight = 5
    placeholder = "Screen/Window Picker"
    show_sub_when_single = true
    name = "xdphpicker"
    switcher_only = true

    [builtins.ai]
    weight = 5
    placeholder = "AI"
    name = "ai"
    icon = "help-browser"
    switcher_only = true
    show_sub_when_single = true

    [[builtins.ai.anthropic.prompts]]
    model = "claude-3-7-sonnet-20250219"
    temperature = 1
    max_tokens = 1_000
    label = "General Assistant"
    prompt = "You are a helpful general assistant. Keep your answers short and precise."

    [builtins.calc]
    require_number = true
    weight = 5
    name = "calc"
    icon = "accessories-calculator"
    placeholder = "Calculator"
    min_chars = 4

    [builtins.windows]
    weight = 5
    icon = "view-restore"
    name = "windows"
    placeholder = "Windows"
    show_icon_when_single = true

    [builtins.clipboard]
    always_put_new_on_top = true
    exec = "wl-copy"
    weight = 5
    name = "clipboard"
    avoid_line_breaks = true
    placeholder = "Clipboard"
    image_height = 300
    max_entries = 10
    switcher_only = true

    [builtins.commands]
    weight = 5
    icon = "utilities-terminal"
    switcher_only = true
    name = "commands"
    placeholder = "Commands"

    [builtins.custom_commands]
    weight = 5
    icon = "utilities-terminal"
    name = "custom_commands"
    placeholder = "Custom Commands"

    [builtins.emojis]
    exec = "wl-copy"
    weight = 5
    name = "emojis"
    placeholder = "Emojis"
    switcher_only = true
    history = true
    typeahead = true
    show_unqualified = false

    [builtins.symbols]
    after_copy = ""
    weight = 5
    name = "symbols"
    placeholder = "Symbols"
    switcher_only = true
    history = true
    typeahead = true

    [builtins.finder]
    use_fd = false
    fd_flags = "--ignore-vcs --type file"
    weight = 5
    icon = "file"
    name = "finder"
    placeholder = "Finder"
    switcher_only = true
    ignore_gitignore = true
    refresh = true
    concurrency = 8
    show_icon_when_single = true
    preview_images = false

    [builtins.runner]
    eager_loading = true
    weight = 5
    icon = "utilities-terminal"
    name = "runner"
    placeholder = "Runner"
    typeahead = true
    history = true
    generic_entry = false
    refresh = true
    use_fd = false

    [builtins.ssh]
    weight = 5
    icon = "preferences-system-network"
    name = "ssh"
    placeholder = "SSH"
    switcher_only = true
    history = true
    refresh = true

    [builtins.switcher]
    weight = 5
    name = "switcher"
    placeholder = "Switcher"
    prefix = "/"

    [builtins.websearch]
    keep_selection = true
    weight = 5
    icon = "applications-internet"
    name = "websearch"
    placeholder = "Websearch"

    [[builtins.websearch.entries]]
    name = "Google"
    url = "https://www.google.com/search?q=%TERM%"

    [[builtins.websearch.entries]]
    name = "DuckDuckGo"
    url = "https://duckduckgo.com/?q=%TERM%"
    switcher_only = true

    [[builtins.websearch.entries]]
    name = "Ecosia"
    url = "https://www.ecosia.org/search?q=%TERM%"
    switcher_only = true

    [[builtins.websearch.entries]]
    name = "Yandex"
    url = "https://yandex.com/search/?text=%TERM%"
    switcher_only = true

    [builtins.dmenu]
    hidden = true
    weight = 5
    name = "dmenu"
    placeholder = "Dmenu"
    switcher_only = true
    show_icon_when_single = true

    [builtins.translation]
    delay = 1000
    weight = 5
    name = "translation"
    icon = "accessories-dictionary"
    placeholder = "Translation"
    switcher_only = true
    provider = "googlefree"
  '';
  home.file.".config/walker/themes/nord.css".text = ''
    @define-color foreground #e5e9f0;
    @define-color foreground-light #eceff4;
    @define-color background #3b4252;
    @define-color background-light #4c566a;
    @define-color color1 #88c0d0;
    /* text */



    #window,
    #box,
    #aiScroll,
    #aiList,
    #search,
    #password,
    #input,
    #prompt,
    #clear,
    #typeahead,
    #list,
    child,
    scrollbar,
    slider,
    #item,
    #text,
    #label,
    #bar,
    #sub,
    #activationlabel {
        all: unset;
    }

    #cfgerr {
        background: rgba(255, 0, 0, 0.4);
        margin-top: 20px;
        padding: 8px;
        font-size: 1.2em;
    }

    #window {
        color: @foreground;
    }

    #box {
        border-radius: 2px;
        background: @background;
        padding: 32px;
        border: 3px solid @color1;
        box-shadow:
            0 19px 38px rgba(0, 0, 0, 0.3),
            0 15px 12px rgba(0, 0, 0, 0.22);
    }


    #search {
        box-shadow:
            0 1px 3px rgba(0, 0, 0, 0.1),
            0 1px 2px rgba(0, 0, 0, 0.22);
        background: lighter(@background);
        color: @foreground-light;
        padding: 8px;
    }

    #prompt {
        margin-left: 4px;
        margin-right: 12px;
        color: @foreground;
        opacity: 0.2;
    }

    #clear {
        color: @foreground;
        opacity: 0.8;
    }

    #password,
    #input,
    #typeahead {
        border-radius: 2px;
    }

    #input {
        background: none;
    }

    #password {}

    #spinner {
        padding: 8px;
    }

    #typeahead {
        color: @foreground;
        opacity: 0.8;
    }

    #input placeholder {
        opacity: 0.5;
    }

    #list {}

    child {
        padding: 8px;
        border-radius: 2px;
        color: @foreground-light;
    }

    child:selected,
    child:hover {
        color: @background;
        background: @color1;
    }

    #item {}

    #icon {
        margin-right: 8px;
    }

    #text {}

    #label {
        font-weight: 500;
    }

    #sub {
        opacity: 0.5;
        font-size: 0.8em;
    }

    #activationlabel {}

    #bar {}

    .barentry {}

    .activation #activationlabel {}

    .activation #text,
    .activation #icon,
    .activation #search {
        opacity: 0.5;
    }

    .aiItem {
        padding: 10px;
        border-radius: 2px;
        color: @foreground;
        background: @background;
    }

    .aiItem.user {
        padding-left: 0;
        padding-right: 0;
    }

    .aiItem.assistant {
        background: lighter(@background);
    }
  '';
  home.file.".config/walker/themes/nord.toml".text = ''
        [ui.anchors]
    bottom = true
    left = true
    right = true
    top = true

    [ui.window]
    h_align = "fill"
    v_align = "fill"

    [ui.window.box]
    h_align = "center"
    width = 450

    [ui.window.box.bar]
    orientation = "horizontal"
    position = "end"

    [ui.window.box.bar.entry]
    h_align = "fill"
    h_expand = true

    [ui.window.box.bar.entry.icon]
    h_align = "center"
    h_expand = true
    pixel_size = 24
    theme = ""

    [ui.window.box.margins]
    top = 200

    [ui.window.box.ai_scroll]
    name = "aiScroll"
    h_align = "fill"
    v_align = "fill"
    max_height = 300
    min_width = 400
    height = 300
    width = 400

    [ui.window.box.ai_scroll.margins]
    top = 8

    [ui.window.box.ai_scroll.list]
    name = "aiList"
    orientation = "vertical"
    width = 400
    spacing = 10

    [ui.window.box.ai_scroll.list.item]
    name = "aiItem"
    h_align = "fill"
    v_align = "fill"
    x_align = 0
    y_align = 0
    wrap = true

    [ui.window.box.scroll.list]
    max_height = 300
    max_width = 400
    min_width = 400
    width = 400

    [ui.window.box.scroll.list.item.activation_label]
    h_align = "fill"
    v_align = "fill"
    width = 20
    x_align = 0.5
    y_align = 0.5

    [ui.window.box.scroll.list.item.icon]
    pixel_size = 26
    theme = ""

    [ui.window.box.scroll.list.margins]
    top = 8

    [ui.window.box.search.prompt]
    name = "prompt"
    icon = "edit-find"
    theme = ""
    pixel_size = 18
    h_align = "center"
    v_align = "center"

    [ui.window.box.search.clear]
    name = "clear"
    icon = "edit-clear"
    theme = ""
    pixel_size = 18
    h_align = "center"
    v_align = "center"

    [ui.window.box.search.input]
    h_align = "fill"
    h_expand = true
    icons = true

    [ui.window.box.search.spinner]
    hide = true
  '';
}
