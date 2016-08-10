export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

autoload -U colors; colors
set prompt_subst
#export LANG=ja_JP.eucJP
setopt auto_cd
export CLICOLOR=true
alias la='ls -a'
alias a='./a.out'

setopt auto_list
setopt auto_param_keys
setopt list_packed
setopt list_types
unsetopt list_beep
setopt rec_exact
setopt interactive_comments
setopt magic_equal_subst
setopt complete_in_word
setopt always_last_prompt

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias la='ls -a'
alias ll='ls -al'

#git 関連
alias commit='git commit -m'
alias add='git add'
alias push='git push'


# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# prompt
#PS1='[\u@\h \W]\$ '


#keybode setting
setxkbmap -rules evdev -model jp106 -layout jp
xmodmap .Xmodmap

#android
export PATH=${PATH}:/home/shi/workspace/adt-bundle-linux-x86_64-20140702/sdk/tools



export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx

#setxkbmap dvorak
alias SSS='setxkbmap dvorak'
alias AAA='setxkbmap jp'

# OPAM configuration
. /home/shi/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
alias acl2='/opt/acl2/saved_acl2'


export PATH=$PATH:~/.gem/ruby/2.3.0/bin
export GEM_HOME=~/.gem/ruby/2.3.0
