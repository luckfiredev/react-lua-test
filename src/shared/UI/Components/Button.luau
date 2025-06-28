--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local React = require(ReplicatedStorage.Shared.Packages.react)

type ButtonProps = {
    Text: string,
    GradientLeft: Color3,
    GradientRight: Color3,
    OnClick: () -> (),
}

function tweenScale(ref: any, to: number)
    local Tween = TweenService:Create(
        ref,
        TweenInfo.new(
            0.15,
            Enum.EasingStyle.Sine, Enum.EasingDirection.Out,
            0, false, 0
        ),
        { Scale = to }
    )
    Tween:Play()
end

function Button(props: ButtonProps)
    local RubikBold = Font.new("rbxassetid://12187365977", Enum.FontWeight.Bold)
    local ButtonScaleRef = React.useRef(nil)

    local function HandleClick()
        if props.OnClick then
            props.OnClick()
        end
    end

    local function HandleHover()
        if not ButtonScaleRef.current then
            return
        end

        tweenScale(ButtonScaleRef.current, 1.1)
    end

    local function HandleUnhover()
        if not ButtonScaleRef.current then
            return
        end

        tweenScale(ButtonScaleRef.current, 1)
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
            BackgroundTransparency = 1
        }, {
            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, 15),
            }),
        }),

        Button = React.createElement("TextButton", {
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = Color3.new(1,1,1),
            BackgroundTransparency = 0,

            Text = "",

            [React.Event.Activated] = HandleClick,
            [React.Event.MouseEnter] = HandleHover,
            [React.Event.MouseLeave] = HandleUnhover,
        }, {
            InnerContent = React.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY,
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
            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 15),
                PaddingBottom = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 20),
                PaddingLeft = UDim.new(0, 20),
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