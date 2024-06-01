return {
	mode = { "n", "v" },

	e = { "<cmd>:Neotree float<cr>", "Neotree Float Window" },
	h = { ":nohlsearch<CR>", "No Highlight" },

	f = {
		name = "+Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find File (CWD)" },
		m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		l = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		c = { "<cmd>Telescope colorscheme<cr>", "Color Scheme" },
	},

	l = {
		name = "+LSP",
		a = { vim.lsp.buf.code_action, "Code Action" },
		A = { vim.lsp.buf.range_code_action, "Range Code Actions" },
		s = { vim.lsp.buf.signature_help, "Display Signature Information" },
		r = { vim.lsp.buf.rename, "Rename all references" },
		f = { vim.lsp.buf.format, "Format" },
		i = { require("telescope.builtin").lsp_implementations, "Implementation" },
		-- l = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
		-- L = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
		w = { require("telescope.builtin").diagnostics, "Diagnostics" },
		-- t = { require("telescope").extensions.refactoring.refactors, "Refactor" },
	},

	--    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
	--    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
	--    R = { "<cmd>Telescope registers<cr>", "Registers" },
	--    T = { "<cmd>Telescope grep_string<cr>", "Grep String" },
	--    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	--    C = { "<cmd>Telescope commands<cr>", "Commands" },
	--    l = { "<cmd>Telescope resume<cr>", "Resume last search" },
	--    c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
	--    B = { "<cmd>Telescope git_branches<cr>", "Git branches" },
	--    m = { "<cmd>Telescope git_status<cr>", "Git status" },
	--    S = { "<cmd>Telescope git_stash<cr>", "Git stash" },
	--    e = { "<cmd>Telescope frecency<cr>", "Frecency" },
	--    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
	--    d = {
	--      name = "+DAP",
	--      c = { "<cmd>Telescope dap commands<cr>", "Dap Commands" },
	--      b = { "<cmd>Telescope dap list_breakpoints<cr>", "Dap Breakpoints" },
	--      g = { "<cmd>Telescope dap configurations<cr>", "Dap Configurations" },
	--      v = { "<cmd>Telescope dap variables<cr>", "Dap Variables" },
	--      f = { "<cmd>Telescope dap frames<cr>", "Dap Frames" },
	--    },
	--    N = {
	--      function ()
	--        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
	--      end,
	--      "Search Neovim Config",
	--    },
}
