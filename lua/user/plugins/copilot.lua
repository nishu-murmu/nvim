vim.g.copilot_filetypes = { xml = false, java = false }

vim.g.copilot_no_tab_map = true
vim.cmd([[
imap <silent><script><expr> <CR> copilot#Accept("\<CR>")
]])
vim.cmd([[highlight CopilotSuggestion guifg=#555555 ctermfg=8]])
