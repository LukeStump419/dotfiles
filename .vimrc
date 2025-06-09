##############################################################################
# ~/.vimrc - Vim Configuration  (by Luke Stump)
#
# For: Anyone who likes their code legible, their indentation consistent, and
#      their sanity intact while editing shell scripts or other things.
#      Heavily commented, because future-you won’t remember what any of this does.
#
# How to use:
#   1. Copy this file to ~/.vimrc in your home directory.
#   2. Open Vim. Be happy.
#
# WARNING:
#   - Read before you copy! Tweak as needed for your own workflow and screen.
#   - Some settings may offend Vim purists. I am not sorry.
##############################################################################

#------------------------------------------------------------------------------
# Show line numbers
#------------------------------------------------------------------------------
set number

#------------------------------------------------------------------------------
# Highlight the line your cursor is on -- very helpful to me.
#------------------------------------------------------------------------------
set cursorline

#------------------------------------------------------------------------------
# Syntax highlighting and filetype detection.
#------------------------------------------------------------------------------
syntax on
filetype plugin indent on

#------------------------------------------------------------------------------
# Tabs and indentation:
#   - expandtab:       Always use spaces.
#   - tabstop=2:       How many spaces a tab *looks* like.
#   - shiftwidth=2:    How many spaces for auto-indent.
#   - softtabstop=2:   How many spaces for a tab when editing.
#   - autoindent:      Keep indent from previous line.
#   - smartindent:     Vim tries to guess when you need an extra indent.
#   - smarttab:        Make tabs smart, or at least less dumb.
#------------------------------------------------------------------------------
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set smarttab

#------------------------------------------------------------------------------
# Highlight matching brackets, parens, etc..
#------------------------------------------------------------------------------
set showmatch

#------------------------------------------------------------------------------
# Show the filename in your terminal or window title bar.
#------------------------------------------------------------------------------
set title

#------------------------------------------------------------------------------
# (Optional) Show invisible characters, so you can see lurking tabs and spaces.
# Uncomment if you want to see every detail.
#------------------------------------------------------------------------------
" set list
" set listchars=tab:»·,trail:·,extends:»,precedes:«

#------------------------------------------------------------------------------
# Make searching slightly less awful:
#   - hlsearch: highlight all matches after search
#   - incsearch: highlight as you type
#------------------------------------------------------------------------------
set hlsearch
set incsearch

#------------------------------------------------------------------------------
# Enable mouse support.
# Comment out if you think mice are for amateurs.
#------------------------------------------------------------------------------
set mouse=a

#------------------------------------------------------------------------------
# Automatically remove trailing whitespace when saving.
#------------------------------------------------------------------------------
autocmd BufWritePre * :%s/\s\+$//e

#------------------------------------------------------------------------------
# For shell scripting: Run the current file with Bash by pressing F5.
# Only works when editing shell scripts.
#------------------------------------------------------------------------------
autocmd FileType sh nnoremap <F5> :w<CR>:!bash %<CR>

#------------------------------------------------------------------------------
# Open a new xterm and run the current file with Bash by pressing F6.
# Useful for testing quick-and-dirty scripts.
#------------------------------------------------------------------------------
nnoremap <F6> :w<CR>:!xterm -e bash % &<CR>

##############################################################################
# End of ~/.vimrc - For more info, see the dotfiles repo README.
##############################################################################
