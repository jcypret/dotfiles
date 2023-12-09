return {
  {
    -- file system explorer
    'scrooloose/nerdtree',
    cmd = {'NERDTreeToggle', 'NERDTreeFind'},
    init = function()
      vim.g.NERDTreeUpdateOnCursorHold = 0
    end,
    keys = {
      {'<c-n>', ':NERDTreeToggle<cr>'},
      {'<leader>n', ':NERDTreeFind<cr>'},
    },
  },
  'arp242/jumpy.vim', -- filetype-specific mappings for [[ and ]]
  'christoomey/vim-tmux-navigator', -- seamless navigation between tmux panes and vim splits
  'gioele/vim-autoswap', -- stop the swap file messages and just switch to correct window
  'pbrisbin/vim-mkdir', -- auto create any non-existent directories before writing buffer
  'simeji/winresizer', -- vim motion moving and resizing of windows
  'tpope/vim-eunuch', -- helpers for UNIX (:Delete, :Move, :Rename)
}
