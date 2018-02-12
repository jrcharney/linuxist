" File: ~/.vimrc
" Info: This file defines the settings in vim
"	The goal is to make vim be as functional as an Integrated Development Environment (IDE)
"	but in a textual user interface (TUI).
"	I recommend installing vim-nox instead of vim because then other
"	software languages like lua, C, and C++ can be installed.
"	Resources of note:
"	  * Vim Subreddit https://www.reddit.com/r/vim/
"	  * Vim Wikia http://vim.wikia.com/
"   * I recommend downloading the Hack font for use in WSL, Putty, Kitty, etc.
"       Get it here: https://sourcefoundry.org/hack/
"       Also NERD FONTS! https://github.com/ryanoasis/nerd-fonts 
"   * Also GET WSLTTY! https://github.com/mintty/wsltty/releases
"       The Ubuntu Terminal from the Microsoft Store DOES NOT support any of
"       powerline symbols not even with UTF-8 enforced because it is still a
"       crappy CMD.exe interface!  Mintty is NOT like that! It enabled the
"       symobls.  So use Mintty's Ubuntu Terminal.
" WISHLIST: Hintline.vim - a vim script that provides helpful hints when the
" command line is not being used. Midnight Commander has something like this.
" TODO: Split this file into smaller files that can be sourced.

" If your terminal supports 256 colors, use them. I recommend this. Everything is more vibrant!
if( $TERM == "xterm-256color" || $TERM == "screen-256color" || $TERM == "tmux-256color" )
	set t_Co=256
endif
" Colorschemes are set after the Plugins section.

set shell=/bin/bash		" set shell to bash if using fish or zsh

set nocompatible		" be iMproved, required
filetype off			" required (we'll turn this back on later)

" We want to use Vundle for vim plugins
" To install
" 1. Install git if it hasn't been installed yet.
" 2. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
" 3. Put all this stuff near the top of your .vimrc file.

" Brief Vundle Help
" Usage:
"	1. Add the `Plugin 'GitUser/repoPlugin'` project to the list below the
"	   `Plugin 'VundleVim/Vundle.vim'` line.
"	   If the plugin is dependent on other plugins, make sure that plugin
"	   is listed below any of its dependencies.
"	   You do not need to download anything into your `~/.vim/` or `~/.vim/bundle`
"	   directories, as Vundle should download that for you.
"	2. Run `:PluginInstall` to download and install the software.
"		To install from command line instead: `vim +PluginInstall +qall`
"
" Short list of commands
"	:h vundle		- detailed Vundle help either as a wiki or FAQ
"	:PluginList		- List the configured plugins
"	:PluginInstall		- Install plugins; append `!` to update
"	:PluginUpdate		- Update plugins; same as `:PluginInstall!`
"	:PluginSearch foo	- Searches for foo; append `!` to refrensh local.cache
"	:PluginClean		- Confirm removal of unused plugins; append `!` to auto-approve removal

" set the runtime path to include Vunle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" set rtp^=~/.vim/bundle/ctrlp.vim	" TODO: Uncomment this once the other plugins are installed or get a second opinion
call vundle#begin()		" required

" let Vundle manage Vundle, required.
Plugin 'VundleVim/Vundle.vim'
" Put all your other plugins below this line.
" Non Plugin stuff should be done after the `call vundle#end()`


Plugin 'flazz/vim-colorschemes'

" vim-shell - Improved integration between Vim and its environment
" 	It's been a few years since this one has been updated.
"	https://github.com/xolox/vim-shell
" vim-misc - Miscellaneous auto-load Vim scripts.
" 	It's been a few years since it was used. Not sure if I can use it with Vundle.
" 	https://github.com/xolox/vim-misc
" TODO: I think I need to use github to get these two.
"Plugin 'xolox/vim-shell'
"Plugin 'xolox/vim-misc'

