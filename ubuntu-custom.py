#!/usr/bin/python

import subprocess

def terminal_comand(comand):
    '''
    Enter a comand in linux to execute in a terminal
    comand = comand to execute
    '''
    subprocess.call([comand], shell=True)

def aliases_comand(alias, comand):
    '''
    Add a alias in aliases.zsh
    alias = name of the alias
    comand = comand to execute
    '''
    ac = f'alias {alias}="{comand}"'
    path = '~/project/my-dot-files/aliases.zsh'
    aliases = 'echo '+'\'alias '+alias+'="'+comand+'"'+'\' >> '+path
    terminal_comand(aliases)

update_and_upgrade = "sudo apt update && sudo apt upgrade -y"
shutdown = "shutdown -h now"
install_some_programs = "sudo apt install -y neofetch vim neovim virtualbox virtualbox-guest-additions-iso virtualbox-guest-utils eza bat zsh zsh-autosuggestions zsh-syntax-highlighting htop curl docker-ce docker-ce-cli containerd.io docker-compose-plugin"
install_zsh = "sh -c '$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"

terminal_comand(update_and_upgrade)
terminal_comand(install_some_programs)
terminal_comand(install_zsh)

#setting zsh is default
default_zsh = "chsh -s /usr/bin/zsh"

#adding aliases
aliases_comand('ls', 'eza --icons')
aliases_comand('ll', 'eza --icons -la')
aliases_comand('cat', 'batcat')
aliases_comand('atualiza', update_and_upgrade)
aliases_comand('desliga', shutdown)
