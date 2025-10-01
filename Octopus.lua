local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()

ReGui:DefineTheme('Octopus',{
    Text = Color3.fromRGB(220,220,220),
    WindowBg = Color3.fromRGB(10,10,10),
    TitleBarBg = Color3.fromRGB(15,15,15),
    TitleBarBgActive = Color3.fromRGB(25,25,25),
    Border = Color3.fromRGB(30,30,30),
    FrameBg = Color3.fromRGB(30,30,30), 
    ButtonsBg = Color3.fromRGB(25,25,25)
})

ReGui:Init({
    Prefabs = game:GetService('InsertService'):LoadLocalAsset('rbxassetid://'..ReGui.PrefabsId)
})

local win = ReGui:Window({
    Title = 'Octopus | Executor',
    Size = UDim2.fromOffset(500,300),
    Theme = 'Octopus',
    NoScroll = true
})

local editor = win:InputTextMultiline({
    Size = UDim2.new(1,0,1,-30),
    Position = UDim2.new(0,0,0,0),
    Value = '-- Welcome to Octopus!\nprint("Hello Octopus!")',
    Border = false,
    BackgroundColor3 = Color3.fromRGB(30,30,30),
    TextColor3 = Color3.fromRGB(220,220,220),
    Font = Enum.Font.Code,
    TextSize = 14
})

local btnRow = win:Row({
    Spacing = 5,
    Padding = UDim.new(0,0),
    Size = UDim2.new(1,0,0,25),
    Position = UDim2.new(0,0,1,-25)
})

btnRow:Button({
    Text = 'execute',
    Size = UDim2.fromOffset(80,25),
    BackgroundColor3 = Color3.fromRGB(25,25,25),
    TextColor3 = Color3.fromRGB(180,180,180),
    Callback = function()
        local src = editor:GetValue()
        if src and #src>0 then
            local ok,err = pcall(function() loadstring(src)() end)
            if not ok then warn('ERROR: '..tostring(err)) end
        end
    end
})

btnRow:Button({
    Text = 'Clear',
    Size = UDim2.fromOffset(60,25),
    BackgroundColor3 = Color3.fromRGB(25,25,25),
    TextColor3 = Color3.fromRGB(180,180,180),
    Callback = function() editor:SetValue('') end
})

win:Center()