" Vim Airline is a popular plugin to make vim look modern.
" If you are going to use this, you may want to install the NerdFonts (http://nerdfonts.com/)
" on your local machine. This is necessary or your interface will look weird
" and have all sorts of Chinese glyphs.  256 colors are also a must.  If you
" are using tmux, you will also need to tell it to use 256 colors so that vim
" can use 256 colors in tmux.
" One of the things I've noticed is that blues appear too dark on many shells
" especially the Ubuntu bash shell used on Windows. You can use .bashrc PS1
" generator (http://bashrcgenerator.com/) to fix that. For color schemes,
" Terminal.sexy (https://terminal.sexy/) is also helpful.
" We will also want to apply the same thing to tmux, 
" which requres a separate plugin called tmuxline.vim
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'

" The legendary plugins by Tim Pope
" vim-sensible - Defaults everyone can agree on
" vim-surround - parenthesis compeltion
" vim-fugitive - A Git wrapper so awesome, it should be illegal.
" vim-commentary - use 'gcc' to comment out a line and 'gcgc' to uncomment it.
" vim-repeat - enable repeating supported plugin maps with '.'
" vim-speeddating - Use CTRL-A/CTRL-X to increment dates, times, and more.
" vim-abolish - easily search for, substitute, and abbreviation multiple variants of a word
" vim-unimpaired - pairs of handy bracket mappings
" vim-markdown - Vim Markdown runtile files
" vim-projectionist - Vim project configuration
" vim-scriptease - A Vim plugin for making Vim plugins
" Plugin 'tpope/vim-sensible'   " CONFLICT! vim-senible keeps turning on incsearch
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-scriptease'

" Version Control Gutters
" Gutters can be used to control hunks (blocks of code that were changed in version control software.)
" If you use git, you should consider using vim-gitgutter.
" If you are using some other version control sytem (i.e. Mercurial), use vim-signify.
" I will be using vim-gitgutter.
Plugin 'airblade/vim-gitgutter'
" Plugin 'mhinz/vim-signify'
"  GitGutter useage:
"  * :GitGutterDisable			          Turn Git Gutter off
"  * :GitGutterEnable			            Turn Git Gutter on
"  * :GitGutterToggle			            Toggle Git Gutter
"  * :GitGutterSignsEnable		        Turn the signs on in Git Gutter
"  * :GitGutterSignsDisale		        Turn the signs off in Git Gutter
"  * :GitGutterSignsToggle		        Toggle signs in Git Gutter
"  * :GitGutterLineHighlightEnable	  Enable line highlighting
"  * :GitGutterLineHighlightDisabled	Disabled line highlighting
"  * :GitGutterLineHighlightToggle	  Toggle line highlighting
"  * [c					                      Jump to the previus hunk (change)
"  * ]c					                      Jump to the next hunk (change)
"  	Both commands take a preceding count.
"  * <Leader>hs				Stage a hunk
"  * <Leader>hu				Undo it
"  * <Leader>hv				Preview hunk
"  * ic					      Operate on all lines in the current hunk
"  * ac					      Operate on all lines in the current hunk and any trailing empty lines
"  :GitGutterAll			Force Git Gutter to update its signs across all visible buffters
" There's a ton of other stuff, but if I keep typing it, we will never get
" anything done! So visit https://github.com/airblade/vim-gitgutter
" See https://pawelgrzybek.com/git-tip-staging-hunk-of-code-via-command-line/
" for how to stage a hunk of code vial the command line
" 	git add -p helpers.js	" Use the patch option on git add
" You will then be asked what to do
" 	Stage this hunk [y,n,q,a,d,/,s,e,?]?
" 	y - yes, stage this hunk
" 	n - no, do not stage this hunk
" 	q - quit, do not this hunk or any of the remaining hunks
" 	a - all, stage this hun and all later hunks in the file
" 	d - deny, do not stage this hunk or any of the the later hunks in the file
" 	/ - search, search for a hunk matching the given regex
" 	s - split, split the current hunk into smaller hunks
" 	e - edit, manunally edit the current hunk
" 	? - help, print help

