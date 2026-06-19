return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { ".git", "Cargo.toml", "cargo.toml" },
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                targetDir = true,
                allTargets = false,
            },
            check = {
                command = "check",
                workspace = false,
            },
        },
    },
}
