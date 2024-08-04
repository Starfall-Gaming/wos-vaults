local PANEL = {}

function PANEL:Init()
	self:SetPos( 10, 30 ) -- Set the position of the panel
	self:SetSize( 200, 200 ) -- Set the size of the panel

	self:SetVisible(true)
	self:SetDraggable(false)
	self:ShowCloseButton(true)
	self:MakePopup()
end

function PANEL:OnClose()
	net.Start("wOS.Scrapper.CloseScrapperMenu")
	net.SendToServer()
end

vgui.Register("wos_Scrapper", PANEL, "DFrame")