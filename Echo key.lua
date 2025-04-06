-- Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI Setup
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "KeySystem"

local frame = Instance.new("Frame", screenGui)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local uiCorner = Instance.new("UICorner", frame)
uiCorner.CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Key System"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Close Button (X)
local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.fromRGB(120, 50, 50)

-- Key TextBox
local textbox = Instance.new("TextBox", frame)
textbox.Position = UDim2.new(0.1, 0, 0.3, 0)
textbox.Size = UDim2.new(0.8, 0, 0, 30)
textbox.PlaceholderText = "Enter Key Here"
textbox.Text = ""
textbox.ClearTextOnFocus = false
textbox.Font = Enum.Font.Gotham
textbox.TextSize = 16
textbox.TextColor3 = Color3.new(1, 1, 1)
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Redeem Button
local redeemButton = Instance.new("TextButton", frame)
redeemButton.Position = UDim2.new(0.1, 0, 0.55, 0)
redeemButton.Size = UDim2.new(0.8, 0, 0, 30)
redeemButton.Text = "Redeem"
redeemButton.Font = Enum.Font.GothamBold
redeemButton.TextSize = 16
redeemButton.TextColor3 = Color3.new(1, 1, 1)
redeemButton.BackgroundColor3 = Color3.fromRGB(60, 120, 60)

-- Get Key Button
local keyButton = Instance.new("TextButton", frame)
keyButton.Position = UDim2.new(0.1, 0, 0.75, 0)
keyButton.Size = UDim2.new(0.8, 0, 0, 30)
keyButton.Text = "Get Key"
keyButton.Font = Enum.Font.GothamBold
keyButton.TextSize = 16
keyButton.TextColor3 = Color3.new(1, 1, 1)
keyButton.BackgroundColor3 = Color3.fromRGB(80, 80, 120)

-- Button Functions
redeemButton.MouseButton1Click:Connect(function()
	if textbox.Text == "Echo" then
		pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthuhubX/Blue-lock-styles/refs/heads/main/Echo%20style.lua"))()
		end)
		
		StarterGui:SetCore("SendNotification", {
			Title = "Success!",
			Text = "Script is loaded! Go to match now!",
			Duration = 4
		})
		
		screenGui:Destroy()
	else
		StarterGui:SetCore("SendNotification", {
			Title = "Invalid Key",
			Text = "The key you entered is incorrect.",
			Duration = 3
		})
	end
end)

keyButton.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/J2UDrzTy3d")
	StarterGui:SetCore("SendNotification", {
		Title = "Copied!",
		Text = "Key link copied to clipboard.",
		Duration = 2
	})
end)

closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)
