local wk = require("which-key")
local mappings = {
  Q = {":wq<cr>", "Save & Quit"},
  f = {":Telescope find_files<cr>", "Telescope Find Files"}
}
local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
