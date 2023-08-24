---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
["<leader>rp"] = {
      ":lua local search = vim.fn.input('Search for: '); local replace = vim.fn.input('Replace with: '); vim.fn.feedkeys(':%s#' .. search .. '#' .. replace .. '#gi')<CR>",
      "Replace word"
    },

    -- lsp-keybinds
    ["<leader>K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover" },
    ["<leader>fm"] = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
    ["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    ["<leader>fi"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Autofix" },
    ["<leader>gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
    ["<leader>gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },

    -- vimtex stuff
    ["<leader>lc"] = { ":VimtexCompile<CR>", "Compile latex document" },
    ["<leader>lo"] = { ":VimtexView<CR>", "View latex output" },
    ["<leader>ll"] = { ":copen<CR>", "Open latex compiler output"},

    -- markdown
    ["<leader>mp"] = { ":MarkdownPreview<CR>", "Preview markdown" },

    -- surround
    ["<leader>sw"] = { ":lua local char = vim.fn.input('Enter surround symbol: '); vim.fn.feedkeys('ysiw' .. char .. '<CR>')<CR>", "Surround word" },
    ["<leader>sl"] = { ":lua local char = vim.fn.input('Enter surround symbol: '); vim.fn.feedkeys('yss' .. char .. '<CR>')<CR>", "Surround line" },
  },

  i = {
    ["<Tab>"] = { "<Tab>", "insert a tab character" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>n"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

-- more keybinds!

return M
