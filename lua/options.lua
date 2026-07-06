vim.o.background = "dark"
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.scrolloff = 10
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.opt.autoindent = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.o.undofile = true

-- Pick the clipboard provider from the environment instead of relying on
-- Neovim's autodetection. All of wl-clipboard, xclip and lemonade are always on
-- $PATH here, so autodetection can't tell which one is actually usable and
-- wrongly falls back to lemonade (which errors with no server running) whenever
-- it can't see $WAYLAND_DISPLAY/$DISPLAY. We key off the session env instead,
-- and fall back to OSC 52 so copy still works over bare SSH / tmux / any
-- terminal with no display and no lemonade daemon.
local env = vim.env
if env.WAYLAND_DISPLAY and env.WAYLAND_DISPLAY ~= "" then
  vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
      ["+"] = "wl-copy",
      ["*"] = "wl-copy --primary",
    },
    paste = {
      ["+"] = "wl-paste --no-newline",
      ["*"] = "wl-paste --no-newline --primary",
    },
    cache_enabled = true,
  }
elseif env.DISPLAY and env.DISPLAY ~= "" then
  vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "xclip -quiet -i -selection clipboard",
      ["*"] = "xclip -quiet -i -selection primary",
    },
    paste = {
      ["+"] = "xclip -o -selection clipboard",
      ["*"] = "xclip -o -selection primary",
    },
    cache_enabled = true,
  }
else
  -- No local display server (SSH, tmux, a bare terminal). OSC 52 writes an
  -- escape sequence straight to the terminal emulator, which forwards it over
  -- SSH and sets the *real* clipboard on the machine you're sitting at -- no
  -- daemon or open port required, unlike lemonade. Works the same over
  -- localhost SSH or a remote host.
  local osc52 = require("vim.ui.clipboard.osc52")
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = osc52.paste("+"),
      ["*"] = osc52.paste("*"),
    },
  }
end
