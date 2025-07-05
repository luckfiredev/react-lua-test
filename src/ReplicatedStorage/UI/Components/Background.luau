local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

local useEffect = React.useEffect

type BackgroundProps = {
    GradientLeft: Color3,
    GradientRight: Color3,
}

function Background(props: BackgroundProps, ref: any?)
    local PatternRef = React.useRef(nil)

    if not ref then
        ref = React.createRef()
    end

    useEffect(function()
        if not PatternRef.current then
            return
        end

        local conn = RunService.RenderStepped:Connect(function()
            PatternRef.current.Position += UDim2.new(0.0005, 0, -0.0005, 0)
            if PatternRef.current.Position.X.Scale >= 1.5 or PatternRef.current.Position.Y.Scale <= -0.5 then
                PatternRef.current.Position = UDim2.new(0.5, 0, 0.5, 0)
            end
        end)

		return function()
			conn:Disconnect()
		end
    end, {})
    
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
            Size = UDim2.new(4, 0, 2.5, 0),
            TileSize = UDim2.new(0, 12, 0, 12),
            ScaleType = Enum.ScaleType.Tile,
            BackgroundTransparency = 1,

            Rotation = -25,
            ref = PatternRef,
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