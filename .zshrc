# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:$(go env GOPATH)/bin"

export PATH="$HOME/.local/bin:$PATH"

# export PATH="$HOME/.local/bin:$PATH"

# pyenv 初期化
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export YOUTUBE_API_KEY=AIzaSyACHK8BLihaytCQMjiyvWpckJfxtitE0Uk
plugins=(
          git
          fzf
          golang
          command-not-found
          zsh-syntax-highlighting
          zsh-autosuggestions
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555' 

source $ZSH/oh-my-zsh.sh

# Enable fzf completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf-tab（補完候補に枠線＆インタラクティブUI）
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
# fzf-tab（fzfで補完候補を視覚的に表示）

# autosuggestions の文字色をグレーに
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#777'


source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh


# Begin: PlatformIO Core completion support
autoload -Uz compinit
compinit
eval "$(_PIO_COMPLETE=zsh_source pio)"
# End: PlatformIO Core completion support

export EZA_COLORS="di=3;34"

alias ls='eza --color=auto --icons=always --git --time-style relative'
alias ll='eza -lh --icons'
alias la='eza -la --icons'

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

source ~/.zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Added by Antigravity

eval "$(starship init zsh)"


