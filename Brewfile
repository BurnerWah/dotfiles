# Core homebrew taps
tap "homebrew/autoupdate"
tap "homebrew/aliases"
tap "homebrew/bundle"
tap "homebrew/command-not-found"
tap "homebrew/services"

# Third-party taps
tap "buo/cask-upgrade"
tap "oven-sh/bun"
tap "rsteube/tap"
tap "egoist/tap"

# Taps to not use
# nanovms/ops - NanoVMs. Neat idea, but there's no bottle, requires buf to be
# built from another tap without bottles, and the formulae tend not load for
# some commands.
# bufbuild/buf - No bottles, and buf is already in the main tap.
# cloudflare/cloudflare - Formulae fail to load for some commands.

# Important formulae
brew "act" # GitHub Actions runner
brew "actionlint" # GitHub Actions linter
brew "age" # encryption tool
brew "age-plugin-yubikey"
brew "as-tree"
brew "asdf" # version manager
brew "asitop" if OS.mac? && Hardware::CPU.arm? # Apple Silicon performance monitor
brew "atuin" # history sync
brew "b3sum"
brew "bat" # cat alternative
brew "bash-completion"
brew "bingrep"
brew "biome"
brew "bkt" # CLI output caching tool
brew "black" # python formatter
brew "blueutil" if OS.mac? # bluetooth util, used by a raycast extension
brew "bottom" # system monitor
brew "breezy"
brew "btop" # htop alternative
brew "bzip3" # compression tool
brew "chezmoi"
brew "cloudflared"
brew "colima" if OS.mac? # Container runtime
brew "corepack"
brew "dark-mode" if OS.mac? # macOS dark mode toggle
brew "ddgr" # DuckDuckGo search
brew "deno"
brew "detect-secrets"
brew "direnv" # directory-specific env vars
brew "doggo" # DNS client
brew "duf" # disk usage
brew "elvish"
brew "exercism"
brew "exiftool"
brew "eza" # ls alternative
brew "fd" # find alternative
brew "fish"
brew "fisher"
brew "flyctl"
brew "fnm" # node version manager
brew "fossil" # version control
brew "frum" # ruby version manager
brew "fx" # JSON viewer
brew "fzf"
brew "gallery-dl"
brew "gawk"
brew "gh" # GitHub CLI
brew "git"
brew "git-delta"
brew "git-lfs"
brew "git-open"
brew "git-remote-hg"
brew "gitleaks"
brew "gitlint"
brew "glow" # markdown preview
brew "go"
brew "go-task"
brew "grc" # CLI output colorizer
brew "grex" # regex generator
brew "hadolint" # Dockerfile linter
brew "hexyl" # hex viewer
brew "htop"
brew "httpie"
brew "hugo"
brew "hyperfine" # benchmarking tool
brew "imagemagick"
brew "iproute2mac" if OS.mac?
brew "jc" # JSON parser for various CLIs
brew "jdupes" # duplicate file finder
brew "jq" # JSON manipulator
brew "just"
brew "kondo" # Disk cleanup tool for coding
brew "lefthook" # git hooks
brew "less" if OS.mac? # Mac OS has an ancient version of Less
brew "lima" if OS.mac? # Linux VMs
brew "litecli" # sqlite client
brew "lnav" # log viewer
brew "luarocks"
brew "m-cli" if OS.mac? # macOS utils
brew "macos-trash" if OS.mac? # trash CLI
brew "mas" if OS.mac? # Mac App Store CLI
brew "mercurial" # version control
brew "miniserve"
brew "most" # another pager, handles manpages well
brew "neofetch"
brew "neovim"
brew "node"
brew "npm-check-updates"
brew "nqp"
brew "nushell"
brew "oh-my-posh" # prompt for powershell
brew "p7zip"
brew "pandoc"
brew "pidof" if OS.mac? # pidof command
brew "pigz" # parallel gzip
brew "pipx"
brew "podman"
brew "podman-compose"
brew "postgresql@16"
brew "pre-commit"
brew "prettier"
brew "rclone" # cloud storage manager
brew "rename" # rename files
brew "ripgrep" # grep alternative
brew "ruby"
brew "shadowenv" # directory-specific env vars
brew "starship" # prompt for fish & zsh
brew "svgo" # SVG optimizer
brew "syncthing"
brew "tealdeer" # fast tldr page viewer
brew "texinfo"  # info documentation viewer
brew "thefuck"
brew "tokei" # count lines of code
brew "typescript"
brew "util-linux" if OS.mac? # probably installed elsewhere on linux
brew "uutils-coreutils"
brew "virtualenv"
brew "virtualfish" # virtualenv for fish
brew "viu" # terminal image viewer
brew "vivid" # LS_COLORS generator
brew "watchman"
brew "whalebrew"
brew "xonsh"
brew "xz"
brew "ykman"  # yubikey manager
brew "yt-dlp"
brew "zellij" # tmux alternative
brew "zoxide" # directory jumping
brew "zsh-autopair"
brew "zsh-autosuggestions"
brew "zsh-fast-syntax-highlighting"
brew "zsh-history-substring-search"
brew "zstd"

