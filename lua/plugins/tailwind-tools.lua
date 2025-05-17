return {
  'luckasRanarison/tailwind-tools.nvim',
  ft = { 'html', 'vue', 'svelte', 'astro' },
  config = function()
    vim.g.tailwind_sort_classnames = 1
  end,
}
