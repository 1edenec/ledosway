#!/bin/sh

clear

c00=$'\e[0;30m'
c01=$'\e[0;31m'
c02=$'\e[0;32m'
c03=$'\e[0;33m'
c04=$'\e[0;34m'
c05=$'\e[0;35m'
c06=$'\e[0;36m'
c07=$'\e[0;37m'
c08=$'\e[1;30m'
c09=$'\e[1;31m'
c10=$'\e[1;32m'
c11=$'\e[1;33m'
c12=$'\e[1;34m'
c13=$'\e[1;35m'
c14=$'\e[1;36m'
c15=$'\e[1;37m'

f0=$'\e[0;37m'
f1=$'\e[1;37m'
f2=$'\e[0;37m'

kernel=$(uname -rmo)
cpuspe=$(grep 'model name' /proc/cpuinfo| sed 1q|sed 's/^.*:\ *//')

system=$(cat /etc/os-release | sed '2,$d;s/NAME="//;s/"//')

if [ -n "$DISPLAY" ]; then
    #wmname=$(wmctrl -m | grep -i name | awk '{print $2}')
    wmname=sway
    #termfn=$(grep font $HOME/.config/termite/config | head -1 | cut -d "=" -f 2 | tail -c +2)
	termfn="FiraCode Nerd Font Mono"
	#systfn=$(sed -n 's/^[gtk].*font.*"\(.*\)".*$/\1/p' ~/.gtkrc-2.0)
	systfn="Ubuntu"
	video0="[AMD/ATI] Renoir (rev c6)"
	video1="[AMD/ATI] Navi 14 [Radeon RX 5500] (rev c1)"
else
    wmname="none"
    termfn="none"
    systfn="none"
fi

pkgnum=$(pacman -Q|wc -l)
birthd=$(sed -n '1s/^\[\([0-9-]*\).*$/\1/p' /var/log/pacman.log | tr - .)


cat << EOF
${f0}  ╔════╗
${c16}  ║██  ║ ${c10}OS ${f0}........... $c06$system
${c08}  ║  ██║ ${c10}name ${f0}......... $c06$HOSTNAME
${c01}  ║██  ║ ${c10}birth day${f0}..... $c06$birthd
${c09}  ║  ██║ ${c10}packages ${f0}..... $c06$pkgnum
${c02}  ║██  ║
${c10}  ║  ██║ ${c10}wm ${f0}........... $c06$wmname
${c03}  ║██  ║ ${c10}shell ${f0}........ $c06$SHELL
${c11}  ║  ██║ ${c10}terminal ${f0}..... $c06$TERM
${c04}  ║██  ║ ${c10}term font ${f0}.... $c06$termfn
${c12}  ║  ██║ ${c10}system font ${f0}.. $c06$systfn
${c05}  ║██  ║
${c13}  ║  ██║ ${c10}kernel ${f0}....... $c06$kernel
${c06}  ║██  ║ ${c10}processor ${f0}.... $c06$cpuspe
${c14}  ║  ██║ ${c10}video1 ${f0}....... $c06$video0
${c07}  ║██  ║ ${c10}video2 ${f0}....... $c06$video1
${c15}  ╚════╝
EOF



