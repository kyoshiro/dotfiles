return {
  {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function on_attach_change(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return {
          desc = "nvim tree: " .. desc,
          buffer = bufnr,
          noremap  = true,
          focus = false,
          silent = true,
          nowait = true,
        }
      end

      api.config.mappings.default_on_attach(bufnr)
    end

      require("nvim-tree").setup({
	on_attach = on_attach_change,
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
        update_focused_file = {
          enable = true,
          update_root = {
            enable = true,
            ignore_list = {},
          },
          exclude = false,
        },
      })
    end
    }
}
