_G.AutoTapToggle = false
_G.AutoEquiptBestToggle = false
_G.AutoRebirthToggle = false
_G.AutoUpgradeToggle = false
_G.AutoOpenEggsToggle = false
_G.AutoOpen3EggsToggle = false
_G.AutoTrainToggle = false

function AutoTap()
    spawn(function()
        while _G.AutoTapToggle == true do
        game:GetService("ReplicatedStorage").Remotes.TappingEvent:FireServer()
        wait()
        end
    end)
end

function AutoEquiptBest()
    spawn(function()
    while _G.AutoEquiptBestToggle == true do
    local args = {[1] = "EquipBest"}
    game:GetService("ReplicatedStorage").Remotes.NPCSystem:FireServer(unpack(args))
    task.wait(15)
        end
    end)
end


function AutoRebirth(RebirthLevel)
    spawn(function()
        while _G.AutoRebirthToggle == true do
        local args = { 
            [1] = "Rebirths", 
            [2] = tonumber(RebirthLevel)}
        game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))
        end
    end)
end

function AutoUpgrade(upgrade)
    spawn(function()
        while _G.AutoUpgradeToggle == true do
    local args = {[1] = "Upgrade", [2] = tonumber(upgrade)}
    game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))
        end
    end)
end


function AutoBuyEgg1()
    spawn(function()
        while wait() do
            if _G.AutoOpenEggsToggle == true then do
                keypress(0x45)
                wait(0.5)
                firesignal(game:GetService("Players").LocalPlayer.PlayerGui.Ui.CenterFrame.BuyEgg.Frame.Buy1.Button.MouseButton1Click)
                end
            end
        end
    end)
end
    
    
function AutoBuyEgg3()
    spawn(function()
        while wait() do
                if _G.AutoOpen3EggsToggle == true then do
            keypress(0x45)
            wait(0.5)
            firesignal(game:GetService("Players").LocalPlayer.PlayerGui.Ui.CenterFrame.BuyEgg.Frame.Buy3.Button.MouseButton1Click)
                end
            end
        end
    end)
end

function getCurrentPlayerPOS()
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        return plyr.Character.HumanoidRootPart.Position
    end
    return false
end

function teleportTO(placeCFrame)
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame
    end
end

function teleportEgg(egg)
    if game:GetService("Workspace")["__SETTINGS"]["__EGG"]:FindFirstChild(egg) then
        teleportTO(game:GetService("Workspace")["__SETTINGS"]["__EGG"][egg].EGG.CFrame)
    end
end

function train()
    spawn(function()
        while wait() do
            if _G.AutoTrainToggle == true then do
            local VirtualInputManager=game:GetService("VirtualInputManager")
            VirtualInputManager:SendKeyEvent(true,"E",false,game)
                end
            end
        end
    end)
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local a = library:CreateWindow("Main") -- Creates the window

local b = library:CreateWindow("Auto Buy Eggs") -- Creates the window

local c = library:CreateWindow("Auto Upgrades") -- Creates the window

local d = library:CreateWindow("Auto Rebirth") -- Creates the window

local e = library:CreateWindow("Other") -- Creates the window

local f = a:CreateFolder("Main") -- Creates the window

local g = b:CreateFolder("Eggs") -- Creates the window

local h = c:CreateFolder("Auto Upgrades") -- Creates the window

local i = d:CreateFolder("Auto Rebirth") -- Creates the window

local j = e:CreateFolder("Other") -- Creates the window


j:Label("Right CTRL to open/close gui",{
    TextSize = 20; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(32,28,28); -- Self Explaining
    
}) 

f:Toggle("Auto Click",function(bool)
    _G.AutoTapToggle = bool
    if bool then
        AutoTap()
    end
end)

f:Toggle("Auto Best hero",function(bool)
    _G.AutoEquiptBestToggle = bool
    if bool then
        AutoEquiptBest()
    end
end)

f:Label("Equipts best hero every 15 sec",{
    TextSize = 15; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(32,28,28); -- Self Explaining
    
}) 


local maxRebirths = 37;
local rebirthTable = {}
for i = 1,maxRebirths, 1 do 
    table.insert(rebirthTable, tostring(i))
 end

local selectedRebirth
i:Dropdown("Rebirth Level",rebirthTable,true,function(value) --true/false, replaces the current title "Dropdown" with the option that t
    selectedRebirth = value
end)

i:Toggle("Auto Rebirth",function(bool)
    _G.AutoRebirthToggle = bool
    if bool and selectedRebirth then
        AutoRebirth(selectedRebirth)
    end
end)

local bestUpgrade = 5;
local selectedUpgradeTable = {}
for i = 1,bestUpgrade, 1 do 
    table.insert(selectedUpgradeTable, tostring(i))
end

local SelectedUpgrade
h:Dropdown("Upgrade Level",selectedUpgradeTable,true,function(value2) --true/false, replaces the current title "Dropdown" with the option that t
    SelectedUpgrade = value2
end)

h:Toggle("Auto Upgrade",function(bool)
    _G.AutoUpgradeToggle = bool
    if bool and SelectedUpgrade then
        AutoUpgrade(SelectedUpgrade)
    end
end)

local eggs = {}
for i,v in pairs(game:GetService("Workspace")["__SETTINGS"]["__EGG"]:GetDescendants()) do
    if v.Name == "EGG" and v.Parent then
        table.insert(eggs,v.Parent)
    end
end

local selectedEgg
g:Dropdown("Egg",eggs,true,function(value3)
    selectedEgg = value3
end)

g:Toggle("Auto Egg",function(bool)
    _G.AutoOpenEggsToggle = bool
    if bool and selectedEgg then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace")["__SETTINGS"]["__EGG"][selectedEgg].EGG.Position)
    AutoBuyEgg1()
    end
end)

g:Toggle("Auto 3 Eggs",function(bool)
    _G.AutoOpen3EggsToggle = bool
    if bool and selectedEgg then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace")["__SETTINGS"]["__EGG"][selectedEgg].EGG.Position)
    AutoBuyEgg3()
    end
end)

g:Label("Must own world",{
    TextSize = 20; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(32,28,28); -- Self Explaining
    
}) 

g:Label("Must own gamepass",{
    TextSize = 20; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(32,28,28); -- Self Explaining
    
}) 

g:Label("Takes a min to open",{
    TextSize = 20; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(32,28,28); -- Self Explaining
    
}) 

f:Toggle("Auto Train",function(bool)
    _G.AutoTrainToggle = bool
    if bool then
        train()
    end
end)

f:Label("Go to the place you want to practice first",{
    TextSize = 15; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(32,28,28); -- Self Explaining
    
}) 

j:DestroyGui()
