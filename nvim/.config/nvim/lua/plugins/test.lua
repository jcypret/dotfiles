return {
  {
    -- polyglot test runner
    "vim-test/vim-test",
    init = function()
      vim.g.root_markers = { "package.json", "mix.exs", ".git/" }
      vim.g["test#strategy"] = "neovim"

      vim.cmd([[
        function! s:RunVimTest(cmd)
          for marker in g:root_markers
            let marker_file = findfile(marker, expand('%:p:h') . ';')
            if strlen(marker_file) > 0
              let g:test#project_root = fnamemodify(marker_file, ':p:h')
              break
            endif
            let marker_dir = finddir(marker, expand('%:p:h') . ';')
            if strlen(marker_dir) > 0
              let g:test#project_root = fnamemodify(marker_dir, ':p:h')
              break
            endif
          endfor
          execute a:cmd
        endfunction

        nnoremap <silent> <leader>t :call <SID>RunVimTest('TestNearest')<cr>
        nnoremap <silent> <leader>T :call <SID>RunVimTest('TestFile')<cr>
        nnoremap <silent> <leader>S :call <SID>RunVimTest('TestSuite')<cr>
        nnoremap <silent> <leader>l :call <SID>RunVimTest('TestLast')<cr>
        nnoremap <silent> <leader>L :call <SID>RunVimTest('TestVisit')<cr>
        " Use ctr-o to leave test output on screen
        tnoremap <c-o> <c-\><c-n>
      ]])
    end,
  },
}
