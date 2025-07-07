return {
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function ()
            ---@diagnostic disable-next-line: missing-fields
            require('ts_context_commentstring').setup {
                enable_autocmd = false,
            }


            -- Override get_option (for commenting jsx)
            local get_option = vim.filetype.get_option
            vim.filetype.get_option = function(filetype, option)
                return option == "commentstring"
                    and require("ts_context_commentstring.internal").calculate_commentstring()
                    or get_option(filetype, option)
            end
        end
    }
}
