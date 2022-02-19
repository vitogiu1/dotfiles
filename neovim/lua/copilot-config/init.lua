vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--Se o copilot não estiver funcionando corretamente, tente descomentar as linhas abaixo:
  -- vim.g.copilot_filetypes = {
  --   ["*"] = false,
  --   ["javascript"] = true,
  --   ["typescript"] = true,
  --   ["lua"] = true,
  --   ["rust"] = true,
  --   ["c"] = true,
  --   ["c#"] = true,
  --   ["c++"] = true,
  --   ["go"] = true,
  --   ["python"] = true,
  -- }
