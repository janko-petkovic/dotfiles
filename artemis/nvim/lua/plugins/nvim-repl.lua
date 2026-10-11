return {
  'https://github.com/pappasam/nvim-repl',
  opts = {
    filetype_commands = {
      javascript = {cmd = "deno repl"},
      python = {cmd = "compgen -c | grep activate "},
    },
    default = {cmd = "bash", filetype = "sh"},
    open_window_default = "bo vnew",
  }
}
