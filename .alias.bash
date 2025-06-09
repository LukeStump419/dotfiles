##############################################################################
# ~/.alias.bash - Bash Aliases & Functions (by Luke Stump)
#
# For: Anyone who’s tired of typing the same 10 commands 100 times a day.
#      Heavily commented, because future-you won’t remember what this does.
##############################################################################

#------------------------------------------------------------------------------
# File listing shortcuts, because 'ls' is great but: this is better
#------------------------------------------------------------------------------
alias l='ls -CF'        # Classic listing, but fancier than 'ls'
alias la='ls -A'        # Show hidden stuff (dotfiles!), but not . and ..
alias ll='ls -alF'      # Long listing with all the details
alias lrt='ls -lrt'    # I dunno man, I just like this one

#------------------------------------------------------------------------------
# Quick navigation, because 'cd ../../../../' is not my jam.
#------------------------------------------------------------------------------
alias ..='cd ..'        # Go up one directory
alias ...='cd ../..'    # Go up two directories (even lazier)
alias ....='cd ../../..' # Wow, you’re really lost, huh?

#------------------------------------------------------------------------------
# Disk usage and space checks.
#------------------------------------------------------------------------------
alias dus='du -sh * | sort -h'   # Human-readable, sorted disk usage per item
alias dfh='df -h'                # Disk free, but readable by actual humans
alias duh='du -h'                # 'du' with -h, for more random disk queries

#------------------------------------------------------------------------------
# Safe versions of the most dangerous Unix commands. Prevents heart attacks.
#------------------------------------------------------------------------------
alias rm='rm -i'   # Prompt before every delete!
alias cp='cp -i'   # Prompt before overwrite!
alias mv='mv -i'   # Same, because who actually remembers what’s in that folder?

#------------------------------------------------------------------------------
# Grep upgrades, because color makes everything better and line numbers rock.
#------------------------------------------------------------------------------
alias grep='grep --color=auto -n'

#------------------------------------------------------------------------------
# Git cheat sheet function for git cmd alias below.
#------------------------------------------------------------------------------
githelp() {
  cat << 'EOF'
Git Cheat Sheet:
  gs        git status                  # Show status of changes
  ga        git add <file>              # Add file(s) to staging area
  gc        git commit -m "msg"         # Commit staged changes
  gp        git pull                    # Pull latest from remote
  gP        git push                    # Push local changes
  gb        git branch                  # List branches
  gba       git branch -a               # List all branches
  gco       git checkout <branch>       # Switch to branch
  gcb       git checkout -b <branch>    # Create & switch to new branch
  gd        git diff                    # Show unstaged changes
  gl        git log --oneline --graph   # Pretty log
  gstash    git stash                   # Stash uncommitted changes
  gpop      git stash pop               # Re-apply stashed changes

Other useful:
  git log --oneline --graph --decorate  # Visualize commit history
  git remote -v                         # List remotes
  git config --list                     # Show config settings

Need more? Visit: https://www.git-tower.com/blog/git-cheat-sheet/
EOF
}

#------------------------------------------------------------------------------
# Git command aliases, because you shouldn’t have to type 'git' so much.
#------------------------------------------------------------------------------
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git pull'
alias gP='git push'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gl='git log --oneline --graph'
alias gstash='git stash'
alias gpop='git stash pop'

#------------------------------------------------------------------------------
# Editing shortcuts, because you’ll forget file names anyway.
#------------------------------------------------------------------------------
alias vi='vim'
alias svi='sudo vim'
alias editbash='vim ~/.bashrc'
alias editalias='vim ~/.alias.bash'

#------------------------------------------------------------------------------
# Networking & system info. Spying on your own machine, for fun and profit.
#------------------------------------------------------------------------------
alias ports='netstat -tulanp'      # What’s actually listening? You should know.
alias myip='curl -s https://api.ipify.org'

#------------------------------------------------------------------------------
# Date & time. Because sometimes you just want to know what day it is.
#------------------------------------------------------------------------------
alias now='date +"%T"'                # What time is it?
alias nowdate='date +"%d-%m-%Y %T"'   # Date and time, European style.

#------------------------------------------------------------------------------
# World clock cheat sheet. Because "What time is it there?" is a constant.
# Uncomment the zones you care about, or add more if you have friends.
#------------------------------------------------------------------------------
alias nowz='TZ=UTC date +"Zulu/GMT:        %a %Y-%m-%d %H:%M:%S %Z"'
alias nowlocal='date +"Local Time:     %a %Y-%m-%d %H:%M:%S %Z"'
alias nowest='TZ=America/New_York date +"Eastern:         %a %Y-%m-%d %H:%M:%S %Z"'
alias nowcst='TZ=America/Chicago date +"Central:         %a %Y-%m-%d %H:%M:%S %Z"'
#alias nowmst='TZ=America/Denver date +"Mountain:        %a %Y-%m-%d %H:%M:%S %Z"'
#alias nowpst='TZ=America/Los_Angeles date +"Pacific:         %a %Y-%m-%d %H:%M:%S %Z"'
alias nowhawaii='TZ=Pacific/Honolulu date +"Hawaii:           %a %Y-%m-%d %H:%M:%S %Z"'
alias nowkorea='TZ=Asia/Seoul date +"Korea:            %a %Y-%m-%d %H:%M:%S %Z"'
alias nowgermany='TZ=Europe/Berlin date +"Germany:          %a %Y-%m-%d %H:%M:%S %Z"'

