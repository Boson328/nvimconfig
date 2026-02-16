local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  -- 新しいバージョンの場合
  local ts_ok, treesitter = pcall(require, 'nvim-treesitter')
  if not ts_ok then
    print("nvim-treesitter が読み込めません")
    return
  end
  
  treesitter.setup {
    ensure_installed = { "c" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
else
  -- 古いバージョンの場合
  configs.setup {
    ensure_installed = { "c" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
end
