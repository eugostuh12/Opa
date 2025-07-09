local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local ativo = false

-- Criar GUI
local ScreenGui = Instance.new("ScreenGui", localPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "SlapSpamGUI"

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 120, 0, 40)
Button.Position = UDim2.new(0, 20, 0.5, -20)
Button.BackgroundColor3 = Color3.fromRGB(30, 180, 80)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Text = "Ativar Spam"
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 20
Button.Parent = ScreenGui
Button.ZIndex = 10

-- Função principal do spam
task.spawn(function()
    while true do
        if ativo and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= localPlayer
                and player.Character
                and player.Character:FindFirstChild("HumanoidRootPart")
                and player.Character:FindFirstChild("Humanoid")
                and player.Character.Humanoid.Health > 0 then
                    
                    local pos = player.Character.HumanoidRootPart.Position
                    local args = {
                        "slash",
                        player.Character,
                        vector.create(pos.X, pos.Y, pos.Z)
                    }

                    pcall(function()
                        localPlayer:WaitForChild("Backpack"):WaitForChild("Slap"):WaitForChild("Event"):FireServer(unpack(args))
                    end)

                    task.wait(0.05)
                end
            end
        end
        task.wait(0.1)
    end
end)

-- Função do botão
Button.MouseButton1Click:Connect(function()
    ativo = not ativo
    Button.Text = ativo and "Desativar Spam" or "Ativar Spam"
    Button.BackgroundColor3 = ativo and Color3.fromRGB(180, 30, 30) or Color3.fromRGB(30, 180, 80)
end)
