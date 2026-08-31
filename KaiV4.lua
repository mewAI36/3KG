getgenv().ditmemay = "b7095248-d73f-405d-8ae9-4f44024ba2d4"
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/37f5728a90ded56d68af0543dee0a08a7508c01e3e138f0459bc23be044a4c10/download"))()

task.spawn(function()
    local CoreGui = game:GetService("CoreGui")
    
    local screenGui = CoreGui:WaitForChild("NFH_KeySystem", 10)
    if not screenGui then return end

    local mainFrame = screenGui:WaitForChild("Frame", 5)
    if not mainFrame then return end

    local keyInput = mainFrame:FindFirstChildWhichIsA("TextBox")
    local verifyBtn = nil

    for _, child in ipairs(mainFrame:GetChildren()) do
        if child:IsA("TextButton") and child.Text == "Verify" then
            verifyBtn = child
            break
        end
    end

    if not (keyInput and verifyBtn) then return end

    keyInput.Text = tostring(getgenv().ditmemay)
    task.wait(0.2)

    local connections = {}
    for _ = 1, 30 do
        if typeof(getconnections) == "function" then
            connections = getconnections(verifyBtn.MouseButton1Click)
            if #connections > 0 then break end
        end
        task.wait(0.1)
    end

    if #connections > 0 then
        for _, conn in ipairs(connections) do
            if conn.Fire then
                conn:Fire()
            elseif conn.Function then
                conn.Function()
            end
        end
    elseif typeof(firesignal) == "function" then
        firesignal(verifyBtn.MouseButton1Click)
    end
end)
