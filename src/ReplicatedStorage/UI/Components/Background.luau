local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

type BackgroundProps = {
    GradientLeft: Color3,
    GradientRight: Color3,
}

function Background(props: BackgroundProps, ref: any?)
    if not ref then
        ref = React.createRef()
    end

    return React.createElement("ImageLabel", {
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,

        ref = ref,
    }, {
        Pattern = React.createElement("ImageLabel", {
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),

            Image = "rbxassetid://94642687357965",
            ImageTransparency = 1,
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

return React.forwardRef(Background)