--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

local UIScale = require(ReplicatedStorage.Shared.UI.Components.UIScale)

type ModalProps = {
    accent: Color3,
    children: any?,
}

function Modal(props: ModalProps)
    local Size = Vector2.new(1200, 650)

    local h, s, v = Color3.toHSV(props.accent)
    local AccentSecondary = Color3.fromHSV(
        h,
        math.max(s * 0.45, 0),
        math.min(v + (1 - v) * 0.75, 1)
    )

    return React.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, Size.X, 0, Size.Y),

        BackgroundTransparency = 1,
    }, {
        Background = React.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = props.accent,
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
                Pattern = React.createElement("ImageLabel", {
                    Image = "rbxassetid://140423808725753",
                    Size = UDim2.new(1, 0, 1, 0),
                    ScaleType = Enum.ScaleType.Tile,
                    TileSize = UDim2.new(0, 16, 0, 16),
                    BackgroundTransparency = 1,

                    ImageColor3 = AccentSecondary,
                }, {
                    Radius = React.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 30),
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

            InnerShadow = React.createElement("ImageLabel", {
                ZIndex = 100,
                Image = "rbxassetid://108630113994334",
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1
            }, {
                Radius = React.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 30),
                }),
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

        Radius = React.createElement("UICorner", {
            CornerRadius = UDim.new(0, 50),
        }),

        UIScale = React.createElement(UIScale, {
            MobileScaleMultiplier = 15,
        }),
    })
end

return Modal