return {
  'rachartier/tiny-code-action.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'folke/snacks.nvim' },
  },
  event = 'LspAttach',
  opts = {
    backend = 'delta',
    picker = 'snacks',
  },
  config = function()
    require('tiny-code-action').setup {
      format_title = function(action, client)
        if action.kind then
          return string.format('%s (%s)', action.title, action.kind)
        end
        return action.title
      end,
    }
  end,
}
