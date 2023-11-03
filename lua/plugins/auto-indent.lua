return {
	"vidocqh/auto-indent.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function() 
		vim.keymap.set("n", "i", function()
  			if #vim.fn.getline(".") == 0 then
				return [["_cc]]
  			else
    				return "i"
  			end
		end, { expr = true, desc = "properly indent on empty line when insert" })
	end,
}
