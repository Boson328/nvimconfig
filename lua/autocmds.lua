-- ウィンドウごとの前回のバッファを記録
local win_prev_buf = {}

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local current_win = vim.api.nvim_get_current_win()
		local current_buf = vim.api.nvim_get_current_buf()
		local prev_buf = win_prev_buf[current_win]

		-- 前のバッファが存在し、現在のバッファと異なる場合
		if prev_buf and prev_buf ~= current_buf and vim.api.nvim_buf_is_valid(prev_buf) then
			-- 変更されている場合は保存
			local prev_modified = vim.api.nvim_buf_get_option(prev_buf, "modified")
			local prev_name = vim.api.nvim_buf_get_name(prev_buf)

			if prev_modified and prev_name ~= "" then
				vim.api.nvim_buf_call(prev_buf, function()
					vim.cmd("silent! write")
				end)
			end

			-- 他のウィンドウで使用されていない場合のみ閉じる
			local prev_buftype = vim.api.nvim_buf_get_option(prev_buf, "buftype")
			if prev_buftype == "" then
				local used_in_other_win = false
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					if win ~= current_win and vim.api.nvim_win_is_valid(win) then
						if vim.api.nvim_win_get_buf(win) == prev_buf then
							used_in_other_win = true
							break
						end
					end
				end

				if not used_in_other_win then
					vim.api.nvim_buf_delete(prev_buf, { force = false })
				end
			end
		end

		-- 現在のバッファを記録
		win_prev_buf[current_win] = current_buf
	end,
})

-- ウィンドウが閉じられたときにクリーンアップ
vim.api.nvim_create_autocmd("WinClosed", {
	callback = function(args)
		local win = tonumber(args.match)
		win_prev_buf[win] = nil
	end,
})
