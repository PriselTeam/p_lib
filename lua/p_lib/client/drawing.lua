local fonts = {}
local circles = {}

RX = RX or function(x) return x / 1920 * ScrW() end
RY = RY or function(y) return y / 1080 * ScrH() end

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