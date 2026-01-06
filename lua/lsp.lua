vim.lsp.config('*', {
    root_markers = { '.git' },
})
vim.lsp.inlay_hint.enable()


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
