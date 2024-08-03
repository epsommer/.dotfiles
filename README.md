# .dotfiles

This repository contains configuration files for setting up and customizing your development environment. The configurations are designed to be managed and version-controlled within this repository, making it easy to synchronize across different machines.

## Overview

The `dotfiles` repository includes configurations for various tools and environments:

- **Fish Shell**: Custom settings and functions for the Fish shell.
- **Kitty Terminal**: Terminal emulator configuration.
- **Neovim**: Text editor configuration and plugins.
- **Tmux**: Terminal multiplexer configuration.

## Setup

### Symlinking Configuration Files

To use these configurations, you need to symlink the directories from this repository to the corresponding locations in your home directory. This will make the configurations take effect automatically. Follow these steps:

1. **Ensure the `~/.config` directory exists:**

    ```bash
    mkdir -p ~/.config
    ```

2. **Remove any existing directories (if needed):**

    ```bash
    rm -rf ~/.config/fish
    rm -rf ~/.config/kitty
    rm -rf ~/.config/nvim
    rm -rf ~/.config/tmux
    ```

3. **Create symbolic links:**

    ```bash
    ln -s ~/dotfiles/.config/fish ~/.config/fish
    ln -s ~/dotfiles/.config/kitty ~/.config/kitty
    ln -s ~/dotfiles/.config/nvim ~/.config/nvim
    ln -s ~/dotfiles/.config/tmux ~/.config/tmux
    ```

### Usage

- **Fish Shell**: After setting up, restart your shell or open a new terminal window to apply the Fish shell configuration.
- **Kitty Terminal**: Restart Kitty to apply the terminal configuration.
- **Neovim**: Open Neovim to apply the editor configuration.
- **Tmux**: Restart tmux to apply the configuration.

## Contributions

Feel free to fork the repository and submit pull requests if you have improvements or additional configurations you'd like to contribute.

## License

This repository is licensed under the [MIT License](LICENSE).

## Contact

For any questions or feedback, you can reach out via [email](mailto:contact@evangelosommer.com).

