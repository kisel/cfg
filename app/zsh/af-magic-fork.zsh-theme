# based on af-magic.zsh-theme

typeset +H return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"
#typeset +H my_gray="$FG[237]"
typeset +H my_orange="$FG[214]"

# separator dashes size
#function afmagic_dashes {
#	[[ -n "${VIRTUAL_ENV-}" && -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" && "$PS1" = \(* ]] \
#		&& echo $(( COLUMNS - ${#VIRTUAL_ENV} - 3 )) \
#		|| echo $COLUMNS
#}

# primary prompt
#PS1='$my_orange%n@%m%{$reset_color%}% '
PS1='$FG[008]%n@$FG[003]%m%{$reset_color%}% '
PS1+=' $FG[032]%~$(git_prompt_info) $FG[105]%(!.#.$)%{$reset_color%} '
RPS1='${return_code}'

# right prompt
#(( $+functions[virtualenv_prompt_info] )) && RPS1+='$(virtualenv_prompt_info)'
#RPS1+=' $my_gray%n@%m%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# virtualenv settings
#ZSH_THEME_VIRTUALENV_PREFIX=" $FG[075]["
#ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
