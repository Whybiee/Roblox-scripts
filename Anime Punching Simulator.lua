_G.AutoTapToggle = false
_G.AutoEquiptBestToggle = false
_G.AutoRebirthToggle = false
_G.AutoUpgradeToggle = false
_G.NotifcationsOfftoggle = false

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

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local a = library:CreateWindow("Main") -- Creates the window

local b = library:CreateWindow("Auto Upgrades") -- Creates the window

local c = library:CreateWindow("Auto Rebirth") -- Creates the window

local d = library:CreateWindow("Other") -- Creates the window

local e = a:CreateFolder("Main") -- Creates the window

local f = b:CreateFolder("Auto Upgrades") -- Creates the window

local g = c:CreateFolder("Auto Rebirth") -- Creates the window

local h = d:CreateFolder("Other") -- Creates the window


h:Label("Right CTRL to close gui",{
    TextSize = 20; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(32,28,28); -- Self Explaining
    
}) 

e:Toggle("Auto Click",function(bool)
    _G.AutoTapToggle = bool
    if bool then
        AutoTap()
    end
end)

e:Toggle("Auto Best hero",function(bool)
    _G.AutoEquiptBestToggle = bool
    if bool then
        AutoEquiptBest()
    end
end)


local maxRebirths = 37;
local rebirthTable = {}
for i = 1,maxRebirths, 1 do 
    table.insert(rebirthTable, tostring(i))
 end

local selectedRebirth
g:Dropdown("Rebirth Level",rebirthTable,true,function(value) --true/false, replaces the current title "Dropdown" with the option that t
    selectedRebirth = value
end)

g:Toggle("Auto Rebirth",function(bool)
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

local selectedLevel
f:Dropdown("Upgrade Level",selectedUpgradeTable,true,function(value2) --true/false, replaces the current title "Dropdown" with the option that t
    selectedLevel = value2
end)

f:Toggle("Auto Upgrade",function(bool)
    _G.AutoUpgradeToggle = bool
    if bool and selectedLevel then
        AutoUpgrade(selectedLevel)
    end
end)



h:DestroyGui()