" Peter Odding plugins (http://peterodding.com/)
" vim-shell - Improved integration between Vim and its environment (fullscreen, open URL, background command execution)
" vim-misc - Miscellaneous auto-load Vim scripts
" vim-easytags - Automated tag file generation and syntax highlighting of tags in Vim
" 	You may want to install exuberant-ctags ('sudo apt install exuberant-ctags')
" vim-session - Extended session management for Vim (:mksession of steroids)
" vim-notes - Easy note taking in Vim
" vim-colorscheme-switcher - Make it easy to quickly switch between color schemes in Vim
" vim-reload - Automatic reloading of Vim scripts ((file-type) plug-ins, autoload/syntax/indent scripts, colorschemes
" vim-publish - Published hyperlinked, syntax highlighted source code.
Plugin 'xolox/vim-shell'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-reload'
" Plugin 'xolox/vim-publish'

" NERDTree
" Activate NERDTree with `:NERDTreeToggle`
" I've assigned this to F9
" nerdtree-git-plugin was added for git functionality
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Syntastic - Syntax checking hacks for vim
Plugin 'vim-syntastic/syntastic'

" ctrlp.vim - Fuzzy file, buffer, mru (most recent used), tag, etc. finder
" Plugin 'ctrlpvim/ctrlp.vim'	" TODO: uncomment this later

" vim-multiedit - Multiple cursors in vim like in Sublime Text or Atom
Plugin 'hlissner/vim-multiedit'

" emmet-vim - emmet for vim.
" See https://emmet.io/
" See https://mattn.github.io/emmet-vim/
Plugin 'mattn/emmet-vim'

" Snippets!
" We won't be using YouCompleteMe because of the overhead from Python.
" vim-addon-mw-utils - Interpret a file by function and cache file automatically
" tlib_vim - Some utility functions for Vim.
" vim-snipmate - a concise vim script that implements some of TextMate's
" 		snippets features in Vim. (Textmate is a text editor which is
" 		like gedit for Linux, but it is for Mac and has more features.
" 		vim-snipmates depends on tlib and vim-addon-mw-utils
" vim-snippets - vim-snipmate default snippets
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'

" Despite being 92% Python, a lot of folks on the vim subreddit really like UltiSnips
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

" YouCompleteMe - A code completion engine for vim.
" CAUTION: YouCompleteMe may eat up resources and conflucs with UltiSnips.
" YCM requires the following be installed:
"   cmake python-dev python3-dev
" It also wants clang. So to do that, you should look at
"   https://blog.kowalczyk.info/article/k/how-to-install-latest-clang-5.0-on-ubuntu-16.04-xenial-wsl.html
" For node support, you need to have node and npm installed.
" For Go support, go must be installed.
" For C# support, Mono must be installed and xbuild must be available.
" For TypeScript support, node, npm, and tsserver installed.
" For Rust support, rustc and cargo? must be installed.
" Before using it you need to compile the core library by going to
" the YCM directory (cd ~/.vim/bundle/YouCompleteMe) and running ./install.py
Plugin 'Valloric/YouCompleteMe'

" Vim Virtualenv - Vim plugin for working with python virtualenvs
" See https://github.com/plytophogy/vim-virtualenv
" This will modify Python's sys.path and the $PATH variable so anything done
" with :python or :!python will behave like you would expect for the chosen
" virtualenv.  You need to install virutalenv with pip.
" TODO: Will this also work for nodeenv?
" Plugin "plytophogy/vim-virtualenv"          " TODO: Fix this later. It won't work.

" ================================================================
" Put all your plugins above this line. You can apply settings below it however.
call vundle#end()		" required
filetype plugin indent on	" Turn this back on
" After you install plugins, be sure to run `:PluginInstall` afterwards.

