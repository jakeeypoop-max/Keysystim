local ProtectionConfig = {
    -- 🔴 CRITICAL: This MUST exactly match the 'Secret' value in your Key System's Config!
    -- If your Key System has: Secret = "Test"
    -- Then this must also be: SecretKey = "Test"
    SecretKey = "Test",
    
    -- The name of your Hub (shown in the kick message if they try to bypass)
    HubName = "OYB HUB"
}

-- Anti-Bypass Logic: Checks if the Key System successfully set the global variable
if not _G[ProtectionConfig.SecretKey] then
    local player = game:GetService("Players").LocalPlayer
    if player then
        player:Kick("\n🛡️ Unauthorized Execution 🛡️\n\nPlease use the official Key System to run " .. ProtectionConfig.HubName)
    end
    return -- Stops the rest of the script from loading!
end

-------------------------------------------------------------------------------
-- 👇 YOUR MAIN SCRIPT CODE STARTS HERE 👇
-------------------------------------------------------------------------------

print(ProtectionConfig.HubName .. " Loaded Successfully!")

local player = game:GetService("Players").LocalPlayer
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")

-- ============================================
-- VARIABLES
-- ============================================
local spamming = false
local spamLoop = nil
local spamSpeed = 0.01

-- ============================================
-- JUNKIE DEVELOPMENT SYSTEM UI
-- ============================================

local function getBestParent()
    local parentOptions = {
        player:FindFirstChild("PlayerGui"),
        game:GetService("CoreGui"),
        game:GetService("StarterGui"),
    }
    for _, parent in ipairs(parentOptions) do
        if parent then
            local success = pcall(function()
                local testGui = Instance.new("ScreenGui")
                testGui.Parent = parent
                testGui:Destroy()
                return parent
            end)
            if success then return parent end
        end
    end
    return player:WaitForChild("PlayerGui")
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JunkieSpeedEscape"
screenGui.Parent = getBestParent()
screenGui.ResetOnSpawn = false

-- Main Frame (Junkie Dark Style)
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 420, 0, 520)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -260)
mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 15)
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true

local mainCorners = Instance.new("UICorner")
mainCorners.CornerRadius = UDim.new(0, 12)
mainCorners.Parent = mainFrame

-- Neon Border (Junkie Signature)
local neonBorder = Instance.new("Frame")
neonBorder.Parent = mainFrame
neonBorder.Size = UDim2.new(1, 2, 1, 2)
neonBorder.Position = UDim2.new(0, -1, 0, -1)
neonBorder.BackgroundTransparency = 1
neonBorder.BorderSizePixel = 2
neonBorder.BorderColor3 = Color3.fromRGB(0, 255, 0)
local neonCorners = Instance.new("UICorner")
neonCorners.CornerRadius = UDim.new(0, 13)
neonCorners.Parent = neonBorder

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Parent = mainFrame
titleBar.Size = UDim2.new(1, 0, 0, 55)
titleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
titleBar.BorderSizePixel = 0
local titleCorners = Instance.new("UICorner")
titleCorners.CornerRadius = UDim.new(0, 12)
titleCorners.Parent = titleBar

-- Junkie Logo
local junkieLogo = Instance.new("TextLabel")
junkieLogo.Parent = titleBar
junkieLogo.Size = UDim2.new(0, 40, 0, 40)
junkieLogo.Position = UDim2.new(0, 10, 0, 8)
junkieLogo.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
junkieLogo.BackgroundTransparency = 0.2
junkieLogo.Text = "JD"
junkieLogo.TextColor3 = Color3.fromRGB(0, 255, 0)
junkieLogo.TextSize = 18
junkieLogo.Font = Enum.Font.GothamBold
local logoCorners = Instance.new("UICorner")
logoCorners.CornerRadius = UDim.new(0, 8)
logoCorners.Parent = junkieLogo