# Quick all-in-one: show all major US zones, UTC, plus Hawaii, Korea, Germany.
nowall() {
  echo "------ Timezone Cheat Sheet ------"
  TZ=UTC date +"Zulu/GMT:        %a %Y-%m-%d %H:%M:%S %Z"
  date +"Local Time:     %a %Y-%m-%d %H:%M:%S %Z"
  TZ=America/New_York date +"Eastern:         %a %Y-%m-%d %H:%M:%S %Z"
  TZ=America/Chicago date +"Central:         %a %Y-%m-%d %H:%M:%S %Z"
  #TZ=America/Denver date +"Mountain:        %a %Y-%m-%d %H:%M:%S %Z"
  #TZ=America/Los_Angeles date +"Pacific:         %a %Y-%m-%d %H:%M:%S %Z"
  TZ=Pacific/Honolulu date +"Hawaii:           %a %Y-%m-%d %H:%M:%S %Z"
  TZ=Asia/Seoul date +"Korea:            %a %Y-%m-%d %H:%M:%S %Z"
  TZ=Europe/Berlin date +"Germany:          %a %Y-%m-%d %H:%M:%S %Z"
  echo "-----------------------------------"
}

# Usage:
#   nowz         # Zulu/GMT time
#   nowlocal     # Local time (your computer's current zone)
#   nowest       # US Eastern Time
#   nowcst       # US Central Time
#   nowhawaii    # Hawaii time
#   nowkorea     # Korea time
#   nowgermany   # Germany (Berlin) time
#   nowall       # Show all the above at once

#------------------------------------------------------------------------------
# File cleaning functions: For when your data comes from Windows, Excel, or elsewhere.
# All these operate *in place* and will overwrite the originals, so back up if you’re nervous.
#------------------------------------------------------------------------------

# (1) clean - Quickly fix common text file issues (in place)
# Usage:   clean file1 [file2 ...]
# Example: clean text_file.txt data_file.csv
# What it does:
#   - Removes Windows carriage returns (\r), so you get Unix line endings
#   - Replaces weird Unicode non-breaking spaces (hex C2A0) with normal spaces
#   - Replaces literal question marks (?) with dashes (-), for those mystery exports
clean () {
    sed -i 's/\r//g; s/[\xC2\xA0]/ /g; s/?/-/g' "$@"
}

# (2) trimws - Remove trailing whitespace from each line (in place)
# Usage:   trimws file1 [file2 ...]
trimws () {
    sed -i 's/[[:space:]]\+$//' "$@"
}

# (3) noempty - Remove all empty lines (in place)
# Usage:   noempty file1 [file2 ...]
noempty () {
    sed -i '/^$/d' "$@"
}

# (4) tabs2spaces - Convert tabs to four spaces (in place)
# Usage:   tabs2spaces file1 [file2 ...]
tabs2spaces () {
    expand -t 4 "$@" > tmp && mv tmp "$@"
}

# (5) nobom - Remove UTF-8 BOM from the start of file (in place)
# Usage:   nobom file1 [file2 ...]
nobom () {
    sed -i '1s/^\xEF\xBB\xBF//' "$@"
}

# (6) superclean - Throw the kitchen sink at your files (in place)
# Usage:   superclean file1 [file2 ...]
# What it does:
#   - Removes Windows carriage returns (\r)
#   - Converts weird Unicode non-breaking spaces to normal spaces
#   - Replaces literal question marks (?) with dashes (-)
#   - Removes trailing whitespace
#   - Removes empty lines
#   - Converts tabs to four spaces
#   - Removes UTF-8 BOM (Byte Order Mark)
# Why? Because data is sometimes filthier than your browser history.
superclean () {
    for file in "$@"; do
        # Remove Windows carriage returns, non-breaking spaces, question marks
        sed -i 's/\r//g; s/[\xC2\xA0]/ /g; s/?/-/g' "$file"
        # Remove trailing whitespace
        sed -i 's/[[:space:]]\+$//' "$file"
        # Remove empty lines
        sed -i '/^$/d' "$file"
        # Remove UTF-8 BOM
        sed -i '1s/^\xEF\xBB\xBF//' "$file"
        # Convert tabs to four spaces (requires expand)
        expand -t 4 "$file" > "${file}.superclean_tmp" && mv "${file}.superclean_tmp" "$file"
    done
}

#------------------------------------------------------------------------------
# Don't burn out, set a timer. Focus. Timer Goes off. Take a breather.
#------------------------------------------------------------------------------
timer() {
    local min="$1"
    if [[ -z "$min" ]]; then
        echo "Usage: timer <minutes>"
        return 1
    fi
    local sec=$((min * 60))
    ( sleep "$sec" && echo -e "\aTime's up! $min minute(s) have elapsed, $USER." ) &
    echo "Timer set for $min minute(s). You'll get a terminal bell and message."
}


#------------------------------------------------------------------------------
# Reload your configs, because "turn it off and on again" applies to Bash too.
#------------------------------------------------------------------------------
alias reloadbash='source ~/.bashrc && echo "Reloaded ~/.bashrc"'
alias reloadalias='source ~/.alias.bash && echo "Reloaded ~/.alias.bash"'

##############################################################################
# For more info, see the accompanying README.md in this dotfiles repository.
##############################################################################