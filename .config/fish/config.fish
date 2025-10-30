# Apple-Silicon Mac Homebrew (uncomment if needed)
set -gx PATH /opt/homebrew/bin $PATH
set -x CEF_PATH ~/Code/browser/code/cef/cef_binary_140.1.14+g6f6a3b4+chromium-140.0.6092.112_macosarm64

# Always source tmux config
tmux source-file ~/.config/tmux/tmux.conf

fish_add_path ~/.cargo/bin

if status is-interactive
    # Auto-start tmux if we’re not already inside it or over SSH
    if command -v tmux >/dev/null 2>&1
        and test -z "$TMUX"
        and test -z "$SSH_TTY"
        tmux attach -t default 2>/dev/null; or tmux new -s default
    end
end
