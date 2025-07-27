local toolbar = plugin:CreateToolbar("Insert Asset")
local button = toolbar:CreateButton("Insert Asset", "Click to open", "rbxassetid://18298481522")

local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Left,
	true,
	false,
	200,
	100,
	150,
	100
)

local pluginGui = plugin:CreateDockWidgetPluginGui("PluginGui", widgetInfo)
pluginGui.Title = "Insert Asset"

local BackGround = Instance.new("Frame")
BackGround.AnchorPoint = Vector2.new(0.5, 0.5)
BackGround.Size = UDim2.new(1, 0, 1, 0)
BackGround.Position = UDim2.new(0.5, 0, 0.5, 0)
BackGround.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BackGround.Parent = pluginGui

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0.1, 0)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
UIListLayout.Parent = BackGround

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingBottom = UDim.new(0.1, 0)
UIPadding.PaddingLeft = UDim.new(0.1, 0)
UIPadding.PaddingRight = UDim.new(0.1, 0)
UIPadding.PaddingTop = UDim.new(0.1, 0)
UIPadding.Parent = BackGround

local TextBox = Instance.new("TextBox")
TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
TextBox.Size = UDim2.new(1, 0, 0, 50)
TextBox.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
TextBox.Text = "Input Asset ID Here"
TextBox.TextColor3 = Color3.fromRGB(150, 150, 150)
TextBox.TextScaled = true
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Center
TextBox.Parent = BackGround

local UICornerTextBox = Instance.new("UICorner")
UICornerTextBox.CornerRadius = UDim.new(0, 8)
UICornerTextBox.Parent = TextBox

local UIPaddingTextBox = Instance.new("UIPadding")
UIPaddingTextBox.PaddingLeft = UDim.new(0.05, 0)
UIPaddingTextBox.PaddingTop = UDim.new(0.05, 0)
UIPaddingTextBox.PaddingBottom = UDim.new(0.05, 0)
UIPaddingTextBox.Parent = TextBox

local InstructionsButton = Instance.new("TextButton")
InstructionsButton.AnchorPoint = Vector2.new(0.5, 0.5)
InstructionsButton.Size = UDim2.new(1, 0, 0, 50)
InstructionsButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
InstructionsButton.Text = "Instructions"
InstructionsButton.TextColor3 = Color3.fromRGB(150, 150, 150)
InstructionsButton.TextScaled = true
InstructionsButton.TextXAlignment = Enum.TextXAlignment.Center
InstructionsButton.TextYAlignment = Enum.TextYAlignment.Center
InstructionsButton.Parent = BackGround

local UICornerInstructionsButton = Instance.new("UICorner")
UICornerInstructionsButton.CornerRadius = UDim.new(0, 8)
UICornerInstructionsButton.Parent = InstructionsButton

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ScrollingFrame.Parent = pluginGui

local UIListLayoutScrollingFrame = Instance.new("UIListLayout")
UIListLayoutScrollingFrame.Padding = UDim.new(0.01, 0)
UIListLayoutScrollingFrame.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayoutScrollingFrame.VerticalAlignment = Enum.VerticalAlignment.Top
UIListLayoutScrollingFrame.Parent = ScrollingFrame

local UIPaddingScrollingFrame = Instance.new("UIPadding")
UIPaddingScrollingFrame.PaddingBottom = UDim.new(0.1, 0)
UIPaddingScrollingFrame.PaddingLeft = UDim.new(0.1, 0)
UIPaddingScrollingFrame.PaddingRight = UDim.new(0.1, 0)
UIPaddingScrollingFrame.PaddingTop = UDim.new(0.01, 0)
UIPaddingScrollingFrame.Parent = ScrollingFrame

local Back = Instance.new("TextButton")
Back.AnchorPoint = Vector2.new(0.5, 0.5)
Back.Size = UDim2.new(1, 0, 0.1, 0)
Back.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
Back.Text = "Back"
Back.TextColor3 = Color3.fromRGB(150, 150, 150)
Back.TextScaled = true
Back.TextXAlignment = Enum.TextXAlignment.Center
Back.TextYAlignment = Enum.TextYAlignment.Center
Back.Parent = ScrollingFrame

local BackUICorner = Instance.new("UICorner")
BackUICorner.CornerRadius = UDim.new(0, 8)
BackUICorner.Parent = Back

local Instructions = Instance.new("TextLabel")
Instructions.AnchorPoint = Vector2.new(0.5, 0.5)
Instructions.Size = UDim2.new(1, 0, 0, 400)
Instructions.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instructions.Text = "To use this plugin, you input an asset ID (numbers only) into the text box.  When you press enter, the asset, if found, will appear as a child of whatever you have selected in the explorer tab"
BackGround.Position = UDim2.new(0.5, 0, 0.5, 0)
Instructions.TextColor3 = Color3.fromRGB(150, 150, 150)
Instructions.TextSize = 20
Instructions.TextWrapped = true
Instructions.TextXAlignment = Enum.TextXAlignment.Left
Instructions.TextYAlignment = Enum.TextYAlignment.Top
Instructions.BorderColor3 = Color3.fromRGB(50, 50, 50)
Instructions.Parent = ScrollingFrame

ScrollingFrame.Visible = false

InstructionsButton.MouseButton1Click:Connect(function()
	ScrollingFrame.Visible = true
end)

Back.MouseButton1Click:Connect(function() 
	ScrollingFrame.Visible = false
end)

TextBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		if TextBox.Text ~= "" then
			local assetId = tonumber(TextBox.Text)
			if assetId == nil then
				warn("Error while converting to assetId, asset Id = !_" .. assetId .. "_!")
			else
				local asset = game:GetService("InsertService"):LoadAsset(assetId)
				if game:GetService("Selection"):Get() == {} then
					asset.Parent = game:GetService("Workspace")
				else
					asset.Parent = game:GetService("Selection"):Get()[1]
				end

				for i, v in ipairs(asset:GetChildren()) do
					v.Parent = asset.Parent
				end
				TextBox.Text = "Input Asset ID Here"
				asset:Destroy()
				TextBox.Text = "Input Asset ID Here"
			end
			TextBox.Text = "Input Asset ID Here"
		end
		TextBox.Text = "Input Asset ID Here"
	end
	TextBox.Text = "Input Asset ID Here"
end)

pluginGui.Enabled = false

button.Click:Connect(function()
	pluginGui.Enabled = not pluginGui.Enabled
end)