" Colors
" Downloadable colorschemes can be downloaded to ~/.vim/colors from http://vimcolors.com/
set background=dark		" use bright colors if the background is dark
colorscheme molokai   " If you get an error, it's probably because the color scheme hasn't been downloaded yet

" See https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" See https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt 
" Enable the airline tabline
let g:airline#extensions#tabline#enabled = 1
" Show the file names only
let g:airline#extensions#tabline#fnamemod = ':t'

" whitespace messaging is too long! Let's turn it off.
let g:airline#extensions#whitespace#show_message = 0

" If you set the airline theme manually, make sure the `airline-tmuxline`
" extension is disabled so it doesn't overwrite the theme.
" let g:airline#extensions#tmuxline#enabled = 0
" TODO: How do I set the color scheme for that?
let g:airline#extensions#tmuxline#enable = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
" A line has been added to the ~/.tmux.conf file related to tmuxline

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}

    " TODO: Replace ALL of these with the symbols in the old file!
    "
    " unicode symbols (Don't use these)
    " let g:airline_left_sep = '»'
    " let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '«'
    " let g:airline_right_sep = '◀'
    " let g:airline_symbols.linenr = '␊'
    " let g:airline_symbols.linenr = '␤'
    " let g:airline_symbols.linenr = '¶'
    " let g:airline_symbols.branch = '⎇'
    " let g:airline_symbols.paste = 'ρ'
    " let g:airline_symbols.paste = 'Þ'
    " let g:airline_symbols.paste = '∥'
    " let g:airline_symbols.whitespace = 'Ξ'

    " airline symbols (Use these)
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'
    " TODO: Need to find symbols for paste and whitespace
endif

" Basic settings
set nu			      " enable line numbering
set sc			      " show partial commands
set nois          " turn off increment search
set hls           " Leave highlight search on. To disable it after a search, try `:set nohls`

" Set tabs and indenting
" I changed this from 4 spaces to 2
set ai			" Activate autoindent
set tabstop=2		" show existing tabs with 4 space width
set shiftwidth=2	" when indenting with '>', use 4 space width
set expandtab		" on pressing tab, insert 4 spaces.
" set updatetime=250	" set the update time (default is 4 seconds (4000))

" Auto-complete
" Actiate the auto complete menue like with an IDE. Use Omnicomplete (C-X,C-O)
set completeopt=longest,menuone
" set the colors for the menu. (Type `:highlight` to see what the settings are.)
highlight Pmenu ctermfg=12 ctermbg=15 guifg=Blue guibg=White
highlight PmenuSel term=bold ctermfg=15 ctermbg=12 guifg=White guibg=Blue
" TODO: Activate Omnicomplete support. Press Tab to complete words.

" utilize the wildmode
" This will allow you to complete command in the command line with <Tab> or whatever wildchar is
set wildignorecase
set wildmode=list:longest,full


" Use F2 to toggle Paste Mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Toggle Spelling errors with F5
map <F5> :setlocal spell! spelllang=en_us<CR>
imap <F5> <C-o>:setlocal spell! spelllang=en_us<CR>

" Vim Gutter
" let g:gitgutter_max_signs = 500			            " The most number of changes to track. (default value is 500)
" let g:gitgutter_avoid_cmd_prompt_on_windows = 0	" Prevent the command prompt from popping up when git-gutter runs on Windows.
" let g:gitgutter_map_keys = 0				            " Don't use any of Git Gutters mapped keys
" nmap [h <Plug>GitGutterPrevHunk			            " remap the previous hunk command
" nmap ]h <Plug>GitGutterNextHunk			            " remap the next hunk command
" nmap <Leader>ha <Plug>GitGutterStageHunk		    " remap the stage hunk command
" nmap <Leader>hr <Plug>GitGutterUndoHunk		      " remap the under hunk command
" nmap <Leader>hv <Plug>GitGutterPreviewHunk		  " remap the Preview Hunk command
" omap ih <Plug>GitGutterTextObjectInnerPending		" remap what ic does.
" omap ah <Plug>GitGutterTextObjectOuterPending		" remap what ac does.
" xmap ih <Plug>GitGutterTextObjectInnerVisual		" remap what ic does.
" xmap ah <Plug>GitGutterTextObjectOuterVisual		" remap what ac does.

