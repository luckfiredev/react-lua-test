--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

local useState = React.useState

local Button = require(ReplicatedStorage.Shared.UI.Components.Button)
local Rubik = require(ReplicatedStorage.Shared.UI.Fonts.Rubik)

export type ShopCardItemProps = {
    ProductName: string,
    ProductDescription: string,
    ProductPrice: number,

    GradientTop: Color3,
    GradientBottom: Color3,

    Purchased: boolean,
    Giftable: boolean,
    OnPurchase: ((p: boolean) -> ()) -> (),
    OnGift: () -> (),

    children: any,
}

local function FormatNumber(num: number)
    return tostring(math.floor(num)):reverse():gsub("(%d%d%d)","%1,")
        :gsub(",(%-?)$","%1"):reverse()
end

local function ShopCardItem(props: ShopCardItemProps)
    local Size = Vector2.new(320, 400)
    local Rounding = 20

    local Purchased, SetPurchased = useState(props.Purchased)

    local function HandlePurchase()
        if Purchased then
            print("owned")
            return
        end

        props.OnPurchase(SetPurchased)
    end
    
    return React.createElement("Frame", {
        Size = UDim2.new(0, Size.X, 0, Size.Y),
        BackgroundTransparency = 1,
    }, { 
        Content = React.createElement("Frame", {
            Size = UDim2.new(0, Size.X, 0, Size.Y),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            BackgroundColor3 = Color3.new(1,1,1),
        }, {
            ProductDetails = React.createElement("Frame", {
                ZIndex = 2,
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
            }, {
                Name = React.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 36),

                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    
                    FontFace = Rubik.Bold,
                    Text = props.ProductName,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 34,

                    TextTruncate = Enum.TextTruncate.AtEnd,
                    TextWrapped = false,
                    ClipsDescendants = true,

                    BackgroundTransparency = 1,
                }, {
                    Stroke = React.createElement("UIStroke", {
                        Thickness = 2,
                        Color = Color3.fromRGB(0,0,0),
                    }),
                }),

                Description = React.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, Size.Y-80),

                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,

                    FontFace = Rubik.Medium,
                    Text = props.ProductDescription,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 30,

                    TextWrapped = true,

                    BackgroundTransparency = 1,
                }, {
                    Stroke = React.createElement("UIStroke", {
                        Thickness = 2,
                        Color = Color3.fromRGB(0,0,0),
                    }),
                }),
            }, {
                Radius = React.createElement("UICorner", {
                    CornerRadius = UDim.new(0, Rounding),
                }),

                Layout = React.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    Padding = UDim.new(0, 5),
                }),

                Padding = React.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 15),
                    PaddingLeft = UDim.new(0, 15),
                }),
            }),

            Pattern = React.createElement("ImageLabel", {
                Image = "rbxassetid://114281381530190",
                Size = UDim2.new(1, 0, 1, 0),
                ScaleType = Enum.ScaleType.Tile,
                TileSize = UDim2.new(0, 16, 0, 16),
                BackgroundTransparency = 1,
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                ImageTransparency = 0.75,
            }, {
                Radius = React.createElement("UICorner", {
                    CornerRadius = UDim.new(0, Rounding),
                }),
            }),
            Stroke = React.createElement("UIStroke", {
                Thickness = 3,
                Color = Color3.fromRGB(0,0,0),
            }),
            Radius = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, Rounding),
            }),
            Gradient = React.createElement("UIGradient", {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, props.GradientTop),
                    ColorSequenceKeypoint.new(1, props.GradientBottom),
                },
                Rotation = 75,
            }),
        }),

        Buttons = React.createElement("Frame", {
            Position = UDim2.new(0, -3, 0.915, 0),
            Size = UDim2.new(1, 6, 0, 72),
            BackgroundTransparency = 1,
        }, {
            PurchaseButton = not Purchased and React.createElement("Frame", {
                ZIndex = 2,
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
            }, {
                Button = React.createElement(Button, {
                    Size = UDim2.new(1, -3, 1, 0),
                    Icon = "rbxassetid://124876235625151",
                    Text = FormatNumber(props.ProductPrice),
                    GradientLeft = Color3.fromHex("#1AFFAF"),
                    GradientRight = Color3.fromHex("#3FFF0F"),
                    OnClick = HandlePurchase,
                }),
            }),

            GiftIconButton = props.Giftable and not Purchased and React.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
            }, {
                IconButton = React.createElement(Button, {
                    Size = UDim2.new(1, -3, 1, 0),
                    Icon = "rbxassetid://91578590125441",
                    GradientLeft = Color3.fromHex("#941AFF"),
                    GradientRight = Color3.fromHex("#FF0FB7"),
                    OnClick = props.OnGift,
                }),

                Layout = React.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                }),
            }),

            Layout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,

                Padding = UDim.new(0, 3),
            }),
        })
    })
end

return ShopCardItem