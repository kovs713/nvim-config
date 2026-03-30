local M = {}

function M.setup()
  vim.pack.add {'https://github.com/HakonHarnes/img-clip.nvim'}
  vim.cmd.packadd 'img-clip.nvim'

  local img_clip = require 'img-clip'
  local map = vim.keymap.set

  img_clip.setup {
    default = {
      insert_mode_after_paste = true,
      url_encode_path = true,
      template = '$FILE_PATH',
      use_cursor_in_template = true,

      prompt_for_file_name = true,
      show_dir_path_in_prompt = true,

      use_absolute_path = false,
      relative_to_current_file = true,

      embed_image_as_base64 = false,
      max_base64_size = 10,

      dir_path = function()
        local cwd = vim.fn.getcwd()
        local vault_name = 'obsidian-vault'
        local vault_images_path = 'static/images/'

        if cwd:match(vault_name) then
          return vault_images_path
        else
          return 'assets'
        end
      end,

      drag_and_drop = {
        enabled = true,
        insert_mode = true,
        copy_images = true,
        download_images = true,
      },
    },
  }
  map('n', '<leader>pi', '<cmd>PasteImage<cr>', { desc = 'Paste image from system clipboard' })
end

return M
