return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Deja que copilot maneje <Tab>
        vim.g.copilot_no_tab_map = true

    local function has_copilot_suggestion()
        return vim.fn["copilot#GetDisplayedSuggestion"]() ~= ""
    end

    vim.keymap.set("i", "<Tab>", function()
        if has_copilot_suggestion() then
            return vim.fn["copilot#Accept"]()  -- acepta la sugerencia
        else
            return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)  -- fallback a tab normal
        end
     end, { expr = true, silent = true })

    end,
  },
}
