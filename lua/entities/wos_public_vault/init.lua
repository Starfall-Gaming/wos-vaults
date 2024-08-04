AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

-- Server-side initialization function for the entity
function ENT:Initialize()
    self:SetModel( "models/niksacokica/tech/tech_slot_machine_03.mdl" ) -- Sets the model for the entity.
    self:PhysicsInit( SOLID_VPHYSICS ) -- Initializes physics for the entity, making it solid and interactable.
    self:SetMoveType( MOVETYPE_VPHYSICS ) -- Sets how the entity moves, using physics.
    self:SetSolid( SOLID_VPHYSICS ) -- Makes the entity solid, allowing for collisions.
    local phys = self:GetPhysicsObject() -- Retrieves the physics object of the entity.
    if phys:IsValid() then -- Checks if the physics object is valid.
        phys:Wake() -- Activates the physics object, making the entity subject to physics (gravity, collisions, etc.).
    end
end

util.AddNetworkString("wOS.PublicVault.OpenPublicVaultMenu")
util.AddNetworkString("wOS.PublicVault.ClosePublicVaultMenu")

function ENT:Use(ply)
	if ply.InWOSPublicVaultMenu then return end

    net.Start("wOS.PublicVault.OpenPublicVaultMenu")
        net.Send(ply)
	ply.InWOSPublicVaultMenu = true
end

net.Receive("wOS.PublicVault.ClosePublicVaultMenu", function(len, ply)
    ply.InWOSPublicVaultMenu = false
end)