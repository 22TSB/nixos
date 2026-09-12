local dap = require("dap")
local dap_virtual_text = require("nvim-dap-virtual-text")
local dapui = require("dapui")

dap_virtual_text.setup()
dapui.setup()

-- C++
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" },
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/",
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
}

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

vim.keymap.set("n", "<F5>", dap.continue, {
    desc = "Debug: Continue",
})

vim.keymap.set("n", "<F10>", dap.step_over, {
    desc = "Debug: Step over",
})

vim.keymap.set("n", "<F11>", dap.step_into, {
    desc = "Debug: Step into",
})

vim.keymap.set("n", "<F12>", dap.step_out, {
    desc = "Debug: Step out",
})

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {
    desc = "Debug: Toggle breakpoint",
})

vim.keymap.set("n", "<leader>dB", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, {
    desc = "Debug: Conditional breakpoint",
})

vim.keymap.set("n", "<leader>dq", dap.terminate, {
    desc = "Debug: Terminate",
})

vim.keymap.set("n", "<leader>du", dapui.toggle, {
    desc = "Debug: Toggle UI",
})
