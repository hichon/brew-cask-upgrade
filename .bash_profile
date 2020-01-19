# Homebrew
brew-cask-upgrade() {
    local caskdir=/usr/local/Caskroom
    for app in $(brew cask list); do
        local latest=$(brew cask info $app|awk 'NR==1&&$0=$2')
        local current=$(ls $caskdir/$app/.metadata|grep -v 'json'|tail -1)
        echo -n "$app: $current -> $latest "
        if [[ $latest != $current ]]; then
            echo "updating..."
            brew cask reinstall $app
        else
            echo "skipped."
        fi
    done
}
