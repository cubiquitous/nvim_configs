-- from u/m00fin
-- creates persistent foldings and saves cursor location_
vim.cmd([[
	function! MakeViewCheck()
		if has('quickfix') && &buftype =~ 'nofile'
			" Buffer is marked as not a file
			return 0
		endif
		if empty(glob(expand('%:p')))
			" File does not exist on disk
			return 0
		endif
		return 1
	endfunction
	augroup vimrcAutoView
		autocmd!
		" Autosave & Load Views.
		autocmd BufWritePost,BufLeave,BufWinLeave,WinLeave ?* if MakeViewCheck() | mkview! | endif
		autocmd BufWinEnter ?* if MakeViewCheck() | normal! zx
		autocmd BufWinEnter,BufWritePost ?* if MakeViewCheck() | silent! loadview | endif
	augroup end
]])

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- creates small delay until the autocomplete dropdown shows up
vim.cmd([[
  let s:timer = 0
  autocmd TextChangedI * call s:on_text_changed()
  function! s:on_text_changed() abort
    call timer_stop(s:timer)
    let s:timer = timer_start(250, function('s:complete'))
  endfunction
  function! s:complete(...) abort
    lua require('cmp').complete({ reason = require('cmp').ContextReason.Auto })
  endfunction
]])

-- show name of the file in TMUX
vim.cmd(
	[[ autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . fnamemodify(expand('%'), ':t') ) ]]
)

vim.cmd([[
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
     execute "set rtp+=" . g:opamshare . "/merlin/vim"
]])

vim.cmd([[
	highlight NonText guibg=none
	highlight Normal guibg=none

	augroup user_colors
	  autocmd!
	  autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
	augroup END
]])

function OpenPathWithXdgOpen()
	local line = vim.api.nvim_get_current_line()
	local path = string.match(line, [["(.-)"]])
	if path then
		vim.fn.system('xdg-open "' .. path .. '"')
	else
		print("No path found between quotes")
	end
end

--
vim.api.nvim_set_keymap("n", "<Leader>o", ":lua OpenPathWithXdgOpen()<CR>", { silent = true })

vim.cmd([[let g:netrw_browsex_viewer= "xdg-open"]])
