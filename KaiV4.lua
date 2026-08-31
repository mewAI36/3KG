getgenv().ditmemay = "95b161ed-fac5-4a6f-9db4-1e7df6e47e79"
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/37f5728a90ded56d68af0543dee0a08a7508c01e3e138f0459bc23be044a4c10/download"))()
task.spawn(function()
    local CoreGui = game:GetService("CoreGui")
    
    local screenGui = CoreGui:WaitForChild("NFH_KeySystem", 10)
    if not screenGui then return end

    local mainFrame = screenGui:WaitForChild("Frame", 5) or screenGui:FindFirstChildWhichIsA("Frame")
    if not mainFrame then return end

    local keyInput = mainFrame:FindFirstChildWhichIsA("TextBox")
    local verifyBtn = nil

    for _, child in ipairs(mainFrame:GetChildren()) do
        if child:IsA("TextButton") and child.Text == "Verify" then
            verifyBtn = child
            break
        end
    end

    if keyInput and verifyBtn and getgenv().ditmemay then
        keyInput.Text = tostring(getgenv().ditmemay)
        task.wait(0.2)

        if firesignal then
            firesignal(verifyBtn.MouseButton1Click)
        elseif getconnections then
            for _, conn in ipairs(getconnections(verifyBtn.MouseButton1Click)) do
                conn:Fire()
            end
        end
    end
end)
