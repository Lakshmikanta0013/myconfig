# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/snap/bin

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


########################################################################
###############               ALIASES			 ###############
########################################################################


#vim
alias vim="nvim"
alias svim="sudo nvim"

#Make a directory with parent-child
alias mkdir="mkdir -p"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

#Custom Clear command
alias clr='clear;colorscript random' 

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Changing "ls" to "exa"
alias ls='exa -alh --color=always --group-directories-first' # listing
alias la='exa -ah --color=always --group-directories-first'  # all files and dirs
alias ll='exa -lh --color=always --group-directories-first'  # long format
alias lt='exa -aTh --color=always --group-directories-first' # tree listing
alias l.='exa -ah | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#pacman command 
#alias pacins='sudo pacman -S'
#alias pacrmv='sudo pacman -Rns'
#alias cleanup='sudo pacman -Rns (pacman -Qtdq)'  			# remove orphaned packages
#alias parurmv='paru -Rns'
#alias pacup='sudo pacman -Syu'
#alias yup='yay -Syu'
#alias pup='paru -Syu'
#alias yin='yay -S'
#alias pin='paru -S'

#Source config
alias fsource='source ~/.config/fish/config.fish'
alias bsource='source ~/.bashrc'

#apt command
alias pacins='sudo apt install'
alias pacrmv='sudo apt purge'
alias sys-autoremove='sudo apt --purge autoremove'
alias pacsearch='sudo apt search'
alias paclist='sudo apt list'
alias pacinstalled='sudo apt list --installed'
alias sys-upgrade='sudo apt update && sudo apt upgrade'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias snap-ins='sudo snap install'

#wifi
alias wifi="nmtui"

#chmod
alias mod="sudo chmod +x"

#change ownership
alias ownfi='sudo chown $USER'
alias ownfo='sudo chown -R $USER'

# git
alias gst='git status'
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

# script to arch system maintaincence
#To download this https://github.com/voider755/almh.git
# arch user "yay -S almh-git"
alias maintaincence='almh.py'

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"


#Recent Installed Packages
# Download expac "sudo pacman -S expac"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -20 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#Edit with your EDITOR for important configuration files
alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias nparu="sudo $EDITOR /etc/paru.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias narcomirrorlist='sudo nano /etc/pacman.d/arcolinux-mirrorlist'
alias nsddm="sudo $EDITOR /etc/sddm.conf"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nbash="$EDITOR ~/.bashrc"
alias nzsh="$EDITOR ~/.zshrc"
alias nfish="$EDITOR ~/.config/fish/config.fish"
alias nbspwm="$EDITOR ~/.config/bspwm/bspwmrc"
alias nsxhkd="$EDITOR ~/.config/bspwm/sxhkd/sxhkdrc"

#Edit config file for ricing
alias ni3="$EDITOR ~/.config/i3/config"
alias npolybar="$EDITOR ~/.config/polybar/config"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
alias shutdown="sudo shutdown now"
alias reboot="sudo reboot"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# the terminal rickroll
alias rr='curl -s -L http://bit.ly/10hA8iC | bash'

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "


########## Startup apps   #######

#Start Fish
exec fish

#Start STARSHIP 
eval "$(starship init bash)"
