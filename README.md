# My nvim configuration

## Installation

To use this configuration, you can do the following:
1. If you haven't already, install Neovim:
https://github.com/neovim/neovim/blob/master/INSTALL.md
2. Make or navigate to the \~/.config/ folder (\~/AppData/Local/ on Windows):
https://neovim.io/doc/user/starting.html#config
3. Clone this repo:
`git clone https://github.com/vassilyp/nvim` or
`git clone git@github.com:vassilyp/nvim.git`

Make sure the resultant file path is ~/.config/nvim or Windows equivalent
(NOTE: if you changed $XDG_CONFIG, you are on your own
with finding the correct file path)

4. Run Neovim: `nvim`

# Fun commands I learned recently

- ^W+d opens lsp diagnostics
- CTRL-^: Edit alternate (previous) file
- cCTRL-F:  opens cmd history
- git add -i: Interactive git mode
- g< and :messages: observe previous notification(s)
- ":cd %:h": Set directory to current file's directory

# Plugins to replace eventually (in order)

1. mini.surround
2. Autoformat on save
3. gitsigns
4. Telescope


# Misc notes

Auto format (without conform.nvim)
https://stackoverflow.com/questions/77466697/how-to-automatically-format-on-save

To delete cache:
rm -rf ~/.local/share/nvim

