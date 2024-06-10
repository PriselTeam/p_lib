function PLib:PlayURL(sUrl)
    sound.PlayURL(sUrl, "", 
    function(iStation)
        if IsValid(iStation) then
            iStation:SetVolume(0.5)
            iStation:Play()
        end 
    end)
end