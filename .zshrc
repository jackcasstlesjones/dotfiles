# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
export PATH="$HOME/custom-bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:/usr/local/share/dotnet"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
#

alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias claude="/Users/jack/.claude/local/claude"


# eval "$(fzf --zsh)"
#
# show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
#
# # export FZF_DEFAULT_OPTS="--preview '$show_file_or_dir_preview'"
# # export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
# # export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
#
# _fzf_comprun() {
#   local command=$1
#   shift
#   case "$command" in
#     cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
#     export|unset) fzf --preview "eval 'echo ${}'" "$@" ;;
#     ssh)          fzf --preview 'dig {}' "$@" ;;
#     *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
#   esac
# }

# --- Zoxide ---
eval "$(zoxide init zsh)"

# # --- NVM (Node Version Manager) ---
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- Conda (defer loading where possible) ---
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
elif [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
  . "/opt/miniconda3/etc/profile.d/conda.sh"
else
  export PATH="/opt/miniconda3/bin:$PATH"
fi
unset __conda_setup
