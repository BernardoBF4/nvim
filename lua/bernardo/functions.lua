function MoveSelectedLines(direction)
  local amount = tonumber(vim.fn.input("Quantas linhas? "))
  if not amount then return end

  if direction == 'up' then
    vim.cmd(":m '<-" .. (amount + 1))
  elseif direction == 'down' then
    vim.cmd(":m '>+" .. amount)
  end

  -- Manter a seleção sem `gv=gv`
  vim.cmd("normal! gv")
  -- Realinhar o código
  vim.cmd("normal! ==")
end