brew "egoist/tap/dum"
brew "oven-sh/bun/bun"
brew "rsteube/tap/carapace" # completions
brew "rsteube/tap/carapace-bridge" # useful for testing stuff in carapace
brew "rsteube/tap/vincent" # term color scheme generator

# Important casks
cask "1password"
cask "1password-cli"
cask "alt-tab"
cask "apparency" # inspects app bundles + quicklook extension
cask "aqua"
cask "background-music" # volume mixer
cask "bettertouchtool" # trackpad settings
cask "blender"
cask "bootstrap-studio"
cask "dataspell"
cask "datagrip"
cask "dotnet-sdk"
cask "eloston-chromium" # ungoogled chromium
cask "eul" # system monitor
cask "figma" # figma balls
cask "firefox"
cask "font-fira-code"
cask "font-fira-code-nerd-font"
cask "font-fira-mono"
cask "font-fira-mono-nerd-font"
cask "font-jetbrains-mono"
cask "font-jetbrains-mono-nerd-font"
cask "font-monaspace"
cask "font-monaspace-nerd-font"
cask "goland"
cask "handbrake" # encoder
cask "hazeover" # dims windows that aren't focused
cask "httpie"
cask "iina" # video player
cask "intellij-idea"
cask "iterm2"
cask "jetbrains-toolbox"
cask "karabiner-elements" # keyboard remapper
cask "kitty" # terminal emulator
cask "launchpad-manager"
cask "lulu" # firewall
cask "menuwhere" # access menubar via cmd+right click
cask "moonlight" # local game streaming
cask "obs" # streaming & recording
cask "obsidian" # note taking
cask "phpstorm"
cask "podman-desktop"
cask "postico" # postgres client
cask "pycharm"
cask "raycast" # spotlight replacement
cask "rectangle" # window management
cask "rider"
cask "rubymine"
cask "signal"
cask "soduto" # kde connect
cask "swift-quit" # quit apps by closing them
cask "tor-browser"
cask "tower" # git client
cask "unnaturalscrollwheels" # needed to mitigate mac os mouse misbehavior
cask "visual-studio-code"
cask "vmware-fusion" # virtualization
cask "webstorm"
cask "whisky" # WINE gui

# App store apps
mas "Affinity Designer 2", id: 1616831348
mas "Affinity Photo 2", id: 1616822987
mas "Affinity Publisher 2", id: 1606941598
mas "Amphetamine", id: 937984704 # keep mac awake
mas "BrightIntosh", id: 6452471855 # higher brightness
mas "DaVinci Resolve", id: 571213070
mas "Dropover", id: 1355679052 # drag and drop manager
mas "iBar", id: 6443843900 # menu bar manager
mas "Ivory", id: 6444602274 # mastodon client
mas "Keynote", id: 409183694
mas "Numbers", id: 409203825
mas "Pages", id: 409201541
mas "Parcel", id: 639968404 # package tracker
mas "Shareful", id: 1522267256
mas "Slack", id: 803453959
mas "Tailscale", id: 1475387142
mas "TickTick", id: 966085870 # task manager
mas "Whisper", id: 1668083311 # transcription app
mas "Xcode", id: 497799835
mas "Yubico Authenticator", id: 1497506650
