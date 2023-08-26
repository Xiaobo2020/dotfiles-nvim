-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#829289", bold = false })
  -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#829289", bold = false })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#DBBC7F", bold = true })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#829289", bold = false })
end

-- LineNumberColors()
