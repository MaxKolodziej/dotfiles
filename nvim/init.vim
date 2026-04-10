 let g:airline_powerline_fonts=1

 set laststatus=2

 if exists(':GuiFont')
 " Use GuiFont! to ignore font errors
   set guifont=Monaco:h16
 endif

 source ~/.config/nvim/plug.vim

 source ~/.config/nvim/settings.vim

 source ~/.config/nvim/mappings.vim

 source ~/.config/nvim/lua_config.lua
