local M = {}

local cmd = vim.cmd
local fn = vim.fn

function M.create(object)
    if object ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 5')
        fn.termopen('sh -c "kubectl get ' .. object .. '"')
        pcall(cmd, 'normal G')
    else
        print('Object name is mandatory')
    end
end

function M.logs(object)
    if object ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 11')
        fn.termopen('sh -c "kubectl logs --tail 10 ' .. object .. '"')
        pcall(cmd, 'normal G')
    else
        print('Object name is mandatory')
    end
end

return M
