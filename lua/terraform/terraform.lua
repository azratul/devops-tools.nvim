local M = {}

local cmd = vim.cmd
local fn = vim.fn

function M.init(filepath)
    if filepath ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "terraform -chdir=' .. filepath .. ' init"')
        pcall(cmd, 'normal G')
    else
        print('Filepath is mandatory')
    end
end

function M.validate(filepath, args)
    if filepath ~= nil then
        local exec = 'terraform -chdir=' .. filepath .. ' validate '
        if args ~= nil then
            exec = exec .. ' ' .. args
        end
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 4')
        fn.termopen('sh -c "' .. exec .. '"')
        pcall(cmd, 'normal G')
    else
        print('Filepath is mandatory')
    end
end

function M.plan(filepath, args)
    if filepath ~= nil then
        local exec = 'terraform -chdir=' .. filepath .. ' plan '
        if args ~= nil then
            exec = exec .. ' ' .. args
        end
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "' .. exec .. '"')
        pcall(cmd, 'normal G')
    else
        print('Filepath is mandatory')
    end
end

function M.apply(filepath, args)
    if filepath ~= nil then
        local exec = 'terraform -chdir=' .. filepath .. ' apply -auto-approve '
        if args ~= nil then
            exec = exec .. ' ' .. args
        end
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "' .. exec .. '"')
        pcall(cmd, 'normal G')
    else
        print('Filepath is mandatory')
    end
end

function M.destroy(filepath, args)
    if filepath ~= nil then
        local exec = 'terraform -chdir=' .. filepath .. ' destroy -auto-approve '
        if args ~= nil then
            exec = exec .. ' ' .. args
        end
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "' .. exec .. '"')
        pcall(cmd, 'normal G')
    else
        print('Filepath is mandatory')
    end
end

return M
