#!/usr/bin/env zsh

# Source shared colors
source "$(dirname "$0")/utils/colors.sh"

echo "${BLUE}\n<<< Starting plugins Setup >>>\n${NC}"

# Create plugins directory if it doesn't exist
ZSH_PLUGINS_DIR="$HOME/.zsh"
mkdir -p "$ZSH_PLUGINS_DIR"

# Function to install a plugin
install_plugin() {
    local repo=$1
    local dir=$2

    if [ -d "$dir" ]; then
        echo "${GREEN}Already installed ${repo##*/}!${NC}"
    else
        echo "${BLUE}Installing ${repo##*/}...${NC}"
        if git clone "$repo" "$dir"; then
            echo "${GREEN}Successfully installed ${repo##*/}${NC}"
        else
            echo "${RED}Failed to install ${repo##*/}${NC}"
            return 1
        fi
    fi
}

# Install plugins
plugins=(
    # Autosuggestions - suggests commands based on history
    "https://github.com/zsh-users/zsh-autosuggestions|$ZSH_PLUGINS_DIR/zsh-autosuggestions"
    
    # Syntax highlighting - highlights valid/invalid commands
    "https://github.com/zsh-users/zsh-syntax-highlighting|$ZSH_PLUGINS_DIR/zsh-syntax-highlighting"
    
    # Fast syntax highlighting - modern and faster alternative
    "https://github.com/zdharma-continuum/fast-syntax-highlighting|$ZSH_PLUGINS_DIR/fast-syntax-highlighting"
    
    # Completions - additional completion definitions
    "https://github.com/zsh-users/zsh-completions|$ZSH_PLUGINS_DIR/zsh-completions"
    
    # History substring search - search history with up/down arrows
    "https://github.com/zsh-users/zsh-history-substring-search|$ZSH_PLUGINS_DIR/zsh-history-substring-search"
    
    # Auto notify - notifications for long-running commands
    "https://github.com/MichaelAquilina/zsh-auto-notify|$ZSH_PLUGINS_DIR/zsh-auto-notify"
    
    # You should have - suggests missing packages
    "https://github.com/MichaelAquilina/zsh-you-should-use|$ZSH_PLUGINS_DIR/zsh-you-should-use"
)

# Install each plugin
for plugin in "${plugins[@]}"; do
    IFS="|" read -r repo dir <<< "$plugin"
    install_plugin "$repo" "$dir"
done

# Enable "Tap to click" for trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable trackpad Natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Remove all current docked apps
defaults write com.apple.dock persistent-apps -array

# Enable auto hide on dock
defaults write com.apple.dock autohide -bool true

# Modify dock to be on the left screen
defaults write com.apple.dock orientation -string "left"

# Restart Dock to apply changes
killall Dock

echo "${GREEN}\n<<< Finished plugins Setup >>>\n${NC}"