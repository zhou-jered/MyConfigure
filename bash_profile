echo "Welcome YoScript"
echo "For H&L"
alias cls=clear
alias aj=autojump
alias ga="git status"
alias e=echo
alias sca=scrapy
alias p3=python3
alias wp=webpack
alias c=j
alias ap=osascript
alias idb=ios-deploy
alias mx=mobiledevice
alias dk=docker
alias sm=sdkmanager
alias ns=netstat
alias mcc=macaca
alias idi=ideviceinstaller
alias ins=instruments
alias uir=uirecorder
alias luaj=
alias cdp=
source /usr/local/share/autojump/autojump.zsh
export PATH=
export JAVA_HOME=
export ANDROID_HOME=
export vip=45.



function pp
{
export p=`pwd`
}

function sp 
{
e $p
}


function gs {
	ap ~/scripts/serverLogin.scpt $1
}

function ml {

if [ $# -lt 1 ] 
then
	mysql -u root 
else
	mysql -u root $1
fi

}

function nreload {
	sudo nginx -s reload
}
alias nr=nreload
alias rn=nr


function vul {
	ssh  $vip
}


function ø {
	echo "øøø øøø øøø"
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
