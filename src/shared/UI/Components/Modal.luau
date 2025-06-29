--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

type ModalProps = {
    accentPrimary: Color3,
    accentSecondary: Color3,
    -- "#FEC752"
}

function Modal(props: ModalProps)
    return React.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 1, 0),

        BackgroundTransparency = 1,
    }, {
        Background = React.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = props.accentPrimary,
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
                Radius = React.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 30),
                }),

                Pattern = React.createElement("ImageLabel", {
                    Image = "rbxassetid://140423808725753",
                    Size = UDim2.new(1, 0, 1, 0),
                    ScaleType = Enum.ScaleType.Tile,
                    TileSize = UDim2.new(0, 16, 0, 16),
                    BackgroundTransparency = 1,

                    ImageColor3 = props.accentSecondary,
                }, {
                    Radius = React.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 30),
                    }),
                }),

                Gradient = React.createElement("UIGradient", {
                    Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, props.accentSecondary),
                        ColorSequenceKeypoint.new(1, Color3.new(1,1,1)),
                    },
                    Rotation = 90,
                }),
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
    })
end

return Modal