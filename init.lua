-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require("packer").use
require("packer").startup(
  function()
    use "wbthomason/packer.nvim" -- Package manager
    -- use 'tpope/vim-fugitive'           -- Git commands in nvim
    use "tpope/vim-commentary" -- "gc" to comment visual regions/lines
    -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
    use "editorconfig/editorconfig-vim"
    --
    -- UI to select things (files, grep results, open buffers...)
    use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}
    use "joshdick/onedark.vim" -- Theme inspired by Atom
    use {"crispgm/nord-vim", branch = "develop"} -- Nord theme
    use "rafamadriz/neon"
    use "folke/tokyonight.nvim"
    use "itchyny/lightline.vim" -- Fancier statusline
    use "christoomey/vim-tmux-navigator" --
    use "yamatsum/nvim-cursorline" -- fancier cursorline + highlights word under cursor
    --
    -- Add indentation guides even on blank lines
    use "lukas-reineke/indent-blankline.nvim"

    use "mg979/vim-visual-multi" -- multiple cursors
    --
    -- Startup Time
    use "tweekmonster/startuptime.vim"
    -- reload configs
    use "famiu/nvim-reload"
    --
    -- TreeSitter
    use "nvim-treesitter/nvim-treesitter"
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/nvim-treesitter-refactor"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- formatter
    use "mhartington/formatter.nvim"

    -- coc
    use {"neoclide/coc.nvim", branch = "release"}
    --
    -- File browser
    use "kyazdani42/nvim-web-devicons"
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons" -- optional, for file icon
      },
      config = function()
        require "nvim-tree".setup {}
      end
    }
    --
    -- Add git related info in the signs columns and popups
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
    use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
    use "hrsh7th/nvim-compe" -- Autocompletion plugin
  end
)

--Incremental live completion
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true
vim.wo.rnu = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.cmd [[set undofile]]

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- nowrap
vim.o.wrap = false

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"
vim.g.cursorline_timeout = 250

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.g.neon_style = "default"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.cmd [[colorscheme tokyonight]]

--Set statusbar
vim.g.lightline = {
  colorscheme = "onedark",
  active = {left = {{"mode", "paste"}, {"gitbranch", "readonly", "filename", "modified"}}},
  component_function = {gitbranch = "fugitive#head"}
}

--Remap , as leader key
vim.api.nvim_set_keymap("", ",", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = ","
vim.g.maplocalleader = ","

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})

--Remap escape to leave terminal mode
vim.api.nvim_exec(
  [[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]],
  false
)

--Add map to enter paste mode
vim.o.pastetoggle = "<F3>"

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = {"help", "packer"}
vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
vim.g.indent_blankline_char_highlight = "LineNr"

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == "a" then
    vim.cmd [[IndentBlanklineDisable]]
    vim.wo.signcolumn = "no"
    vim.o.mouse = "v"
    vim.wo.number = false
    print("Mouse disabled")
  else
    vim.cmd [[IndentBlanklineEnable]]
    vim.wo.signcolumn = "yes"
    vim.o.mouse = "a"
    vim.wo.number = true
    print("Mouse enabled")
  end
end

vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua ToggleMouse()<cr>", {noremap = true})

-- Telescope
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false
      }
    },
    generic_sorter = require "telescope.sorters".get_fzy_sorter,
    file_sorter = require "telescope.sorters".get_fzy_sorter
  }
}

-- Git signs
require("gitsigns").setup()

--Add leader shortcuts
vim.api.nvim_set_keymap(
  "n",
  "<leader>p",
  [[<cmd>lua require('telescope.builtin').find_files()<cr>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>b",
  [[<cmd>lua require('telescope.builtin').buffers()<cr>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>l",
  [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>t",
  [[<cmd>lua require('telescope.builtin').tags()<cr>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>?",
  [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sd",
  [[<cmd>lua require('telescope.builtin').grep_string()<cr>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sp",
  [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>o",
  [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gc",
  [[<cmd>lua require('telescope.builtin').git_commits()<cr>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gb",
  [[<cmd>lua require('telescope.builtin').git_branches()<cr>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gs",
  [[<cmd>lua require('telescope.builtin').git_status()<cr>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gp",
  [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]],
  {noremap = true, silent = true}
)

-- splits
vim.api.nvim_set_keymap("n", "<leader>v", [[<C-w>v<C-w>l]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>h", [[<C-w>s<C-w>j]], {noremap = true, silent = true})

-- reload config
vim.api.nvim_set_keymap("n", "<leader>r", [[<cmd>so $MYVIMRC<CR>]], {noremap = true, silent = true})
-- comments
vim.api.nvim_set_keymap("n", "<leader>/", [[gcc]], {noremap = false, silent = false})
vim.api.nvim_set_keymap("v", "<leader>/", [[gcc]], {noremap = false, silent = false})
-- tree
-- nnoremap <silent> <leader>n :NERDTreeToggle<CR>
-- no help
vim.api.nvim_set_keymap("n", "<F1>", [[<nop>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<F1>", [[<nop>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<F1>", [[<nop>]], {noremap = true, silent = true})

-- clear search results
vim.api.nvim_set_keymap("n", "//", [[<cmd>nohls<CR>]], {noremap = false, silent = true})

-- toggle file browser
vim.api.nvim_set_keymap("n", "<leader>n", [[<cmd>NvimTreeToggle<CR>]], {noremap = true, silent = true})

-- Change preview window location
vim.g.splitbelow = true

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Y yank until the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true})
--
-- LSP settings
local nvim_lsp = require("lspconfig")
local on_attach = function(_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

-- Enable the following language servers
local servers = {"clangd", "rust_analyzer", "pyright", "tsserver"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {on_attach = on_attach}
end

local sumneko_root_path = vim.fn.getenv("HOME") .. "/.local/bin/sumneko_lua" -- Change to your sumneko root installation
local sumneko_binary_path = "/bin/linux/lua-language-server" -- Change to your OS specific output folder
nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_root_path .. sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"},
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        globals = {"vim"}
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
      }
    }
  }
}

-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noinsert"

-- Compe setup
require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    nvim_lsp = true
  }
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

require("formatter").setup(
  {
    logging = true,
    filetype = {
      typescriptreact = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      css = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      typescript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      javascript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      svelte = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      json = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      javascriptreact = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      rust = {
        -- Rustfmt
        function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

-- format on save
vim.cmd [[
augroup FormatAutogroup
autocmd!
autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.rs,*.lua FormatWrite
augroup END
]]
