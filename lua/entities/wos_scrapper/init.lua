AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

-- Server-side initialization function for the entity
function ENT:Initialize()
    self:SetModel( "models/niksacokica/alliance/alliance_bin_02.mdl" ) -- Sets the model for the entity.
    self:PhysicsInit( SOLID_VPHYSICS ) -- Initializes physics for the entity, making it solid and interactable.
    self:SetMoveType( MOVETYPE_VPHYSICS ) -- Sets how the entity moves, using physics.
    self:SetSolid( SOLID_VPHYSICS ) -- Makes the entity solid, allowing for collisions.
    self:SetTrigger(true)
    local phys = self:GetPhysicsObject() -- Retrieves the physics object of the entity.
    if phys:IsValid() then -- Checks if the physics object is valid.
        phys:Wake() -- Activates the physics object, making the entity subject to physics (gravity, collisions, etc.).
    end
end

function ENT:Touch(ent)
    if ent.ClassName != "wos_item_base" then return end
    -- if ent.Type != WOS_INV.ITEM then return end

    local name = ent:GetItemName()
    local xp = wOS.vaults.scrapper.GetReward(name)
    local ply = ent:GetOwner()
    print(ply:Name() .. " scrapped " .. name .. " for " .. xp .. " experience")
    ply:ChatPrint("Scrapped " .. name .. " for " .. xp .. " experience")
    if ply.AddSkillXP then
        ply:AddSkillXP(xp)
    end
    ent:Remove()
end