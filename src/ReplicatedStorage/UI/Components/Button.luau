--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local Spr = require(ReplicatedStorage.Shared.Packages.spr)

local Rubik = require(ReplicatedStorage.Fonts.Rubik)
local Sound = require(ReplicatedStorage.Utility.Sound)

type ButtonProps = {
    Disabled: boolean?,

    Text: string?,
    Icon: string?,

    Size: UDim2?,

    GradientLeft: Color3,
    GradientRight: Color3,
    OnClick: () -> (),

    children: any,
}

function Button(props: ButtonProps)
    local Radius = 20
    local InnerRadius = Radius - 4

    local RubikBold = Font.new("rbxassetid://12187365977", Enum.FontWeight.Bold)

    local ButtonHoverRef = React.useRef(nil)
    local ButtonScaleRef = React.useRef(nil)

    local ButtonTransparency = props.Disabled and 0.5 or 0

    local function HoldClick()
        if props.Disabled or not ButtonScaleRef.current then
            return
        end

        Spr.target(ButtonScaleRef.current, 2.5, 5, {
            Scale = 0.95
        })
    end

    local function HandleClick()
        if props.Disabled then
            return
        end

        if props.OnClick then
            props.OnClick()
        end

        if not ButtonScaleRef.current then
            return
        end

        Spr.target(ButtonScaleRef.current, 0.35, 2, {
            Scale = 1.05
        })

        Sound:PlaySound({
            Id = "17161216230",
            Volume = 0.5,
        })
    end

    local function HandleHover()
        if props.Disabled or not ButtonScaleRef.current or not ButtonHoverRef.current then
            return
        end

        ButtonHoverRef.current.BackgroundTransparency = 0.85

        Spr.target(ButtonScaleRef.current, 1, 5, {
            Scale = 1.05
        })

        Sound:PlaySound({
            Id = "17161204665",
            Volume = 0.5,
        })
    end

    local function HandleUnhover()
        if props.Disabled or not ButtonScaleRef.current or not ButtonHoverRef.current then
            return
        end

        Spr.target(ButtonScaleRef.current, 1, 5, {
            Scale = 1
        })

        ButtonHoverRef.current.BackgroundTransparency = 1
    end

    return React.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromHex("#1A1A1A"),
    }, {
        Button = React.createElement("TextButton", {
            ZIndex = 4,
            AutomaticSize = Enum.AutomaticSize.XY,
            AutoButtonColor = false,

            Text = "",

            FontFace = Rubik.Bold,
            TextSize = 36,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(0,0,0),

            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,

            [React.Event.Activated] = HandleClick,
            [React.Event.MouseButton1Down] = HoldClick,
            [React.Event.MouseEnter] = HandleHover,
            [React.Event.MouseLeave] = HandleUnhover,
        }, {
            Content = React.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
            }, {
                Wrapper = React.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Size = if props.Size then props.Size else nil,
                    BackgroundTransparency = 1,
                }, {
                    Icon = props.Icon and React.createElement("ImageLabel", {
                        ZIndex = 2,
                        Image = props.Icon,
                        ImageTransparency = ButtonTransparency,
                        Size = UDim2.new(0, 36, 0, 36),
                        BackgroundTransparency = 1,
                    }, {}),

                    Text = props.Text and React.createElement("TextLabel", {
                        ZIndex = 2,
                        AutomaticSize = Enum.AutomaticSize.XY,

                        Text = props.Text,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextTransparency = ButtonTransparency,
                        TextSize = 36,
                        FontFace = RubikBold,

                        BackgroundTransparency = 1,
                    }, {
                        Stroke = React.createElement("UIStroke", {
                            Thickness = 2,
                            Color = Color3.fromRGB(0,0,0),
                            Transparency = ButtonTransparency,
                        }),
                    }),

                    Layout = React.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        Padding = UDim.new(0, 10),
                    }),
                }),

                Layout = React.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    Padding = UDim.new(0, 10),
                }),
            }),

            Padding = props.Text and React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 15),
                PaddingBottom = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 20),
                PaddingLeft = UDim.new(0, 20),
            }),

            PaddingIconOnly = not props.Text and React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 15),
                PaddingBottom = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 15),
                PaddingLeft = UDim.new(0, 15),
            }),

            Stroke = React.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(0,0,0),
            }),

            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, Radius),
            }),
        }),

        ButtonHover = React.createElement("Frame", {
            ZIndex = 3,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,

            ref = ButtonHoverRef,
        }, {
            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, InnerRadius),
            }),
        }),

        InnerSahdow = React.createElement("ImageLabel", {
            ZIndex = 2,
            Image = "rbxassetid://108630113994334",
            ImageTransparency = ButtonTransparency,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
        }, {
            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, InnerRadius),
            }),
        }),

        InnerGradient = React.createElement("Frame", {
            ZIndex = 1,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = ButtonTransparency,
        }, {
            Gradient = React.createElement("UIGradient", {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, props.GradientLeft),
                    ColorSequenceKeypoint.new(1, props.GradientRight)
                },
                Rotation = 75,
            }),

            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, InnerRadius),
            }),
        }),

        Padding = React.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 3),
            PaddingBottom = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 3),
            PaddingLeft = UDim.new(0, 3)
        }),

        Scale = React.createElement("UIScale", {
            Scale = 1,
            
            ref = ButtonScaleRef,
        }),

        Radius = React.createElement("UICorner", {
            CornerRadius = UDim.new(0, Radius),
        }),
    }, {
        props.children,
    })
end

return Button