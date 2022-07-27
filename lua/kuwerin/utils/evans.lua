function callEvans()
    local command = "evans --host localhost --port 5000 -r repol"
    require('Fterm').run(command)
end

