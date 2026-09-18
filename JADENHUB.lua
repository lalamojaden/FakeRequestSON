-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- Remove previous GUI if it exists
if CoreGui:FindFirstChild("JADENHUB_UI") then
    CoreGui.JADENHUB_UI:Destroy()
end

-- Create Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JADENHUB_UI"
ScreenGui.ResetOnSpawn = false
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- UICorner for Main Frame
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- Top Bar / Header
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 8)
HeaderCorner.Parent = Header

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -50, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "JADENHUB - Notification & Chat System"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Header

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Content Area / Buttons Container
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, -20, 1, -60)
ContentFrame.Position = UDim2.new(0, 10, 0, 50)
ContentFrame.BackgroundTransparency = 1
ContentFrame.BorderSizePixel = 0
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 250)
ContentFrame.Parent = MainFrame

-- Notification Function
local function SendNotification(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 5;
    })
end

-- Button 1: Send Friend Request Notification Feature
local FriendBtn = Instance.new("TextButton")
FriendBtn.Size = UDim2.new(1, 0, 0, 45)
FriendBtn.Position = UDim2.new(0, 0, 0, 10)
FriendBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
FriendBtn.Text = "Trigger Friend Request Popup"
FriendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FriendBtn.TextSize = 14
FriendBtn.Font = Enum.Font.GothamMedium
FriendBtn.Parent = ContentFrame

local FriendCorner = Instance.new("UICorner")
FriendCorner.CornerRadius = UDim.new(0, 6)
FriendCorner.Parent = FriendBtn

FriendBtn.MouseButton1Click:Connect(function()
    SendNotification("JADENHUB", "Simulated Friend Request Sent Successfully!")
end)

-- Status Indicator
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 0, 70)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Hub Active & Protected"
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
StatusLabel.TextSize = 13
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Parent = ContentFrame

SendNotification("JADENHUB Loaded", "Welcome, " .. LocalPlayer.Name .. "!")
end)

local UsernameBox = Instance.new("TextBox")
UsernameBox.Size = UDim2.new(0, 244, 0, 36)
UsernameBox.Position = UDim2.new(0.5, -122, 0, 52)
UsernameBox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
UsernameBox.BorderSizePixel = 0
UsernameBox.Font = Enum.Font.Gotham
UsernameBox.PlaceholderText = "Enter Player Username..."
UsernameBox.Text = ""
UsernameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UsernameBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
UsernameBox.TextSize = 13
UsernameBox.Parent = MainFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 5)
BoxCorner.Parent = UsernameBox

local SendButton = Instance.new("TextButton")
SendButton.Size = UDim2.new(0, 244, 0, 40)
SendButton.Position = UDim2.new(0.5, -122, 0, 102)
SendButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SendButton.BorderSizePixel = 0
SendButton.Font = Enum.Font.GothamBold
SendButton.Text = "Send Friend Request"
SendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SendButton.TextSize = 13
SendButton.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 5)
BtnCorner.Parent = SendButton

-- "New Friend" Notification (Nilakihan nang kaunti: 62px ang taas para sakto at hindi masyadong maliit)
local function TriggerNewFriendNotification(targetName)
    local thumbUrl = "rbxassetid://0"
    pcall(function()
        local userId = Players:GetUserIdFromNameAsync(targetName)
        if userId then
            thumbUrl = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        end
    end)

    local NewFriendGui = Instance.new("ScreenGui")
    NewFriendGui.Name = "NewFriendNotif"
    NewFriendGui.ResetOnSpawn = false
    pcall(function() NewFriendGui.Parent = CoreGui end)
    if not NewFriendGui.Parent then NewFriendGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(0, 205, 0, 62) -- Medyo nilakihan nang kaunti (62px height)
    Holder.Position = UDim2.new(1, 20, 1, -75)
    Holder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Holder.BackgroundTransparency = 1
    Holder.BorderSizePixel = 0
    Holder.Parent = NewFriendGui

    local HolderCorner = Instance.new("UICorner")
    HolderCorner.CornerRadius = UDim.new(0, 6)
    HolderCorner.Parent = Holder

    local AvatarImg = Instance.new("ImageLabel")
    AvatarImg.Size = UDim2.new(0, 32, 0, 32)
    AvatarImg.Position = UDim2.new(0, 12, 0, 15)
    AvatarImg.BackgroundTransparency = 1
    AvatarImg.Image = thumbUrl
    AvatarImg.Parent = Holder

    local TitleLabel2 = Instance.new("TextLabel")
    TitleLabel2.Size = UDim2.new(0, 145, 0, 16)
    TitleLabel2.Position = UDim2.new(0, 52, 0, 14)
    TitleLabel2.BackgroundTransparency = 1
    TitleLabel2.Font = Enum.Font.GothamBold
    TitleLabel2.Text = "New friend"
    TitleLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel2.TextSize = 12
    TitleLabel2.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel2.Parent = Holder

    local SubLabel = Instance.new("TextLabel")
    SubLabel.Size = UDim2.new(0, 145, 0, 16)
    SubLabel.Position = UDim2.new(0, 52, 0, 31)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Font = Enum.Font.Gotham
    SubLabel.Text = targetName
    SubLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    SubLabel.TextSize = 11
    SubLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubLabel.Parent = Holder

    -- Slide In animation
    local slideIn = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    TweenService:Create(Holder, slideIn, {
        Position = UDim2.new(1, -220, 1, -75),
        BackgroundTransparency = 0.25
    }):Play()

    -- Slide Out animation pagkalipas ng 4 seconds
    task.delay(4, function()
        if NewFriendGui then
            local slideOut = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
            local tw = TweenService:Create(Holder, slideOut, {
                Position = UDim2.new(1, 20, 1, -75),
                BackgroundTransparency = 1
            })
            tw:Play()
            tw.Completed:Connect(function()
                NewFriendGui:Destroy()
            end)
        end
    end)
