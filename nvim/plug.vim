call plug#begin()

 Plug 'nvim-lualine/lualine.nvim'
 Plug 'nvim-tree/nvim-web-devicons'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-abolish'
 Plug 'kopischke/vim-fetch'
 Plug 'Lokaltog/vim-easymotion'
 Plug 'vim-scripts/YankRing.vim'
 Plug 'tpope/vim-eunuch'
 Plug 'chaoren/vim-wordmotion'

 Plug 'neovim/nvim-lspconfig'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'hrsh7th/cmp-buffer'
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-cmdline'
 Plug 'hrsh7th/nvim-cmp'

 Plug 'kristijanhusak/vim-js-file-import'
 Plug 'dense-analysis/ale'
 Plug 'scrooloose/vim-colon-therapy'

 Plug 'xolox/vim-misc'
 Plug 'vim-ruby/vim-ruby'
 Plug 'tpope/vim-rails'
 Plug 'tpope/vim-rbenv'

 Plug 'nvim-treesitter/nvim-treesitter'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'othree/yajs.vim'
 Plug 'mxw/vim-jsx'

 Plug 'junegunn/fzf'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

 Plug 'MarcWeber/vim-addon-mw-utils'
 Plug 'tomtom/tlib_vim'

 Plug 'rcarriga/nvim-notify'
 Plug 'https://github.com/A-raj468/pomo.nvim.git'

 " Plug "sirver/ultisnips"

 " vim-scripts repos
 "Plug 'L9'
 Plug 'godlygeek/tabular'
 " non github repos
 "Plug 'git://git.wincent.com/command-t.git'
 " ...
call plug#end()
