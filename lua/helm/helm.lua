local M = {}

local cmd = vim.cmd
local fn = vim.fn

function M.create(project)
    if project ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 4')
        fn.termopen('sh -c "helm create ' .. project .. '"')
        pcall(cmd, 'normal G')
    else
        print('Project name is mandatory')
    end
end

function M.uninstall(project)
    if project ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 4')
        fn.termopen('sh -c "helm uninstall ' .. project .. '"')
        pcall(cmd, 'normal G')
    else
        print('Project name is mandatory')
    end
end

function M.template(project)
    if project ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 15')
        fn.termopen('sh -c "helm template ' .. project .. '"')
        pcall(cmd, 'normal G')
    else
        print('Project name is mandatory')
    end
end

function M.history(project)
    if project ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 4')
        fn.termopen('sh -c "helm history ' .. project .. '"')
        pcall(cmd, 'normal G')
    else
        print('Project name is mandatory')
    end
end

function M.upgrade(args)
    if args ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "helm upgrade ' .. args .. '"')
        pcall(cmd, 'normal G')
    else
        print('Args are mandatory')
    end
end

function M.install(args)
    if args ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "helm install ' .. args .. '"')
        pcall(cmd, 'normal G')
    else
        print('Args are mandatory')
    end
end

return M
