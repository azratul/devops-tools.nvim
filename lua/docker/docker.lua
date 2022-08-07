local M = {}

local cmd = vim.cmd
local fn = vim.fn

function M.build(file, tag)
    if file ~= nil and tag ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "docker build -t ' .. tag .. ' -f ' .. file .. ' . "')
        pcall(cmd, 'normal G')
    else
        print('Tag and File are mandatory')
    end
end

function M.run_d(args)
    if args ~= nil then
        pcall(cmd, 'split running-app')
        fn.termopen('sh -c "docker run -d ' .. args .. '"')
        pcall(cmd, 'quit')
        print('Running in daemon mode!')
    else
        print('Args are mandatory')
    end
end

function M.run(args)
    if args ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "docker run -it ' .. args .. '"')
        pcall(cmd, 'normal G')
        print('Running in interactive mode!')
    else
        print('Args are mandatory')
    end
end

function M.exec(args)
    if args ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "docker exec -it ' .. args .. '"')
        pcall(cmd, 'normal G')
        print('Running in interactive mode!')
    else
        print('Args are mandatory')
    end
end

function M.logs(container)
    if container ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "docker logs -f ' .. container .. '"')
        pcall(cmd, 'normal G')
    else
        print('Container name or id is mandatory')
    end
end

function M.push(image)
    if image ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "docker push ' .. image .. '"')
        pcall(cmd, 'normal G')
    else
        print('Image name is mandatory')
    end
end

function M.pull(image)
    if image ~= nil then
        pcall(cmd, 'split running-app')
        pcall(cmd, 'resize 10')
        fn.termopen('sh -c "docker pull ' .. image .. '"')
        pcall(cmd, 'normal G')
    else
        print('Image name is mandatory')
    end
end

function M.ps()
    pcall(cmd, 'split running-app')
    pcall(cmd, 'resize 10')
    fn.termopen('sh -c "docker ps -a"')
    pcall(cmd, 'normal G')
end

function M.images()
    pcall(cmd, 'split running-app')
    pcall(cmd, 'resize 10')
    fn.termopen('sh -c "docker images"')
    pcall(cmd, 'normal G')
end

function M.logsCompose()
    pcall(cmd, 'split running-app')
    pcall(cmd, 'resize 10')
    fn.termopen('sh -c "docker-compose logs -f"')
    pcall(cmd, 'normal G')
end

function M.up(args)
    pcall(cmd, 'split running-app')
    pcall(cmd, 'resize 10')
    fn.termopen('sh -c "docker-compose up ' .. args .. '"')
    pcall(cmd, 'normal G')
end

function M.down()
    pcall(cmd, 'split running-app')
    pcall(cmd, 'resize 10')
    fn.termopen('sh -c "docker-compose down"')
    pcall(cmd, 'normal G')
    pcall(cmd, 'quit')
end

return M
