-- ファイルを開いた時に前のバッファを保存して閉じる
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    -- 前のバッファを取得
    local prev_buf = vim.fn.bufnr("#")
    
    -- 前のバッファが有効で、変更されている場合
    if prev_buf ~= -1 and vim.api.nvim_buf_is_valid(prev_buf) then
      local prev_modified = vim.api.nvim_buf_get_option(prev_buf, "modified")
      local prev_name = vim.api.nvim_buf_get_name(prev_buf)
      
      -- ファイル名があり、変更されている場合は保存
      if prev_modified and prev_name ~= "" then
        vim.api.nvim_buf_call(prev_buf, function()
          vim.cmd("silent! write")
        end)
      end
      
      -- 前のバッファを閉じる（通常バッファの場合のみ）
      local prev_buftype = vim.api.nvim_buf_get_option(prev_buf, "buftype")
      if prev_buftype == "" then
        vim.api.nvim_buf_delete(prev_buf, { force = false })
      end
    end
  end,
})
