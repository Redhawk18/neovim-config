return {
vim.lsp.config("nixd", { cmd = {"nixd"}, filetypes = {"nix"}, root_markers = {"flake.nix", "configuration.nix", ".git"},
}), }
