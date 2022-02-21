_G.AutoFarmToggle = false

function AutoFarm(selectednpc)
    spawn(function()
        local plyr = game.Players.LocalPlayer;
        while task.wait() do
            if not _G.AutoFarmToggle then break end; --close the spawn function if toggled off so it can be restarted again
            if selectednpc and plyr.Character then -- make sure you have values set
                if(game.Workspace.NPCS:FindFirstChild(selectednpc) and game.Workspace.NPCS[selectednpc].Health.Value > 1) then  --check health before doing anything
                    plyr.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").NPCS[selectednpc].Head.Position) --teleport to npc
                    local args = { [1] = "Tapping", [2] = workspace.NPCS[selectednpc].HumanoidRootPart} --do your remote stuff
                    game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))
                end
            end
        end
    end)
end

function TeleportToNormalWorld()
    game:GetService("TeleportService"):Teleport(8357510970);
end


local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local a = library:CreateWindow("Main") -- Creates the window
local b = a:CreateFolder("Main") -- Creates the window
local c = a:CreateFolder("Other") -- Creates the window

local selectedNPC
b:Dropdown("Selected NPC",{"Krunks", "Giuyuu", "Zaitama", "Dio"},true,function(value) --true/false, replaces the current title "Dropdown" with the option that t
    selectedNPC = value
    end)


b:Toggle("Auto Farm",function(bool)
    _G.AutoFarmToggle = bool
    if bool and selectedNPC then
        AutoFarm(selectedNPC)
    end
end)

c:Button("Teleport To Normal",function()
    TeleportToNormalWorld()
end)

c:DestroyGui()

local GC = getconnections or get_signal_cons
if GC then
    for i,v in pairs(GC(game.Players.LocalPlayer.Idled)) do
        if v["Disable"] then
            v["Disable"](v)
        elseif v["Disconnect"] then
            v["Disconnect"](v)
        end
    end
else
    -- use alt method since exploit doesnt support getconnections
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end
