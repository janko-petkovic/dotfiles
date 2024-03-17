return {
  'lervag/vimtex',
  config = function()
    vim.cmd.filetype 'plugin indent on'
    vim.cmd.syntax 'enable'
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = 'output/aux',
      out_dir = 'output',
      callback = 1,
      continuous = 1,
      executable = 'latexmk',
      options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode'
      },
    }
    vim.g.vimtex_quickfix_ignore_filters = {
      'Underfull',
      'Overfull',
      'float specifier changed'
    }
  end
}
