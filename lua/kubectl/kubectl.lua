local M = {}

local cmd = vim.cmd
local api = vim.api
local fn = vim.fn

local function window()
    local width = vim.o.columns - 4
    local height = 11
    if (vim.o.columns >= 85) then
        width = 80
    end
    api.nvim_open_win(
        api.nvim_create_buf(false, true),
        true,
        {
            relative = 'editor',
            style = 'minimal',
            border = 'shadow',
            noautocmd = true,
            width = width,
            height = height,
            col = math.min((vim.o.columns - width) / 2),
            row = math.min((vim.o.lines - height) / 2 - 1),
        }
    )
end

function M.get(object)
    window()
    local file = vim.fn.tempname()
    local stdout = ""
    -- fn.termopen('kubectl get --no-headers=true ' .. object .. ' -o name| fzf > ' .. file, {
    fn.termopen('kubectl get ' .. object .. ' | fzf | cut -d" " -f1> ' .. file, {
        on_exit = function()
            api.nvim_command('bdelete!')
            local f = io.open(file, 'r')
            stdout = f:read('*all')
            f:close()
            os.remove(file)
            -- vim.api.nvim_command('!kubectl get -o yaml ' .. stdout)
            vim.api.nvim_command('!kubectl get -o yaml ' .. object .. ' ' .. stdout)
        end
    })
    cmd("normal i")
end

function M.logs()
    window()
    local file = vim.fn.tempname()
    local stdout = ""
    fn.termopen('kubectl get pods | fzf | cut -d" " -f1> ' .. file, {
        on_exit = function()
            api.nvim_command('bdelete!')
            local f = io.open(file, 'r')
            stdout = f:read('*all')
            f:close()
            os.remove(file)
            -- vim.api.nvim_command('!kubectl logs --tail 50 ' .. stdout)
            fn.termopen('kubectl logs --tail 50 ' .. stdout)
        end
    })
    cmd("normal i")
end

function M.decode()
    window()
    local file = vim.fn.tempname()
    local stdout = ""
    fn.termopen('kubectl get secrets | fzf | cut -d" " -f1> ' .. file, {
        on_exit = function()
            api.nvim_command('bdelete!')
            local f = io.open(file, 'r')
            stdout = f:read('*all')
            f:close()
            os.remove(file)
            -- vim.api.nvim_command('!kubectl get secret -o go-template=\'{{range $i,$v := .data}}{{$i}}{{": "}}{{$v|base64decode}}{{"\\n"}}{{end}}\' ' .. stdout)
            fn.termopen('kubectl get secret -o go-template=\'{{range $i,$v := .data}}{{$i}}{{": "}}{{$v|base64decode}}{{"\\n"}}{{end}}\' ' .. stdout)
        end
    })
    cmd("normal i")
end

function M.describe(object)
    window()
    local file = vim.fn.tempname()
    local stdout = ""
    fn.termopen('kubectl get ' .. object .. ' | fzf | cut -d" " -f1> ' .. file, {
        on_exit = function()
            api.nvim_command('bdelete!')
            local f = io.open(file, 'r')
            stdout = f:read('*all')
            f:close()
            os.remove(file)
            vim.api.nvim_command('!kubectl describe ' .. object .. ' ' .. stdout)
        end
    })
    cmd("normal i")
end

return M
