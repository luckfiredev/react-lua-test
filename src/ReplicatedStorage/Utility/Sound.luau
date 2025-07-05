--!strict

local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

local Sound = {}

type SoundProps = {
    Id: string,
    Volume: number,
}

function Sound:PlaySound(p: SoundProps)
    -- Prevents the sound from playing when not playtesting.
    -- Primary use-case is for Storybook. It attempts to play but they do not playback.
    if not RunService:IsRunning() then
        return
    end

    local Sound = Instance.new("Sound")

    Sound.SoundId = "rbxassetid://" .. p.Id
    Sound.Parent = SoundService
    Sound.Volume = p.Volume

    Sound:Play()

    task.delay(Sound.TimeLength + 3, function()
        Sound:Destroy()
    end)
end

return Sound