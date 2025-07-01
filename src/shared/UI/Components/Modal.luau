--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

local Rubik = require(ReplicatedStorage.Shared.UI.Fonts.Rubik)

type ModalProps = {
    Text: string,
    Accent: Color3,

    children: any?,
}

function Modal(props: ModalProps)
    local h, s, v = Color3.toHSV(props.Accent)
    local AccentSecondary = Color3.fromHSV(
        h,
        math.max(s * 0.45, 0),
        math.min(v + (1 - v) * 0.75, 1)
    )

    return React.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
    }, {
        Background = React.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = props.Accent,
        }, {
            Pattern = React.createElement("ImageLabel", {
                Image = "rbxassetid://94975287138341",
                Size = UDim2.new(1, 0, 1, 0),
                ScaleType = Enum.ScaleType.Tile,
                TileSize = UDim2.new(0, 24, 0, 24),
                BackgroundTransparency = 1,
                ImageTransparency = 0.5,
            }, {
                Radius = React.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 40),
                }),
            }),

            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, 40),
            }),
        }),

        Content = React.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
        }, {
            InnerContent = React.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY,
                Size = UDim2.new(1, 0, 1, 0),

                BackgroundColor3 = Color3.new(1,1,1)
            }, {
                InnerShadow = React.createElement("ImageLabel", {
                    Image = "rbxassetid://108630113994334",
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1
                }, {
                    Radius = React.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 30),
                    }),
                }),

                Pattern = React.createElement("ImageLabel", {
                    Image = "rbxassetid://140423808725753",
                    Size = UDim2.new(1, 0, 1, 0),
                    ScaleType = Enum.ScaleType.Tile,
                    TileSize = UDim2.new(0, 16, 0, 16),

                    ImageTransparency = 0.25,
                    BackgroundTransparency = 1,
                }, {
                    Radius = React.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 30),
                    }),

                    Gradient = React.createElement("UIGradient", {
                        Color = ColorSequence.new{
                            ColorSequenceKeypoint.new(0, AccentSecondary),
                            ColorSequenceKeypoint.new(1, Color3.new(1,1,1)),
                        },
                        Transparency = NumberSequence.new{
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.75, 1),
                            NumberSequenceKeypoint.new(1, 1),
                        },
                        Rotation = -90,
                    }),
                }),
                
                Radius = React.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 30),
                }),

                Gradient = React.createElement("UIGradient", {
                    Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, AccentSecondary),
                        ColorSequenceKeypoint.new(1, Color3.new(1,1,1)),
                    },
                    Rotation = 90,
                }),
            }, {
                props.children
            }),

            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12),
                PaddingBottom = UDim.new(0, 24),
                PaddingRight = UDim.new(0, 12),
                PaddingLeft = UDim.new(0, 12),
            }),

            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, 30),
            }),
        }),

        Heading = React.createElement("Frame", {
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.05, 0.05),
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
        }, {
            Text = React.createElement("TextLabel", {
                ZIndex = 2,
                AutomaticSize = Enum.AutomaticSize.XY,
                FontFace = Rubik.Bold,
                Text = props.Text,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 100,

                Rotation = -5,
                BackgroundTransparency = 1,
            }, {
                Stroke = React.createElement("UIStroke", {
                    Thickness = 6,
                    Color = Color3.fromRGB(0,0,0),
                }),

                UIGradient = React.createElement("UIGradient", {
                    Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),
                        ColorSequenceKeypoint.new(1, AccentSecondary),
                    },
                    Rotation = 90,
                }),
            }),

            DropText = React.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY,
                Position = UDim2.new(0, -5, 0, 10),
                FontFace = Rubik.Bold,
                Text = props.Text,
                TextColor3 = Color3.new(0,0,0),
                TextSize = 100,

                Rotation = -5,
                BackgroundTransparency = 1,
            }, {
                Stroke = React.createElement("UIStroke", {
                    Thickness = 6,
                    Color = Color3.fromRGB(0,0,0),
                }),
            }),

            Scale = React.createElement("UIScale", {
                Scale = 1.25,
            }),
        }),

        Radius = React.createElement("UICorner", {
            CornerRadius = UDim.new(0, 50),
        }),
    })
end

return Modal