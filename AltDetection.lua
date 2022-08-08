local player = game:GetService"Players".LocalPlayer

if player.MembershipType == Enum.MembershipType.Premium then
    local premium = true
else
    premium = false
end
if premium == false then
    if player.AccountAge <= 70 and premium == false then
        local alt = true
    elseif player.AccountAge >= 70 and premium == false then
        alt = "possible"
    elseif player.AccountAge >= 70 and premium == true then
        alt = false
    end
end