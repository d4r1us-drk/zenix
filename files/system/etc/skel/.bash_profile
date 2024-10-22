# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Home XDG folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_LIB_HOME="$HOME/.local/lib"
export XDG_BIN_HOME="$HOME/.local/bin"

# Sanely export XDG Base dir variables
eval "$(sed 's/^[^#].*/export &/g;t;d' ~/.config/user-dirs.dirs)"

# Clean home
export W3M_DIR="$XDG_DATA_HOME/w3m"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export WGETDIR="$XDG_CONFIG_HOME/wget"
export WGETRC="$WGETDIR/wgetrc"
export GNUPGHOME="$HOME/.local/share/gnupg"
export LESSHISTFILE="-"
export BASHRC="$HOME/.bashrc"

# Default apps
export TERMINAL="ptyxis"
export EDITOR="vim"
export VISUAL="flatpak run org.gnome.TextEditor"
export BROWSER="flatpak run org.mozilla.firefox"
export VIEWER="flatpak run org.gnome.Papers"

# User specific environment and startup programs
export EGL_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export CLUTTER_PLATFORM=wayland
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_WAYLAND_USE_VAAPI=1
export MOZ_DISABLE_RDD_SANDBOX=1 
export ELECTRON_OZONE_PLATFORM_HINT=auto

# Programming languages specific environment variables
## Go
export GOPATH="$XDG_DATA_HOME/go"

## Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Set path
## local bin paths
if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

## dotnet tools
if [ -d "$HOME/.dotnet/tools" ]; then
    PATH="$HOME/.dotnet/tools:$PATH"
fi

## rust tools and programs
if [ -d "$CARGO_HOME/bin" ]; then
    PATH="$CARGO_HOME/bin:$PATH"
fi

## golang tools and programs
if [ -d "$GOPATH/bin" ]; then
    PATH="$GOPATH/bin:$PATH"
fi

## AppImage applications
if [ -d "$HOME/Applications" ]; then
    PATH="$HOME/Applications:$PATH"
fi

# Create config directories if they don't exist
if [ ! -d "$WGETDIR" ] || [ ! -d "$GNUPGHOME" ]; then
    mkdir -p "$WGETDIR" "$GNUPGHOME"
fi

