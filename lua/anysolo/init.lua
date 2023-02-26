local buildDir = ".anysolo/build"

function anysolo_setCourse()
    local f = io.open("anysolo-course")
    if f== null then
        return
    end

    local f = io.open("CMakeLists.txt")
    if f== null then
        return
    end


    io.close(f)


    vim.keymap.set("n", "<leader>aa", anysolo_runFile)


    f = io.open(".anysolo")
    if f ~= nil then
        io.close(f)
        return
    end

    vim.cmd.terminal ("mkdir -p " .. buildDir .. " && cd " .. buildDir .. " && cmake -DMAKE_BUILD_TYPE=Debug ../..")

    print("SET")
end


function anysolo_runFile()
    print("Run")
    local fname = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), '')

    if string.find(fname, "/examples/") ~= nil then
        local prjName = string.match(fname, "(.*)/.*/.*/examples/.*")
        local exampleName = string.match(fname, "/examples/(.*).cc")
        local levelName = string.match(fname, ".*/(.*)/unit.*")
        local unitName = string.match(fname, ".*/.*/(.*)/examples/.*")
        print(unitName)

        local cmd = "pushd . && cd " .. buildDir .. " && make " .. levelName .. "_" .. unitName .. "_" .. exampleName
        cmd = cmd .. "&& popd && ./" .. buildDir .. "/" .. prjName .. "/" .. levelName .. "/" .. unitName .. "/" .. exampleName
        vim.cmd.terminal (cmd)

    end

--    print(fname)
--    print(vim.loop.cwd())
end

anysolo_setCourse()
