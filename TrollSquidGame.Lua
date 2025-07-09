-- GUI Creation
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SpamSlapGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = localPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 100)
Frame.Position = UDim2.new(0.5, -110, 0.5, -50)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(1, 0, 0, 30)
ToggleButton.Position = UDim2.new(0, 0, 0, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ToggleButton.Text = "▼ Spam Slap Everyone"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 16
ToggleButton.Parent = Frame

local SlapToggle = Instance.new("TextButton")
SlapToggle.Size = UDim2.new(1, -20, 0, 40)
SlapToggle.Position = UDim2.new(0, 10, 0, 40)
SlapToggle.BackgroundColor3 = Color3.fromRGB(85, 0, 0)
SlapToggle.Text = "Start Spam Slap"
SlapToggle.TextColor3 = Color3.new(1, 1, 1)
SlapToggle.Font = Enum.Font.SourceSansBold
SlapToggle.TextSize = 16
SlapToggle.Parent = Frame

local minimized = false
local ativo = false

ToggleButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	SlapToggle.Visible = not minimized
	ToggleButton.Text = minimized and "► Spam Slap Everyone" or "▼ Spam Slap Everyone"
	Frame.Size = minimized and UDim2.new(0, 220, 0, 30) or UDim2.new(0, 220, 0, 100)
end)

SlapToggle.MouseButton1Click:Connect(function()
	ativo = not ativo
	SlapToggle.Text = ativo and "Stop Spam Slap" or "Start Spam Slap"
	SlapToggle.BackgroundColor3 = ativo and Color3.fromRGB(0, 85, 0) or Color3.fromRGB(85, 0, 0)
end)

-- Spam slap loop
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
