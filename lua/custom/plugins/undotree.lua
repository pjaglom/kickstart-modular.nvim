return {
    -- Undotree (recommendation from The Primeagen setup)
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
}