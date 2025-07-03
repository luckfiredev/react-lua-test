local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

local useEffect = React.useEffect

type BackgroundProps = {
    GradientLeft: Color3,
    GradientRight: Color3,
}

function Background(props: BackgroundProps)
    useEffect(function()
        local Lighting = game:GetService("Lighting")
        local Blur = Instance.new("BlurEffect")

        Blur.Size = 50
        Blur.Parent = Lighting

        return function()
            Blur:Destroy()
        end
    end, {})

    return React.createElement("Frame", {
        ZIndex = -100, -- This is awful.
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 0.5,
    }, {
        Pattern = React.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),

            Image = "rbxassetid://94642687357965",
            ImageTransparency = 0.75,
            Size = UDim2.new(5, 0, 5, 0),
            TileSize = UDim2.new(0, 10, 0, 10),
            ScaleType = Enum.ScaleType.Tile,
            BackgroundTransparency = 1,

            Rotation = -25,
        }),

        Gradient = React.createElement("UIGradient", {
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, props.GradientLeft),
                ColorSequenceKeypoint.new(1, props.GradientRight),
            },
            Rotation = 0,
        }),
    })
end

return Background