-- Title
local titleText = Instance.new("TextLabel")
titleText.Parent = titleBar
titleText.Size = UDim2.new(1, -140, 1, 0)
titleText.Position = UDim2.new(0, 60, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "+1 SPEED ESCAPE"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 18
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left

-- Subtitle
local subText = Instance.new("TextLabel")
subText.Parent = titleBar
subText.Size = UDim2.new(1, -140, 0, 18)
subText.Position = UDim2.new(0, 60, 0, 32)
subText.BackgroundTransparency = 1
subText.Text = "Junkie Development System"
subText.TextColor3 = Color3.fromRGB(0, 255, 0)
subText.TextSize = 10
subText.Font = Enum.Font.Gotham
subText.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize Button
local minButton = Instance.new("TextButton")
minButton.Parent = titleBar
minButton.Size = UDim2.new(0, 32, 0, 32)
minButton.Position = UDim2.new(1, -80, 0, 12)
minButton.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
minButton.Text = "−"
minButton.TextColor3 = Color3.fromRGB(200, 200, 200)
minButton.TextSize = 22
minButton.Font = Enum.Font.GothamBold
minButton.BorderSizePixel = 0
local minCorners = Instance.new("UICorner")
minCorners.CornerRadius = UDim.new(0, 6)
minCorners.Parent = minButton

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Parent = titleBar
closeButton.Size = UDim2.new(0, 32, 0, 32)
closeButton.Position = UDim2.new(1, -42, 0, 12)
closeButton.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
closeButton.BackgroundTransparency = 0.3
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.fromRGB(255, 200, 200)
closeButton.TextSize = 16
closeButton.Font = Enum.Font.GothamBold
closeButton.BorderSizePixel = 0
local closeCorners = Instance.new("UICorner")
closeCorners.CornerRadius = UDim.new(0, 6)
closeCorners.Parent = closeButton

-- Content Container
local contentFrame = Instance.new("Frame")
contentFrame.Parent = mainFrame
contentFrame.Size = UDim2.new(1, -20, 1, -70)
contentFrame.Position = UDim2.new(0, 10, 0, 65)
contentFrame.BackgroundTransparency = 1

-- ============================================
-- SPEED DISPLAY CARD
-- ============================================
local speedCard = Instance.new("Frame")
speedCard.Parent = contentFrame
speedCard.Size = UDim2.new(1, 0, 0, 120)
speedCard.Position = UDim2.new(0, 0, 0, 0)
speedCard.BackgroundColor3 = Color3.fromRGB(12, 12, 25)
speedCard.BackgroundTransparency = 0
speedCard.BorderSizePixel = 0
local speedCardCorners = Instance.new("UICorner")
speedCardCorners.CornerRadius = UDim.new(0, 10)
speedCardCorners.Parent = speedCard

-- Glow effect
local speedGlow = Instance.new("Frame")
speedGlow.Parent = speedCard
speedGlow.Size = UDim2.new(1, 0, 1, 0)
speedGlow.BackgroundTransparency = 1
speedGlow.BorderSizePixel = 1
speedGlow.BorderColor3 = Color3.fromRGB(0, 255, 0)
local speedGlowCorners = Instance.new("UICorner")
speedGlowCorners.CornerRadius = UDim.new(0, 11)
speedGlowCorners.Parent = speedGlow

-- Speed number
local speedBigText = Instance.new("TextLabel")
speedBigText.Parent = speedCard
speedBigText.Size = UDim2.new(1, 0, 0, 50)
speedBigText.Position = UDim2.new(0, 0, 0, 20)
speedBigText.BackgroundTransparency = 1
speedBigText.Text = "+1"
speedBigText.TextColor3 = Color3.fromRGB(0, 255, 0)
speedBigText.TextSize = 48
speedBigText.Font = Enum.Font.GothamBold

local speedSubText = Instance.new("TextLabel")
speedSubText.Parent = speedCard
speedSubText.Size = UDim2.new(1, 0, 0, 25)
speedSubText.Position = UDim2.new(0, 0, 0, 75)
speedSubText.BackgroundTransparency = 1
speedSubText.Text = "SPEED ESCAPE"
speedSubText.TextColor3 = Color3.fromRGB(150, 150, 200)
speedSubText.TextSize = 14
speedSubText.Font = Enum.Font.Gotham

-- ============================================
-- SPAM CONTROL CARD
-- ============================================
local controlCard = Instance.new("Frame")
controlCard.Parent = contentFrame
controlCard.Size = UDim2.new(1, 0, 0, 100)
controlCard.Position = UDim2.new(0, 0, 0, 130)
controlCard.BackgroundColor3 = Color3.fromRGB(12, 12, 25)
controlCard.BackgroundTransparency = 0
controlCard.BorderSizePixel = 0
local controlCardCorners = Instance.new("UICorner")
controlCardCorners.CornerRadius = UDim.new(0, 10)
controlCardCorners.Parent = controlCard

local controlGlow = Instance.new("Frame")
controlGlow.Parent = controlCard
controlGlow.Size = UDim2.new(1, 0, 1, 0)
controlGlow.BackgroundTransparency = 1
controlGlow.BorderSizePixel = 1
controlGlow.BorderColor3 = Color3.fromRGB(0, 255, 0)
local controlGlowCorners = Instance.new("UICorner")
controlGlowCorners.CornerRadius = UDim.new(0, 11)
controlGlowCorners.Parent = controlGlow

-- Start/Stop Button (Junkie Style)
local spamButton = Instance.new("TextButton")
spamButton.Parent = controlCard
spamButton.Size = UDim2.new(0.7, 0, 0, 45)
spamButton.Position = UDim2.new(0.15, 0, 0.15, 0)
spamButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
spamButton.Text = "▶ START SPAMMING"
spamButton.TextColor3 = Color3.fromRGB(255, 255, 255)
spamButton.TextSize = 15
spamButton.Font = Enum.Font.GothamBold
spamButton.BorderSizePixel = 0
local spamCorners = Instance.new("UICorner")
spamCorners.CornerRadius = UDim.new(0, 8)
spamCorners.Parent = spamButton

-- Status
local statusText = Instance.new("TextLabel")
statusText.Parent = controlCard
statusText.Size = UDim2.new(1, 0, 0, 20)
statusText.Position = UDim2.new(0, 0, 0, 70)
statusText.BackgroundTransparency = 1
statusText.Text = "STATUS: IDLE"
statusText.TextColor3 = Color3.fromRGB(255, 100, 100)
statusText.TextSize = 11
statusText.Font = Enum.Font.GothamBold

-- ============================================
-- SPEED SLIDER CARD
-- ============================================
local sliderCard = Instance.new("Frame")
sliderCard.Parent = contentFrame
sliderCard.Size = UDim2.new(1, 0, 0, 100)
sliderCard.Position = UDim2.new(0, 0, 0, 240)
sliderCard.BackgroundColor3 = Color3.fromRGB(12, 12, 25)
sliderCard.BackgroundTransparency = 0
sliderCard.BorderSizePixel = 0
local sliderCardCorners = Instance.new("UICorner")
sliderCardCorners.CornerRadius = UDim.new(0, 10)
sliderCardCorners.Parent = sliderCard

local sliderGlow = Instance.new("Frame")
sliderGlow.Parent = sliderCard
sliderGlow.Size = UDim2.new(1, 0, 1, 0)
sliderGlow.BackgroundTransparency = 1
sliderGlow.BorderSizePixel = 1
sliderGlow.BorderColor3 = Color3.fromRGB(0, 255, 0)
local sliderGlowCorners = Instance.new("UICorner")
sliderGlowCorners.CornerRadius = UDim.new(0, 11)
sliderGlowCorners.Parent = sliderGlow

local sliderLabel = Instance.new("TextLabel")
sliderLabel.Parent = sliderCard
sliderLabel.Size = UDim2.new(1, -20, 0, 20)
sliderLabel.Position = UDim2.new(0, 15, 0, 10)
sliderLabel.BackgroundTransparency = 1
sliderLabel.Text = "SPAM SPEED"
sliderLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
sliderLabel.TextSize = 11
sliderLabel.Font = Enum.Font.GothamBold
sliderLabel.TextXAlignment = Enum.TextXAlignment.Left

local speedValue = Instance.new("TextLabel")
speedValue.Parent = sliderCard
speedValue.Size = UDim2.new(1, -20, 0, 25)
speedValue.Position = UDim2.new(0, 15, 0, 30)
speedValue.BackgroundTransparency = 1
speedValue.Text = "Delay: 0.01s (FASTEST)"
speedValue.TextColor3 = Color3.fromRGB(0, 255, 0)
speedValue.TextSize = 14
speedValue.Font = Enum.Font.GothamBold
speedValue.TextXAlignment = Enum.TextXAlignment.Left

-- ============================================
-- KEYBIND CARD
-- ============================================
local keybindCard = Instance.new("Frame")
keybindCard.Parent = contentFrame
keybindCard.Size = UDim2.new(1, 0, 0, 70)
keybindCard.Position = UDim2.new(0, 0, 0, 350)
keybindCard.BackgroundColor3 = Color3.fromRGB(12, 12, 25)
keybindCard.BackgroundTransparency = 0
keybindCard.BorderSizePixel = 0
local keybindCardCorners = Instance.new("UICorner")
keybindCardCorners.CornerRadius = UDim.new(0, 10)
keybindCardCorners.Parent = keybindCard

local keybindGlow = Instance.new("Frame")
keybindGlow.Parent = keybindCard
keybindGlow.Size = UDim2.new(1, 0, 1, 0)
keybindGlow.BackgroundTransparency = 1
keybindGlow.BorderSizePixel = 1
keybindGlow.BorderColor3 = Color3.fromRGB(0, 255, 0)
local keybindGlowCorners = Instance.new("UICorner")
keybindGlowCorners.CornerRadius = UDim.new(0, 11)
keybindGlowCorners.Parent = keybindGlow

local keybindLabel = Instance.new("TextLabel")
keybindLabel.Parent = keybindCard
keybindLabel.Size = UDim2.new(0.5, 0, 0, 25)
keybindLabel.Position = UDim2.new(0, 15, 0, 10)
keybindLabel.BackgroundTransparency = 1
keybindLabel.Text = "TOGGLE KEY"
keybindLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
keybindLabel.TextSize = 12
keybindLabel.Font = Enum.Font.GothamBold
keybindLabel.TextXAlignment = Enum.TextXAlignment.Left

local keyButton = Instance.new("Frame")
keyButton.Parent = keybindCard
keyButton.Size = UDim2.new(0, 70, 0, 40)
keyButton.Position = UDim2.new(0.7, 0, 0.15, 0)
keyButton.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
keyButton.BorderSizePixel = 0
local keyButtonCorners = Instance.new("UICorner")
keyButtonCorners.CornerRadius = UDim.new(0, 8)
keyButtonCorners.Parent = keyButton

local keyText = Instance.new("TextLabel")
keyText.Parent = keyButton
keyText.Size = UDim2.new(1, 0, 1, 0)
keyText.BackgroundTransparency = 1
keyText.Text = "K"
keyText.TextColor3 = Color3.fromRGB(0, 255, 0)
keyText.TextSize = 22
keyText.Font = Enum.Font.GothamBold

-- Footer (Junkie Dev Signature)
local footer = Instance.new("Frame")
footer.Parent = mainFrame
footer.Size = UDim2.new(1, 0, 0, 28)
footer.Position = UDim2.new(0, 0, 1, -28)
footer.BackgroundColor3 = Color3.fromRGB(5, 5, 12)
footer.BorderSizePixel = 0
local footerCorners = Instance.new("UICorner")
footerCorners.CornerRadius = UDim.new(0, 12)
footerCorners.Parent = footer

local footerText = Instance.new("TextLabel")
footerText.Parent = footer
footerText.Size = UDim2.new(1, 0, 1, 0)
footerText.BackgroundTransparency = 1
footerText.Text = "Junkie Development System | +1 Speed Escape"
footerText.TextColor3 = Color3.fromRGB(0, 150, 0)
footerText.TextSize = 9
footerText.Font = Enum.Font.Gotham

-- ============================================
-- SPAM FUNCTION
-- ============================================
local function startSpam()
    if spamLoop then task.cancel(spamLoop) end
    spamming = true
    statusText.Text = "STATUS: SPAMMING ⚡"
    statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
    spamButton.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
    spamButton.Text = "⏹ STOP SPAMMING"
    
    spamLoop = task.spawn(function()
        while spamming do
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
            if remote then
                local updateSpeed = remote:FindFirstChild("UpdateSpeed")
                if updateSpeed then
                    updateSpeed:FireServer("Walking")
                end
            end
            task.wait(spamSpeed)
        end
    end)
end

local function stopSpam()
    spamming = false
    if spamLoop then task.cancel(spamLoop) end
    statusText.Text = "STATUS: IDLE"
    statusText.TextColor3 = Color3.fromRGB(255, 100, 100)
    spamButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    spamButton.Text = "▶ START SPAMMING"
end

spamButton.MouseButton1Click:Connect(function()
    if spamming then stopSpam() else startSpam() end
end)

-- Keybind K
userInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.K then
        if spamming then stopSpam() else startSpam() end
    end
end)

