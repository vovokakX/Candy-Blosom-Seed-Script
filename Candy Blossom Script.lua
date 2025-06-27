local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer

-- Создание GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CandyShopGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Скругление краёв
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Кнопка покупки
local buyButton = Instance.new("TextButton")
buyButton.Name = "BuyCandyButton"
buyButton.Size = UDim2.new(0, 200, 0, 50)
buyButton.Position = UDim2.new(0.5, -100, 0.5, -25)
buyButton.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
buyButton.Text = "Buy Candy Blossom"
buyButton.TextColor3 = Color3.new(1, 1, 1)
buyButton.Font = Enum.Font.GothamBold
buyButton.TextSize = 20
buyButton.AutoButtonColor = true
buyButton.Parent = frame

local buyCorner = Instance.new("UICorner")
buyCorner.CornerRadius = UDim.new(0, 8)
buyCorner.Parent = buyButton

-- Кнопка сворачивания
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 25, 0, 25)
minimizeButton.Position = UDim2.new(1, -30, 0, 5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.new(1, 1, 1)
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 20
minimizeButton.ZIndex = 2
minimizeButton.Parent = frame

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(1, 0)
minCorner.Parent = minimizeButton

-- Переменная состояния
local minimized = false

-- Функция сворачивания
minimizeButton.MouseButton1Click:Connect(function()
	if minimized then
		frame:TweenSize(UDim2.new(0, 300, 0, 200), "Out", "Quart", 0.3)
		task.wait(0.3)
		buyButton.Visible = true
	else
		buyButton.Visible = false
		frame:TweenSize(UDim2.new(0, 300, 0, 35), "Out", "Quart", 0.3)
	end
	minimized = not minimized
end)

-- Функция покупки
buyButton.MouseButton1Click:Connect(function()
	MarketplaceService:PromptGamePassPurchase(player, 1285327463)
end)
