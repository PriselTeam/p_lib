PLang = PLang or {}
PLang.Lang = PLang.Lang or "fr"

function PLang:GetLang()
    return PLang.Lang
end

function PLang:SetLang(sLang)
    PLang.Lang = sLang
end

function PLang:Translate(sKey, ...)
    return string.format(PLang[PLang.Lang][sKey], ...)
end

function i18n(sKey, ...)
    return PLang:Translate(sKey, ...)
end