-- ============================================
-- NEON PULSE ANIMATION
-- ============================================
task.spawn(function()
    local pulse = 0
    local up = true
    while screenGui and screenGui.Parent do
        if up then
            pulse = pulse + 0.02
            if pulse >= 1 then up = false end
        else
            pulse = pulse - 0.02
            if pulse <= 0.3 then up = true end
        end
        local colorVal = 100 + (155 * pulse)
        pcall(function()
            neonBorder.BorderColor3 = Color3.fromRGB(0, colorVal, 0)
            speedGlow.BorderColor3 = Color3.fromRGB(0, colorVal, 0)
            controlGlow.BorderColor3 = Color3.fromRGB(0, colorVal, 0)
            sliderGlow.BorderColor3 = Color3.fromRGB(0, colorVal, 0)
            keybindGlow.BorderColor3 = Color3.fromRGB(0, colorVal, 0)
            junkieLogo.BackgroundColor3 = Color3.fromRGB(0, colorVal, 0)
        end)
        task.wait(0.05)
    end
end)

-- ============================================
-- MINIMIZE / DRAG
-- ============================================
local minimized = false
local function toggleMinimize()
    minimized = not minimized
    if minimized then
        pcall(function() mainFrame.Size = UDim2.new(0, 420, 0, 55) end)
        contentFrame.Visible = false
        footer.Visible = false
        minButton.Text = "+"
    else
        pcall(function() mainFrame.Size = UDim2.new(0, 420, 0, 520) end)
        contentFrame.Visible = true
        footer.Visible = true
        minButton.Text = "−"
    end
end

minButton.MouseButton1Click:Connect(toggleMinimize)
closeButton.MouseButton1Click:Connect(toggleMinimize)

local dragging = false
local dragStart, startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

userInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        pcall(function() mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) end)
    end
end)

userInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

-- ============================================
-- CONSOLE
-- ============================================
print("========================================")
print("    +1 SPEED ESCAPE KEYBOARD")
print("    Junkie Development System")
print("    Protected by Key System")
print("    Press K to toggle spam")
print("========================================")

pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Junkie Dev System",
        Text = "+1 Speed Escape Loaded | Press K to spam",
        Duration = 3
    })
end)
