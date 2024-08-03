# Fish shell configuration

# ----------------------------
# Check if the shell session is interactive
# ----------------------------
if status is-interactive
    # ----------------------------
    # Set the PATH for user-installed functions and binaries
    # ----------------------------
    set -g fish_user_paths ~/.config/fish/functions $fish_user_paths

    # ----------------------------
    # Check if Fisher is installed
    # ----------------------------
    if test -f ~/.config/fish/functions/fisher.fish
        fisher --version
    else
        echo "Fisher is not installed"
    end

    # ----------------------------
    # Configure Tide if it is installed
    # ----------------------------
    if functions -q tide
        # Avoid running `tide configure` on every startup
        if not test -f ~/.config/fish/conf.d/tide_configured.fish
            tide configure
            touch ~/.config/fish/conf.d/tide_configured.fish
        end
    else
        echo "Tide is not installed"
    end
end

# ----------------------------
# Aliases
# ----------------------------
alias ls='eza --color=always'
alias vim='nvim'
alias tmux="tmux -f ~/.config/tmux/tmux.conf"

# ----------------------------
# Add Rust's Cargo binaries to PATH
# ----------------------------
set -gx PATH $HOME/.cargo/bin $PATH

# ---------------------------
# Use SecretService for Git credentials
# ---------------------------
set -x GCM_CREDENTIAL_STORE secretservice
