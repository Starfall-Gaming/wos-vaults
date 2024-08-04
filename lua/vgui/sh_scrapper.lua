local PANEL = {}

function PANEL:Init()

	self:SetText_Base( "" )
	self:SetText( "Time for something different!" )

end

function PANEL:Paint( aWide, aTall )

	local TextX, TextY = 0, 0
	local TextColor = Color( 255, 0, 0, 255 )

	surface.SetFont( self:GetFont() or "default" )
	surface.SetTextColor( TextColor )
	surface.SetTextPos( TextX, TextY )
	surface.DrawText( self:GetText() )

end

-- And here we go:
PANEL.SetText_Base = FindMetaTable( "Panel" ).SetText

function PANEL:SetText( aText ) 

	self.Text = tostring( aText ) 

end

function PANEL:GetText() 

	return self.Text or "" 

end

vgui.Register("wos_Scrapper", PANEL)