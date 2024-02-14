local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

local on_attach = function(client, bufnr)
	local attach_opts = {
		silent = true,
		buffer = bufnr,
		noremap = true
	}

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	-- Formatting on save
	if client.supports_method("textDocument/formatting") then
		local event = "BufWritePre"

		vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffnr })
		vim.api.nvim_create_autocmd(event, {
			buffer = bufnr,
			group = augroup,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
			desc = "Format on save",
		})
	end
end

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach
		})
	end
})

local signs = {
	Error = "",
	Warn = "",
	Hint = "",
	Info = ""
}

for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
