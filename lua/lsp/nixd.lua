return {
	-- Helper to dynamically get the local hostname
	local hostname_expr = [[
	  let
	    # Read hostname and strip the trailing newline
	    name = builtins.replaceStrings ["\n"] [""] (builtins.readFile "/etc/hostname");
	    # Load your flake from its standard location
	    flake = builtins.getFlake "/etc/nixos";
	  in
	    flake.nixosConfigurations.${name}.options
	]]

	vim.lsp.config("nixd", {
		cmd = { "nixd" },
		filetypes = { "nix" },
		root_markers = { "flake.nix", "configuration.nix", ".git" },
		settings = {
			nixd = {
				nixos = {
					expr = hostname_expr,
				},
				options = {
					nixos = {
						expr = hostname_expr,
					},
				},
			},
		},
	}),
}
