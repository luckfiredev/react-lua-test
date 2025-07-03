--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

local Spr = require(ReplicatedStorage.Shared.Packages.spr)

local Sound = require(ReplicatedStorage.Utility.Sound)

local useRef = React.useRef

type SwitchProps = {
    Toggled: boolean,

    OnToggle: () -> (),
}

function Switch(props: SwitchProps)
    local ToggleRef = useRef(nil)
    local ScaleRef = useRef(nil)

    local HandleHover = function()
        if not ScaleRef.current then
            return
        end

        Spr.target(ScaleRef.current, 0.5, 2.5, {
            Scale = 1.05
        })
    end
    
    local HandleUnhover = function()
        if not ScaleRef.current then
            return
        end

        Spr.target(ScaleRef.current, 0.5, 3, {
            Scale = 1
        })
    end

    local HandleHoldClick = function()
        if not ToggleRef.current then
            return
        end

        Spr.target(ToggleRef.current, 0.5, 3, {
            Position = props.Toggled
                and UDim2.new(1, -50, 0, 0)
                or nil,
            Size = UDim2.new(0, 50, 0, 40),
        })
    end

    local HandleReleaseClick = function()
        if not ToggleRef.current then
            return
        end

        Spr.target(ToggleRef.current, 0.25, 5, {
            Size = UDim2.new(0, 40, 0, 40),
            Position = props.Toggled
                and UDim2.new(1, -40, 0, 0)
                or nil,
        })
    end

    local HandleToggle = function()
        if not ToggleRef.current then
            return
        end

        if props.OnToggle then
            props.OnToggle()
        end

        Spr.target(ToggleRef.current, 0.5, 5, {
            Position = props.Toggled
                and UDim2.new(0, 0, 0, 0)
                or UDim2.new(1, -40, 0, 0)
        })
        
        Sound:PlaySound({
            Id = "121348992695732",
            Volume = 0.5,
        })
    end

    return React.createElement("ImageButton", {
        AutoButtonColor = false,
        Size = UDim2.new(0, 80, 0, 40),
        BackgroundColor3 = Color3.new(1,1,1),
        
        [React.Event.MouseLeave] = function()
            HandleReleaseClick()
            HandleUnhover()
        end,
        [React.Event.MouseEnter] = HandleHover,

        [React.Event.MouseButton1Down] = HandleHoldClick,
        [React.Event.MouseButton1Up] = HandleReleaseClick,
        [React.Event.Activated] = HandleToggle,
    }, {
        Toggle = React.createElement("Frame", {
            ZIndex = 100,
            Size = UDim2.new(0, 40, 0, 40),
            Position = props.Toggled and UDim2.new(1, -40, 0, 0) or UDim2.new(0, 0, 0, 0),
            BackgroundColor3 = Color3.new(1,1,1),

            ref = ToggleRef,
        }, {
            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, 50),
            }),

            Stroke = React.createElement("UIStroke", {
                Thickness = 4,
                Color = Color3.fromRGB(0,0,0),
            }),
        }),

        InnerShadow = React.createElement("ImageLabel", {
            Image = "rbxassetid://108630113994334",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
        }, {
            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, 50),
            }),
        }),

        Pattern = React.createElement("ImageLabel", {
            Image = "rbxassetid://94975287138341",
            ImageTransparency = 0.75,
            Size = UDim2.new(1, 0, 1, 0),
            ScaleType = Enum.ScaleType.Tile,
            TileSize = UDim2.new(0, 16, 0, 16),
            BackgroundTransparency = 1,
        }, {
            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, 50),
            }),
        }),

        Stroke = React.createElement("UIStroke", {
            Thickness = 4,
            Color = Color3.fromRGB(0,0,0),
        }),

        Radius = React.createElement("UICorner", {
            CornerRadius = UDim.new(0, 50),
        }),

        Gradient = React.createElement("UIGradient", {
            Color = props.Toggled 
                and ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#1AFFAF")),
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#3FFF0F")),
                }
                or ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#FF9F1A")),
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#FF0F0F")),
                },
            Rotation = 0,
        }),

        Scale = React.createElement("UIScale", {
            Scale = 1,
            
            ref = ScaleRef,
        }),
    })
end

return Switch