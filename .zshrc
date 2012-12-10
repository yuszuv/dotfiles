# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="jreese"
#ZSH_THEME="random"
ZSH_THEME="fletcherm"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git nyan git-flow)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
case $(hostname) in
hal9001)
	export PATH=/home/jan/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
	;;
xylakant)
	#export PATH=/home/jan/.rvm/gems/ruby-1.9.2-p290@ece/bin:/home/jan/.rvm/gems/ruby-1.9.2-p290@global/bin:/home/jan/.rvm/rubies/ruby-1.9.2-p290/bin:/home/jan/.rvm/bin:/home/jan/.rvm/bin:/home/jan/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
	;;
esac

#setting dircolors to solarized
eval `dircolors -b $HOME/.dircolors`

# setting $EDITOR
if [[ -x $(which vim) ]]
then
	export EDITOR="vim"
	export USE_EDITOR=$EDITOR
	export VISUAL=$EDITOR
fi

# meta+. displays the last command(s)
bindkey '\e.' insert-last-word

# setting the TERM for vim + solarized working properly
if tty | egrep pts >> /dev/null ; then
	export TERM=xterm-256color
fi

# unused stuff of old system
#alias cdrails='cd /var/www/rails_projects'


alias qeo='setxkbmap de neo -option; xmodmap ~/bin/qeo.csv'
alias qwe='setxkbmap de -option'

# setting CDPATH for simpler cd-ing 
#export CDPATH=/home/jan/rails/

# changing the cd +-n behaviour
#setopt PUSHD_MINUS

#disabling autocompletion
#yountlabs.com/automation/disable-autocorrect-in-zsh/
unsetopt correct_all
