include("shared.lua")

-- Client-side draw function for the entity
function ENT:Draw()
    self:DrawModel() -- Draws the model of the entity. This function is called every frame.
end

net.Receive("wOS.PrivateVault.OpenPrivateVaultMenu", function()
    vgui.Create("wOS_PrivateVault")
end)