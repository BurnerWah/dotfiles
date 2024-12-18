-- Remove mise installs from path, and then add mise shims to it
local xdg_data = vim.env.XDG_DATA_HOME or vim.fs.joinpath(vim.env.HOME, ".local", "share")
local mise_data = vim.env.MISE_DATA_DIR or vim.fs.joinpath(xdg_data, "mise")
vim.env.PATH = string.gsub(vim.env.PATH, vim.fs.joinpath(mise_data, "installs") .. "/[^:]*:", "")
vim.env.PATH = vim.fs.joinpath(mise_data, "shims") .. ":" .. vim.env.PATH