end

-- Fake Friend Request Notification
local function TriggerFakeRequest(targetName)
    if targetName == "" then targetName = "chinliiii" end
    
    local thumbUrl = "rbxassetid://0"
    pcall(function()
        local userId = Players:GetUserIdFromNameAsync(targetName)
        if userId then
            thumbUrl = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        end
    end)

    local NotifGui = Instance.new("ScreenGui")
    NotifGui.Name = "FakeRequestNotif"
    NotifGui.ResetOnSpawn = false
    pcall(function() NotifGui.Parent = CoreGui end)
    if not NotifGui.Parent then NotifGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(0, 205, 0, 95)
    Holder.Position = UDim2.new(1, 20, 1, -110)
    Holder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Holder.BackgroundTransparency = 1
    Holder.BorderSizePixel = 0
    Holder.Parent = NotifGui

    local HolderCorner = Instance.new("UICorner")
    HolderCorner.CornerRadius = UDim.new(0, 6)
    HolderCorner.Parent = Holder

    local AvatarImg = Instance.new("ImageLabel")
    AvatarImg.Size = UDim2.new(0, 24, 0, 24)
    AvatarImg.Position = UDim2.new(0, 12, 0, 12)
    AvatarImg.BackgroundTransparency = 1
    AvatarImg.Image = thumbUrl
    AvatarImg.Parent = Holder

    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(0, 150, 0, 14)
    NameLabel.Position = UDim2.new(0, 44, 0, 10)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Font = Enum.Font.GothamBold
    NameLabel.Text = targetName
    NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameLabel.TextSize = 12
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Parent = Holder

    local DescLabel = Instance.new("TextLabel")
    DescLabel.Size = UDim2.new(0, 150, 0, 14)
    DescLabel.Position = UDim2.new(0, 44, 0, 26)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.Text = "Sent you a friend request!"
    DescLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    DescLabel.TextSize = 10
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.Parent = Holder

    local HLine = Instance.new("Frame")
    HLine.Size = UDim2.new(1, 0, 0, 1)
    HLine.Position = UDim2.new(0, 0, 0, 52)
    HLine.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    HLine.BorderSizePixel = 0
    HLine.Parent = Holder

    local VLine = Instance.new("Frame")
    VLine.Size = UDim2.new(0, 1, 1, -52)
    VLine.Position = UDim2.new(0.5, 0, 0, 52)
    VLine.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    VLine.BorderSizePixel = 0
    VLine.Parent = Holder

    local AcceptBtn = Instance.new("TextButton")
    AcceptBtn.Size = UDim2.new(0.5, 0, 0, 42)
    AcceptBtn.Position = UDim2.new(0, 0, 0, 52)
    AcceptBtn.BackgroundTransparency = 1
    AcceptBtn.Font = Enum.Font.GothamBold
    AcceptBtn.Text = "Accept"
    AcceptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    AcceptBtn.TextSize = 12
    AcceptBtn.Parent = Holder

    local DeclineBtn = Instance.new("TextButton")
    DeclineBtn.Size = UDim2.new(0.5, 0, 0, 42)
    DeclineBtn.Position = UDim2.new(0.5, 0, 0, 52)
    DeclineBtn.BackgroundTransparency = 1
    DeclineBtn.Font = Enum.Font.GothamBold
    DeclineBtn.Text = "Decline"
    DeclineBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    DeclineBtn.TextSize = 12
    DeclineBtn.Parent = Holder

    -- Tween In (Pumapasok)
    local slideIn = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    TweenService:Create(Holder, slideIn, {
        Position = UDim2.new(1, -220, 1, -110),
        BackgroundTransparency = 0.25
    }):Play()

    AcceptBtn.MouseButton1Click:Connect(function()
        -- Reverse Animation (Slide Out) pagka-click ng Accept
        local slideOut = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        local tw = TweenService:Create(Holder, slideOut, {
            Position = UDim2.new(1, 20, 1, -110),
            BackgroundTransparency = 1
        })
        tw:Play()
        tw.Completed:Connect(function()
            NotifGui:Destroy()
        end)
        
        -- Maghihintay ng 0.3 seconds bago lumitaw ang "New friend" notification
        task.delay(0.3, function()
            TriggerNewFriendNotification(targetName)
        end)
    end)

    DeclineBtn.MouseButton1Click:Connect(function()
        -- Reverse Animation kapag pinindot ang Decline
        local slideOut = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        local tw = TweenService:Create(Holder, slideOut, {
            Position = UDim2.new(1, 20, 1, -110),
            BackgroundTransparency = 1
        })
        tw:Play()
        tw.Completed:Connect(function()
            NotifGui:Destroy()
        end)
    end)
end

SendButton.MouseButton1Click:Connect(function()
    TriggerFakeRequest(UsernameBox.Text)
end)

local function handleChatCommand(messageText)
    if messageText:lower() == "/jadenhub" then
        pcall(function()
            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("<font color='#00AAFF'><b>follow lalamojaden2 on tiktok</b></font>")
            else
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "follow lalamojaden2 on tiktok";
                    Color = Color3.fromRGB(0, 170, 255);
                    Font = Enum.Font.GothamBold;
                })
            end
        end)
        MainFrame.Visible = true
    end
end

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    TextChatService.SendingMessage:Connect(function(textChatMessage)
        handleChatCommand(textChatMessage.Text)
    end)
end

LocalPlayer.Chatted:Connect(function(msg)
    handleChatCommand(msg)
end)
