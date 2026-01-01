vim.lsp.inlay_hint.enable()
vim.lsp.config('*', {
  on_attach = function(client, bufnr)
    require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
  end
})

vim.lsp.enable({
    'clangd',
    'cmake',
    'docker-compose',
    'docker',
    'json',
    'just',
    'lua',
    'nixd',
    'pyright',
    'rust-analyzer',
    'svelte',
    'typescript',
    'yaml'
})