set statusline+=%{fugitive#statusline()}		      " Add fugitive status to the status line

" Syntastic settings for noobs.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_poplulate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Display checker name for the error message
let g:syntastic_aggregate_errors = 1
" Set Python 3 and Flake8 to check Python.
" Flake8 is used for style guide enforcement.
" See http://flake8.pycqa.org/ for Flake8
" You will need to use pip to install Flake8.
let g:syntastic_python_checkers=['pylint','python']
" Better yet, use PyLint (https://www.pylint.org/). It has a UML editor!

" vim-notes preferences
let g:session_autosave = 'no'   " Disable dialogs asking if you want to save

" TODO: Status line symbols  or changing the font to a Powerline Nerdfont.

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" TODO: Consider remapping Forward and Backward Triggers
" TODO: Definintely needs a backspace Trigger to not pull the next line forward when we use it
let g:UltiSnipsExpandTrigger="<c-j>"          " Somebody suggested remaming this from <tab>
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window. (Let's not do that yet.)
" let g:UltiSnipsEditSplit="vertical"

" TODO: Is there anything in YouCompleteMe that needs to be configured?

" NERDTree settings
map <F9> :NERDTreeToggle<CR>

" If NERDTree is the only window left open, close Vim.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

if ( $TERM == 'xterm-256color' || $TERM == 'screen-256color' )
	" Symbol support
	" NERDtree (Woohoo! These are supported in JuiceSSH!)
	let g:NERDTreeDirArrowExpandable = '▸'
	let g:NERDTreeDirArrowCollapsible = '▾'

	" NERDTree Git plugin (EMOJI SUPPORT in JUICESSH!)
	let g:NERDTreeIndicatorMapCustom = {
	    \ "Modified"  : "✹",
	    \ "Staged"    : "✚",
	    \ "Untracked" : "✭",
	    \ "Renamed"   : "➜",
	    \ "Unmerged"  : "═",
	    \ "Deleted"   : "✖",
	    \ "Dirty"     : "✗",
	    \ "Clean"     : "✔︎",
	    \ 'Ignored'   : '☒',
	    \ "Unknown"   : "?"
	    \ }
endif 

" Map window and buffer movements
" Take a look at this
" http://vimdoc.sourceforge.net/htmldoc/windows.html#window-move-cursor 
" * A buffer is the in-memory text of a file.
" * A window is a viewport on a buffer.
" * A tab page is a collection of windows.
" map <C-Home> :tabfirst<CR>
" map <C-End> :tablast<CR>
" map <C-Tab> :tabnext<CR>
" map <C-S-Tab> :tabprev<CR>
" TODO: Find a way to present a list of buffers to browse through
" " map <C-Left>  <C-W> h
" " map <C-Right> <C-W> l
" " map <C-Up>  <C-W> k
" " map <C-Down>  <C-W> j
" TODO: Split commands like how tmux does it.
" " map <C-S-Left>  <C-W>
" " map <C-S-Right> <C-W>
" " map <C-S-Up>  <C-W>
" " map <C-S-Down>  <C-W>
" " map <C-PageUp>  <C-W> w
" " map <C-PageDown>  <C-W> W
" " map <C-S-PageUp>  <C-W> t
" " map <C-S-PageDown>  <C-W> b
" <C-W> p   goes to a previous window
" map <C-|> create a new tab right and go to it.
" map <C-S-|> create a new tab left and go to it.
" map <C--> create a new tab below and go to it.
" map <C-S--> create a new tab above and go to it.

set noshowmode		" Because we are using airline, we don't need show the current mode in the status bar. This needs to be at the bottom because some script is messing with it.

