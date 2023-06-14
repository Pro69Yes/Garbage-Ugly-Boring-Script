local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Sans Simulator X | 9970498292", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Main Section"
})

local heartbeat

Tab:AddToggle({
    Name = "AutoClicker",
    Default = false,
    Callback = function(Value)
        getgenv().AutoClicker = Value
        if getgenv().AutoClicker then
            heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
                local args = {
                    [1] = game:GetService("Players").LocalPlayer
                }

                game:GetService("ReplicatedStorage").RemoteEvents.GainClicks:FireServer(unpack(args))
            end)
        elseif heartbeat then
            heartbeat:Disconnect()
        end
    end    
})

Tab:AddToggle({
    Name = "AutoLevel Up Pets",
    Default = false,
    Callback = function(Value)
        getgenv().AutoLevelUp = Value
        while getgenv().AutoLevelUp do
            task.wait()
            firetouchinterest(game.Workspace.XPorb, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            firetouchinterest(game.Workspace.XPorb, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
        end    
    end
})

Tab:AddButton({
    Name = "Equip All Pets",
    Callback = function()
        for i, pets in ipairs(game.Players.LocalPlayer.Pets:GetChildren()) do
            if not pets.Equipped.Value then
                local args = {
                    pets.Pet_ID.Value
                }

                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("PetEquipped"):FireServer(unpack(args))
                pets.Equipped.Value = true
            end
        end
    end    
})

Tab:AddButton({
    Name = "Unequip All Pets",
    Callback = function()
        for i, pets in ipairs(game.Players.LocalPlayer.Pets:GetChildren()) do 
            if pets.Equipped.Value then
                local args = {
                    [1] = pets.Pet_ID.Value
                }

                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("PetUnequipped"):FireServer(unpack(args))
                pets.Equipped.Value = false
            end
        end
    end    
})

local EggsList = {}

for i, lol in ipairs(game.Workspace.Eggs:GetChildren()) do
    table.insert(EggsList, lol.Name)
end

getgenv().EggOption = nil

Tab:AddDropdown({
    Name = "Eggs",
    Default = "None",
    Options = EggsList,
    Callback = function(Value)
        getgenv().EggOption = Value
    end    
})

getgenv().AutoOpenEggsCooldown = nil

Tab:AddTextbox({
    Name = "AutoOpen Eggs Cooldown",
    Default = "0.5",
    TextDisappear = true,
    Callback = function(Value)
        getgenv().AutoOpenEggsCooldown = Value or 0.5
    end	  
})

Tab:AddToggle({
    Name = "AutoOpen Egg (Single)",
    Default = false,
    Callback = function(Value)
        getgenv().AutoOpenEggsSingle = Value
        while getgenv().AutoOpenEggsSingle do
            wait(getgenv().AutoOpenEggsCooldown)
            local args = {
                [1] = getgenv().EggOption
            }

            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Eclicked"):FireServer(unpack(args))
        end
    end    
})

Tab:AddToggle({
    Name = "AutoOpen Egg (Triple)",
    Default = false,
    Callback = function(Value)
        getgenv().AutoOpenEggsTriple = Value 
        while getgenv().AutoOpenEggsTriple do
            wait(getgenv().AutoOpenEggsCooldown)
            local args = {
                [1] = getgenv().EggOption
            }

            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Rclicked"):FireServer(unpack(args))
        end
    end    
})

local Tab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Misc Section"
})

Tab:AddButton({
    Name = "Infinite Max Pets Equip", -- and yes, it's FE
    Callback = function()
        game.Players.LocalPlayer.PlayerStats.MaxPets.Value = math.huge
    end    
})

OrionLib:Init()

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local HatedGuy = {
    ["Amogus60s"] = true,
    ["l0weexwzfbp7kiqyksx0"] = true
}

for _, Hated in ipairs(game.Players:GetPlayers()) do
    if HatedGuy[Hated.Name] then
        Notification:Notify(
            {
                Title = "Notification",
                Description = "A loser/owner of the script joined the game: " .. Hated.DisplayName
            },
            {OutlineColor = Color3.fromRGB(76, 0, 130), Time = 5, Type = "default"}
        )
        break
    end
end

