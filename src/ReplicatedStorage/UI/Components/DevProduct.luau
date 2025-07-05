--!strict

local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local Format = require(ReplicatedStorage.Utility.Format)

local useState, useEffect = React.useState, React.useEffect

local Button = require(ReplicatedStorage.UI.Components.Button)
local Rubik = require(ReplicatedStorage.Fonts.Rubik)

export type DevProductProps = {
    ProductId: number,

    GradientTop: Color3,
    GradientBottom: Color3,

    Purchased: boolean,
    Giftable: boolean,
    OnPurchase: () -> (),
    OnGift: () -> (),
}

local function DevProduct(props: DevProductProps)
    local ProductInfo, SetProductInfo = useState(nil :: any?)

    local Size = Vector2.new(320, 160)
    local Rounding = 20

    useEffect(function()
        local success, err = pcall(function()
            SetProductInfo(MarketplaceService:GetProductInfo(props.ProductId, Enum.InfoType.Product))
        end)

        if not success then
            warn(err)
        end
    end, {})


    local function HandlePurchase()
        if props.Purchased or not props.OnPurchase then
            return
        end

        props.OnPurchase()
    end

    return ProductInfo and React.createElement("Frame", {
        Size = UDim2.new(0, Size.X, 0, Size.Y+36),
        BackgroundTransparency = 1,
    }, {
        Content = React.createElement("Frame", {
            Size = UDim2.new(0, Size.X, 0, Size.Y),
            BackgroundColor3 = Color3.new(1,1,1),
        }, {
            ProductDetails = React.createElement("Frame", {
                ZIndex = 2,
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
            }, {
                Name = React.createElement("TextLabel", {
                    ZIndex = 2,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Size = UDim2.new(1, 0, 0, 0),

                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    
                    FontFace = Rubik.Bold,
                    Text = ProductInfo.Name,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 34,

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

            Icon = React.createElement("ImageLabel", {
                ZIndex = 1,
                Position = UDim2.new(0.25, 0, 0, 0),
                Size = UDim2.new(0, Size.Y, 0, Size.Y),
                Image = "rbxassetid://" .. ProductInfo.IconImageAssetId,
                ImageTransparency = 0.5,
                BackgroundTransparency = 1,
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
            Position = UDim2.new(0, -3, 0, Size.Y-36),
            Size = UDim2.new(1, 6, 0, 72),
            BackgroundTransparency = 1,
        }, {
            PurchasedButton = React.createElement("Frame", {
                ZIndex = 2,
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
            }, {
                CanPurchase = not props.Purchased and React.createElement(Button, {
                    Size = UDim2.new(1, 30, 1, 0),
                    Icon = "rbxassetid://124876235625151",
                    Text = Format:Number(ProductInfo.PriceInRobux),
                    GradientLeft = Color3.fromHex("#1AFFAF"),
                    GradientRight = Color3.fromHex("#3FFF0F"),
                    OnClick = HandlePurchase,
                }),

                Owned = props.Purchased and React.createElement(Button, {
                    Disabled = true,
                    Size = UDim2.new(1, 30, 1, 0) ,
                    Text = "OWNED",
                    GradientLeft = Color3.fromHex("#CFCFCF"),
                    GradientRight = Color3.fromHex("#717171"),
                }),
            }),

            GiftButton = React.createElement("Frame", {
                ZIndex = 2,
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
            }, {
                GiftEnabled = props.Giftable and React.createElement(Button, {
                    Icon = "rbxassetid://91578590125441",
                    GradientLeft = Color3.fromHex("#941AFF"),
                    GradientRight = Color3.fromHex("#FF0FB7"),
                    OnClick = HandlePurchase,
                }),

                GiftDisabled = not props.Giftable and React.createElement(Button, {
                    Disabled = true,
                    Icon = "rbxassetid://91578590125441",
                    GradientLeft = Color3.fromHex("#CFCFCF"),
                    GradientRight = Color3.fromHex("#717171"),
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
            }),
        })
    })
end

return DevProduct