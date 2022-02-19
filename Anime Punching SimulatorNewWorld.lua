_G.AutoFarmToggle = false

function AutoFarm()
    spawn(function()
    while wait() do
    if _G.AutoFarmToggle == true then do
                local args = { [1] = "Tapping", [2] = workspace.NPCS.Krunks.HumanoidRootPart}
                game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))
                end
            end
        end
    end)
end




local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local a = library:CreateWindow("Main") -- Creates the window
local b = a:CreateFolder("Main") -- Creates the window
local c = a:CreateFolder("Other") -- Creates the window



local selectednpc = {}
b:Dropdown("Auto Farm",{"Krunks", "Dio", "Giuyuu", "Zaitama"},true,function(value) --true/false, replaces the current title "Dropdown" with the option that t
    selectednpc = value
end)


b:Toggle("Auto Farm",function(bool)
    _G.AutoFarmToggle = bool
    if bool and selectednpc then
        repeat
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").NPCS[selectednpc].Head.Position)
    AutoFarm()
    task.wait(0.3)
        until _G.AutoFarmToggle == false 
    end
end)
