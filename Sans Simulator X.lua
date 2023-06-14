local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Sans Simulator X | 9970498292", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({

	Name = "Main",	Icon = "rbxassetid://4483345998",

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

local EggsList = {}

for i,lol in ipairs(game.Workspace.Eggs:GetChildren()) do table.insert(EggsList,lol.Name)

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

Tab:AddToggle({

	Name = "AutoOpen Egg {Single}",

	Default = false,

	Callback = function(Value)

		getgenv().AutoOpenEggsSingle = Value 

 while getgenv().AutoOpenEggsSingle do wait(0.5)

   local args = {

    [1] = getgenv().EggOption

}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Eclicked"):FireServer(unpack(args))

   end

	end    

})

Tab:AddToggle({

	Name = "AutoOpen Egg {Triple}",

	Default = false,

	Callback = function(Value)

		getgenv().AutoOpenEggsTriple = Value 

 while getgenv().AutoOpenEggsTriple do wait(0.5)

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

	Name = "Infinite Max Pets Equip", -- and yes its fe

	Callback = function()

      		game.Players.LocalPlayer.PlayerStats.MaxPets.Value = math.huge

  	end    

})
