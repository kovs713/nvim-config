return {
	"thePrimeagen/harpoon",
	enabled = true,
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
			},
		})

		--Harpoon Nav Interface
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon [A]dd file" })
		vim.keymap.set("n", "<leader>E", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, {desc = "Harpoon m[E]nu"})

		--Harpoon marked files
		vim.keymap.set("n", "<leader>h", function()
			harpoon:list():select(1)
		end, {desc = "Harpoon select 1"})
		vim.keymap.set("n", "<leader>j", function()
			harpoon:list():select(2)
		end, {desc = "Harpoon select 2"})
		vim.keymap.set("n", "<leader>k", function()
			harpoon:list():select(3)
		end, {desc = "Harpoon select 3"})
		vim.keymap.set("n", "<leader>l", function()
			harpoon:list():select(4)
		end, {desc = "Harpoon select 4"})

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>{", function()
			harpoon:list():prev()
		end, {desc = "Harpoon goto prev"})

		vim.keymap.set("n", "<leader>}", function()
			harpoon:list():next()
		end, {desc = "Harpoon goto next"})
	end,
}
