NTH.Audio = {};
local Audio = NTH.Audio;

---@param library string
---@param sound string
---@param isLooped boolean
function Audio.PlaySound(library, sound, isLooped)
    local audioId
    if not isLooped then
        PlaySoundFrontend(-1, sound, library, true)
    else
        if not audioId then
            Citizen.CreateThread(function()
                audioId = GetSoundId()
                PlaySoundFrontend(audioId, sound, library, true)
                Citizen.Wait(0.01)
                StopSound(audioId)
                ReleaseSoundId(audioId)
                audioId = nil
            end)
        end
    end
end
