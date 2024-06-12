local fonts = {}
local circles = {}

RX = RX or function(x) return x / 1920 * ScrW() end
RY = RY or function(y) return y / 1080 * ScrH() end

hook.Add("OnScreenSizeChanged", "PLib:OnScreenSizeChanged", function()
	fonts = {}
	circles = {}
end)

function PLib:Font(sType, iSize, iWidth)
    if sType == "Montserrat" then
        sType = ""
    end

	iSize = iSize or 15
	sType = sType or "Bold"
	iWidth = iWidth or 700

	local sName = ("PLib:Font:%i:%s:%i"):format(iSize, sType, iWidth)
	
	if not fonts[sName] then

		surface.CreateFont(sName, {
			font = ("Montserrat %s"):format(sType):Trim(),
			size = iSize,
			width = iWidth
		})

		fonts[sName] = true

	end

	return sName
end

function PLib:MakeCirclePoly(iX, iY, iRadius, iSides)
	local poly = {}
	local key = ("%i:%i:%i:%i"):format(iX, iY, iRadius, iSides)

	if not circles[key] then
		local iAngleIncrement = (2 * math.pi) / iSides

		for i = 1, iSides do
			local iAngle = i * iAngleIncrement
			local iX = iX + math.cos(iAngle) * iRadius
			local iY = iY + math.sin(iAngle) * iRadius

			table.insert(poly, {x = iX, y = iY})
		end

		circles[key] = poly
		return circles[key]
	end

	return circles[key]
end


function PLib:DrawCircle(iX, iY, iRadius, cColor, iSides)
	iSides = iSides or 32

	surface.SetDrawColor(cColor)
	draw.NoTexture()
	surface.DrawPoly(self:MakeCirclePoly(iX, iY, iRadius, iSides))
end

function PLib:DrawArc(x, y, ang, p, rad, color, seg)
	seg = seg or 80
	ang = (-ang) + 180
	local circle = {}

	table.insert(circle, {
		x = x,
		y = y
	})
	for i = 0, seg do
		local a = math.rad((i / seg) * -p + ang)
		table.insert(circle, {
			x = x + math.sin(a) * rad,
			y = y + math.cos(a) * rad
		})
	end

	surface.SetDrawColor(color)
	draw.NoTexture()
	surface.DrawPoly(circle)
end