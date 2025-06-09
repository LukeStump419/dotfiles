##############################################################################
# ~/.bashrc - Bash Configuration File  (by Luke Stump)
#
# Overview:
#   This file customizes the Bash shell environment for interactive login and
#   non-login shells. It sets up the command prompt, environment variables,
#   system-specific settings, and sources personal configuration extensions.
#
# Author: Luke Stump
# Date: 2022-02-07
#
# HOW TO USE:
#   1. Copy this file to your home directory as '.bashrc' (i.e., ~/.bashrc).
#   2. Review and update any paths or sourced files to match your setup.
#   3. For custom aliases, Oracle, or personal configs, create files as needed
#      (see lines sourcing ~/.alias.bash, ~/.oracle.bashrc, ~/.my.bashrc).
#   4. To activate, either start a new terminal session or run: source ~/.bashrc
#
# WARNING:
#   - **As with basically everything: Always review code before running it!**
#   - This file sources additional personal files; ensure they do not contain
#     sensitive information before publishing or sharing your dotfiles repo.
#   - Remove or edit sections as needed for your operating system/environment.
##############################################################################

#------------------------------------------------------------------------------
# If present, source the system-wide Bash configuration.
# This loads global settings provided by your Linux distribution.
#------------------------------------------------------------------------------
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#------------------------------------------------------------------------------
# Set the command prompt format:
#   \u = username
#   \h = hostname
#   \W = current working directory (basename only)
#   %  = literal percent sign (classic Unix style)
#------------------------------------------------------------------------------
PS1="[\u@\h:\W]% "

#------------------------------------------------------------------------------
# Linux-specific configuration
#------------------------------------------------------------------------------
if [[ $(uname) == "Linux" ]]; then
    # Set architecture identifier variable (default: linux)
    export ARCH=linux

    # Store system's hostname to $HOST (not usually necessary, but like...convenient)
    export HOST=$(hostname)

    # Extend the system $PATH variable to include:
    #   - /usr/sbin and /sbin for administrative commands
    #   - $HOME/bin for user scripts and custom binaries
    # This preserves the existing $PATH entries, just appending new locations
    export PATH="$PATH:/usr/sbin:/sbin:$HOME/bin"

    # Check if running on a 64-bit system (common for modern Linux distros)
    if [[ $(uname -m) == "x86_64" ]]; then
        # Detect Red Hat Enterprise Linux release version for ARCH variable
        # /etc/redhat-release contains version info for RHEL/CentOS/Oracle Linux
        if grep -qi "release 7" /etc/redhat-release 2>/dev/null; then
            export ARCH=linux7_64
        elif grep -qi "release 6" /etc/redhat-release 2>/dev/null; then
            export ARCH=linux6_64
        fi
        # If neither version 6 nor 7 is detected, $ARCH remains linux
    fi
fi

#------------------------------------------------------------------------------
# Set the default command-line text editor to 'vi'.
# This controls what editor opens for commands like 'crontab -e' or 'git commit'.
#------------------------------------------------------------------------------
export EDITOR=vi

#------------------------------------------------------------------------------
# Set umask to 027: files created will be accessible only to the user and group.
#   - 0: User has full permissions
#   - 2: Group can read
#   - 7: Others have no access
#------------------------------------------------------------------------------
umask 027

#------------------------------------------------------------------------------
# Configure X Window System resource file search paths.
# These variables help X11 applications find user-specific app-defaults.
# Safe to leave as-is if you don't use X11 apps, but harmless otherwise.
#------------------------------------------------------------------------------
export XAPPLRESDIR="$HOME/app-defaults"
export XUSERFILESEARCHPATH="$HOME/app-defaults/%N"

#------------------------------------------------------------------------------
# Source additional personal Bash configuration files, if they exist.
# - ~/.alias.bash      : custom shell aliases
# - ~/.oracle.bashrc   : Oracle environment setup (if needed)
# - ~/.my.bashrc       : any other personal tweaks
# You can comment out any you don't use, or create them as empty files if desired.
#------------------------------------------------------------------------------
for file in ~/.alias.bash ~/.oracle.bashrc ~/.my.bashrc; do
    [ -f "$file" ] && . "$file"
done

#------------------------------------------------------------------------------
# Universal Extract Function
# Extract many types of compressed files with one command: extract filename
#------------------------------------------------------------------------------
extract () {
    # Check if a file was provided and if it exists
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.gz)    tar xvzf "$1"    ;;  # Extract .tar.gz archives
            *.rar)       unrar x "$1"     ;;  # Extract .rar archives (requires unrar)
            *.gz)        gunzip "$1"      ;;  # Extract .gz files
            *.tar)       tar xf "$1"      ;;  # Extract .tar files
            *.zip)       unzip "$1"       ;;  # Extract .zip archives
            *.Z)         uncompress "$1"  ;;  # Extract .Z files
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
#------------------------------------------------------------------------------
# Recursively find files modified in the last N minutes in the current 
# directory and sub-directory. You could add a -maxdepth 1 to limit search to
# current directory only.
# Example Usage: recent 10  (files changed in last 10 min)
#------------------------------------------------------------------------------
recent() {
    find . -type f -mmin -$1
}

#------------------------------------------------------------------------------
# Command History Improvements
# Make your shell remember more history, ignore duplicates, and append on close
#------------------------------------------------------------------------------
export HISTSIZE=10000              # Number of commands to remember in memory
export HISTFILESIZE=20000          # Number of commands to save in ~/.bash_history
export HISTCONTROL=ignoredups:erasedups # No duplicate commands in history
shopt -s histappend                # Append to the history file, don’t overwrite

#------------------------------------------------------------------------------
# Turn Off Terminal Bell and Enable Case-Insensitive Completion
#------------------------------------------------------------------------------
bing "bell-style none"                        # Suppress annoying terminal beeps
bind "set completion-ignore-case on"       # Tab completion ignores case

#------------------------------------------------------------------------------
# Display a Welcome Message in Interactive Shells
#------------------------------------------------------------------------------
if [[ $PS1 ]]; then
    echo "Welcome, $USER! Type 'helpme' for a list of custom commands."
fi


##############################################################################
# For more info, see the accompanying README.md in this dotfiles repository.
##############################################################################
