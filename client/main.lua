NTH.Emoticon = {
    Droite = "→",
    Cadena = "🔒",
    Plus = "➕",
    Poubelle = "🗑️",
    Check = "✅"
}
Citizen.CreateThread(function()
    while true do
       Citizen.Wait(10)
       if NetworkIsPlayerActive(PlayerId()) then
           TriggerServerEvent('nth:playerJoined')
           break
       end 
    end
end)