local getDebugConfDir = function ()
    local f = io.open("debug-conf/dir", "r")
    if f == nil then
        return "${workspaceFolder}"
    else
        local conf_dir = f:read()
        f:close()
        return conf_dir
    end
end


local dap = require("dap")
-- vscode-cpptools
dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = "/usr/bin/OpenDebugAD",
}
-- codelldb
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = "/usr/bin/codelldb",
        args = { "--port", "${port}" },
        cwd = getDebugConfDir()
    },
}

dap.configurations.cpp = {
    {
        -- Change it to "cppdbg" if you have vscode-cpptools
--        type = "codelldb",
        type = "codelldb",
        request = "launch",
        program = function ()
            f = io.open("debug-conf/program", "r")
            local conf_program = f:read()
            f:close()

                -- Compile and return exec name
            local filetype = vim.bo.filetype
            local filename = vim.fn.expand("%")
            local basename = vim.fn.expand('%:t:r')
            local makefile = os.execute("(ls | grep -i makefile)")

--            if makefile == "makefile" or makefile == "Makefile" then
--                os.execute("make debug")
--            else
--                if filetype == "c" then
--                    os.execute(string.format("gcc -g -o %s %s", basename, filename))
--                else
--                    os.execute(string.format("g++ -g -o %s %s", basename, filename))
--                end
--            end

              return conf_program
--            return basename
        end,
        args = function ()
            local argv = {}
            arg = vim.fn.input(string.format("argv: "))
            for a in string.gmatch(arg, "%S+") do
                table.insert(argv, a)
            end
            vim.cmd('echo ""')
            return argv
        end,
--        cwd = "${workspaceFolder}",
          cwd = "/home/dek/anysolo/anyworld/my-build/",
--        cwd = vim.fn.getcwd() .. "/my-build",
--        cwd = function ()
--            local f = io.open("debug-conf/dir", "r")
--            local conf_dir = f:read()
--            f:close()
--
--            return conf_dir
--        end,

        -- Uncomment if you want to stop at main
        -- stopAtEntry = true,
        MIMode = "gdb",
        miDebuggerPath = "/usr/bin/gdb",
        setupCommands = {
            {
                text = "-enable-pretty-printing",
                description = "enable pretty printing",
                ignoreFailures = false,
            },
        },
    },
}
-- You can even copy configurations
dap.configurations.c = dap.configurations.cpp
dap.configurations.cc = dap.configurations.cpp
