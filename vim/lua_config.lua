require("pomo").setup({
  notifiers = {
    -- The "Default" notifier uses 'vim.notify' and works best when you have 'nvim-notify' installed.
    {
      name = "Default",
      opts = {
        -- With 'nvim-notify', when 'sticky = true' you'll have a live timer pop-up
        -- continuously displayed. If you only want a pop-up notification when the timer starts
        -- and finishes, set this to false.
        sticky = true,

        -- Configure the display icons:
        -- title_icon = "󱎫",
        -- text_icon = "󰄉",
        -- Replace the above with these if you don't have a patched font:
        title_icon = "⏳",
        text_icon = "⏱️",
      },
    },

    -- The "System" notifier sends a system notification when the timer is finished.
    -- Available on MacOS and Windows natively and on Linux via the `libnotify-bin` package.
    { name = "System" },

    -- You can also define custom notifiers by providing an "init" function instead of a name.
    -- See "Defining custom notifiers" below for an example 👇
    -- { init = function(timer) ... end }
  },
  sessions = {
    pomodoro = {
      { name = "Work", duration = "25m" },
      { name = "Short Break", duration = "5m" },
      { name = "Work", duration = "25m" },
      { name = "Short Break", duration = "5m" },
      { name = "Work", duration = "25m" },
      { name = "Long Break", duration = "15m" },
    },
  },
})
vim.lsp.enable('ruby_lsp')
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', function()
        local org_path = vim.api.nvim_buf_get_name(0)

        -- Go to definition:
        vim.api.nvim_command('normal gd')

        -- Wait LSP server response
        vim.wait(100, function() end)

        local new_path = vim.api.nvim_buf_get_name(0)
        if not (org_path == new_path) then
            -- Create a new tab for the original file
            vim.api.nvim_command('0tabnew %')

            -- Restore the cursor position
            vim.api.nvim_command('b ' .. org_path)
            vim.api.nvim_command('normal! `"')

            -- Switch to the original tab
            vim.api.nvim_command('normal! gt')
        end
    end, bufopts)

