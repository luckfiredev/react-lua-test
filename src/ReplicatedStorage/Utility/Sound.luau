--!strict

local SoundService = game:GetService("SoundService")

local Sound = {}

type SoundProps = {
    Id: string,
    Volume: number,
}

function Sound:PlaySound(p: SoundProps)
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