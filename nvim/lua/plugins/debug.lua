return {
    {
        'rcarriga/nvim-dap-ui',
        event = 'VeryLazy',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()
            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end
        end,
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        event = 'VeryLazy',
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },
        opts = {
            handlers = {},
        },
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            {
                'theHamsta/nvim-dap-virtual-text',
                config = function()
                    require('nvim-dap-virtual-text').setup()
                end,
            },
            -- Adapters
            { 'mxsdev/nvim-dap-vscode-js' },
            {
                'microsoft/vscode-js-debug',
                opt = true,
                run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
            },
            { 'mfussenegger/nvim-dap-python' },
        },
        -- stylua: ignore
        keys = {
            { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
            { "<leader>dc", function() require("dap").continue() end,                                             desc = "Run/Continue" },
            { "<leader>da", function() require("dap").continue({ before = get_args }) end,                        desc = "Run with Args" },
            { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
            { "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },
            { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
            { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
            { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
            { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
            { "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
            { "<leader>dO", function() require("dap").step_over() end,                                            desc = "Step Over" },
            { "<leader>dP", function() require("dap").pause() end,                                                desc = "Pause" },
            { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
            { "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
            { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
            { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
        },

        config = function()
            vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'ErrorMsg', linehl = '', numhl = '' })
            vim.fn.sign_define('DapStopped', { text = '󰁕 ', texthl = 'DapStopped', linehl = 'DiagnosticUnderlineInfo', numhl = '' })
            vim.fn.sign_define('DapBreakpointRejected', { text = ' ', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })
            vim.fn.sign_define('DapBreakpointCondition', { text = ' ', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
            vim.fn.sign_define('DapLogPoint', { text = '.>', texthl = 'DapLogPoint', linehl = '', numhl = '' })

            local vscode = require('dap.ext.vscode')
            local json = require('plenary.json')
            vscode.json_decode = function(str)
                return vim.json.decode(json.json_strip_comments(str))
            end

            require('config.dap')
            require('dap-python').setup('python3')
        end,
    },
}
