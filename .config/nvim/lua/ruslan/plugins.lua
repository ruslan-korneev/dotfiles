local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use { "sitiom/nvim-numbertoggle" } -- number toggle

  -- neosolarized
  use {
    "svrana/neosolarized.nvim",
    requires = { "tjdevries/colorbuddy.nvim" }
  }
  use "nvim-lualine/lualine.nvim" -- Statusline
  use "nvim-lua/plenary.nvim" -- Common utilities
  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
  use "hrsh7th/nvim-cmp" -- Completion
  use "neovim/nvim-lspconfig" -- LSP
  use "jose-elias-alvarez/null-ls.nvim" -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  use "glepnir/lspsaga.nvim" -- LSP UIs
  use "L3MON4D3/LuaSnip"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  }
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "MunifTanjim/nui.nvim"
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          width = 30,
        },
        buffers = {
          follow_current_file = true,
        },
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            hide_dotfiles = true,
            hide_gitignored = true,
            never_show = {
              ".DS_Store",
              ".idea",
              "__pycache__",
            },
          },
        },
      })
    end
  }
  use "nvim-tree/nvim-web-devicons"
  use "vijaymarupudi/nvim-fzf"
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use "norcalli/nvim-colorizer.lua"
  use "folke/zen-mode.nvim"
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use "akinsho/nvim-bufferline.lua"

  use "lewis6991/gitsigns.nvim"
  use "dinhhuy258/git.nvim" -- For git blame & browse

  -- Obsidian-like neovim
  use {
    "renerocksai/telekasten.nvim",
    requires = { "nvim-telescope/telescope.nvim" }
  }
  use "renerocksai/calendar-vim"
end)
