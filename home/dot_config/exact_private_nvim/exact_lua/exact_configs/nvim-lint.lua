-- Don't include linters here unless they've been tested to work and be
-- sufficiently secure. At some point, sandboxing should be done in this.
--
-- Linters that also have a language service can also be skipped.
require("lint").linters_by_ft = {
  -- bash - use bashls
  dockerfile = { "hadolint" },
  editorconfig = { "editorconfig-checker" },
  -- fish - use fish_lsp
  yaml = { "yamllint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
  callback = function()
    require("lint").try_lint()

    -- TODO enable some global linters
  end,
})
