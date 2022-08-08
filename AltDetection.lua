local player = game:GetService"Players".LocalPlayer
local premium = false
local alt = true
if player.MembershipType == Enum.MembershipType.Premium then
    premium = true
end

if not premium and player.AccountAge >= 70 then
     alt = "Possible"
elseif premium and player.AccountAge >= 70 then
    alt = false
end
