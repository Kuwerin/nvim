-- Call evans from terminal with some defaults

function callEvans()
    local command = "evans --host localhost --port 5000 -r repol"
    require('Fterm').run(command)
end

