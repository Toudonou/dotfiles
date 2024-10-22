local status, masonlsp = pcall(require, "mason-lspconfig")

if not status then
    return
end

masonlsp.setup({
    automatic_installation = true,
    ensure_installed = {
        "clangd",
        "lua_ls",
        "cssls",
        "eslint",
        "html",
        "jsonls",
        "tsserver",
        "pyright",
        "tailwindcss",
    },
})
