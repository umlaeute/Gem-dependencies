#!/bin/sh

install_upgrade() {
    brew install "$@" || (brew upgrade "$@" && brew cleanup "$@")
}

brew update
install_upgrade coreutils
install_upgrade pkg-config gettext
brew link gettext --force
install_upgrade fribidi --universal
install_upgrade imagemagick ftgl
install_upgrade sdl homebrew/versions/glfw2 homebrew/versions/glfw3
