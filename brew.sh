
# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Formulae
brew install wget
brew install git
brew install nnn

# Casks
brew install --cask 1password
brew install --cask aldente
brew install --cask eloston-chromium # Ungoogled Chromium
brew install --cask ente-auth
brew install --cask hiddenbar
brew install --cask keyboard-cleaner
brew install --cask legcord
brew install --cask mullvadvpn
brew install --cask obsidian
brew install --cask proton-drive
brew install --cask psst
brew install --cask qbittorrent
brew install --cask spotify
brew install --cask ticktick
brew install --cask visual-studio-code

# Remove outdated versions from the cellar.
brew cleanup