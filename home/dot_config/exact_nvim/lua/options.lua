require("nvchad.options")

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.filetype.add {
  pattern = {
    [".*%.ps1%.tmpl"] = "ps1",
    [".*%.yaml%.tmpl"] = "yaml",
    [".*%.zsh%.tmpl"] = "zsh",
  },
}
