--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local Spr = require(ReplicatedStorage.Shared.Packages.spr)

type ButtonProps = {
    Text: string,
    GradientLeft: Color3,
    GradientRight: Color3,
    OnClick: () -> (),
}


function Button(props: ButtonProps)
    local RubikBold = Font.new("rbxassetid://12187365977", Enum.FontWeight.Bold)

    local ButtonHoverRef = React.useRef(nil)
    local ButtonScaleRef = React.useRef(nil)

    local function HoldClick()
        if not ButtonScaleRef.current then
            return
        end

        Spr.target(ButtonScaleRef.current, 2.5, 5, {
            Scale = 0.95
        })
    end

    local function HandleClick()
        if props.OnClick then
            props.OnClick()
        end

        if not ButtonScaleRef.current then
            return
        end

        Spr.target(ButtonScaleRef.current, 1, 5, {
            Scale = 1.1
        })
    end

    local function HandleHover()
        if not ButtonScaleRef.current or not ButtonHoverRef.current then
            return
        end

        Spr.target(ButtonScaleRef.current, 1, 5, {
            Scale = 1.1
        })

        ButtonHoverRef.current.BackgroundTransparency = 0.85
    end

    local function HandleUnhover()
        if not ButtonScaleRef.current or not ButtonHoverRef.current then
            return
        end

        Spr.target(ButtonScaleRef.current, 1, 5, {
            Scale = 1
        })

        ButtonHoverRef.current.BackgroundTransparency = 1
    end

    return React.createElement("Frame",{
        AutomaticSize = Enum.AutomaticSize.XY,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundColor3 = Color3.fromHex("#1A1A1A"),
    }, {
        InnerShadow = React.createElement("ImageLabel", {
            ZIndex = 100,
            Image = "rbxassetid://108630113994334",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
        }, {
            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, 15),
            }),
        }),

        Button = React.createElement("TextButton", {
            AutomaticSize = Enum.AutomaticSize.XY,
            AutoButtonColor = false,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 0,

            Text = "",

            [React.Event.Activated] = HandleClick,
            [React.Event.MouseButton1Down] = HoldClick,
            [React.Event.MouseEnter] = HandleHover,
            [React.Event.MouseLeave] = HandleUnhover,
        }, {
            ButtonHover = React.createElement("Frame", {
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),

                ref = ButtonHoverRef,
            }, {
                Radius = React.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 15),
                }),
            }),

            InnerContent = React.createElement("Frame", {
                ZIndex = 100,
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
           }, {
                Text = React.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Text = props.Text,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 36,
                    FontFace = RubikBold,
                    BackgroundTransparency = 1,
                }, {
                    Stroke = React.createElement("UIStroke", {
                        Thickness = 2,
                        Color = Color3.fromRGB(0,0,0),
                    }),
                }),

                Padding = React.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 15),
                    PaddingBottom = UDim.new(0, 12),
                    PaddingRight = UDim.new(0, 20),
                    PaddingLeft = UDim.new(0, 20),
                }),

                LayoutOrder = React.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    Padding = UDim.new(0, 10),
                }),
            }),
            Stroke = React.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(0,0,0),
            }),
            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, 15),
            }),
            Gradient = React.createElement("UIGradient", {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, props.GradientLeft),
                    ColorSequenceKeypoint.new(1, props.GradientRight)
                },
            }),
        }),

        Radius = React.createElement("UICorner", {
            CornerRadius = UDim.new(0, 19),
        }),
        Padding = React.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 3),
            PaddingBottom = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 3),
            PaddingLeft = UDim.new(0, 3),
        }),

        UIScale = React.createElement("UIScale", {
            Scale = 1,

            ref = ButtonScaleRef,
        }),
    })
end

return Button