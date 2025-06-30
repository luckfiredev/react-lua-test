local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

local Rubik = require(ReplicatedStorage.Shared.UI.Fonts.Rubik)
local UIScale = require(ReplicatedStorage.Shared.UI.Components.UIScale)
local Background = require(ReplicatedStorage.Shared.UI.Components.Background)
local Modal = require(ReplicatedStorage.Shared.UI.Components.Modal)
local Divider = require(ReplicatedStorage.Shared.UI.Components.Divider)
local ShopCardItem = require(ReplicatedStorage.Shared.UI.Components.ShopCardItem)

local shopItems: { ShopCardItem.ShopCardItemProps } = { 
    {
        ProductName = "x2 Cash",
        ProductDescription = "Obtain double the currency to upgrade your tycoon faster!\n* Does not apply to cash purchases.",
        ProductPrice = 9999,

        GradientTop = Color3.fromHex("#00FE00"),
        GradientBottom = Color3.fromHex("#0FB7FF"),

        Purchased = false,
        Giftable = true,
        OnPurchase = function(setPurchased)
            -- setPurchased(true)
        end,
        OnGift = function()
            print("Gift")
        end,
    },
    {
        ProductName = "Auto Rebirth",
        ProductDescription = "Automatically rebirth when you hit the requirements.\n* Toggleable in Rebirth Menu & Settings.",
        ProductPrice = 9999,

        GradientTop = Color3.fromHex("#FF41AC"),
        GradientBottom = Color3.fromHex("#FE8C00"),

        Purchased = false,
        Giftable = true,
        OnPurchase = function(setPurchased)
            -- setPurchased(true)
        end,
        OnGift = function()
            print("Gift")
        end,
    }
}

function Shop()
    local Items = {}
    for _, item in ipairs(shopItems) do
        table.insert(Items, React.createElement(ShopCardItem, item))
    end

    local Test =  React.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
    }, {
        Heading = React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 38),
            BackgroundTransparency = 1,
        }, {
            Text = React.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                FontFace = Rubik.Bold,
                Text = "Boosts",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 38,

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
        }),

        Items = React.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1,
        }, {
            React.createElement(React.Fragment, {}, Items),
            -- React.createElement(React.Fragment, {}, Items, Items, Items),

            Layout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Padding = UDim.new(0, 10),
            }),

            Padding = React.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 3),
                PaddingLeft = UDim.new(0, 3),
            }),
        }),
    })

    return React.createElement(React.Fragment, {}, {
        Shop = React.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0, 1200, 0, 650),
            BackgroundTransparency = 1,
        }, {
            Modal = React.createElement(Modal, {
                accent = Color3.fromHex("#FEC752"),
            }, {
                Content = React.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                }, {
                    HeadingDivider = React.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY,
                        Size = UDim2.new(0, 993, 0, 24),
                        BackgroundTransparency = 1,
                    }, {
                        Divider = React.createElement(Divider, {
                            Rotation = "Horizontal",
                            Accent = Color3.fromHex("#FEC752"),
                        }),

                        FlexItem = React.createElement("UIFlexItem", {
                            FlexMode = Enum.UIFlexMode.None
                        }),

                        Padding = React.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, 35),
                            PaddingBottom = UDim.new(0, 35),
                        }),
                    }),

                    ShopContent = React.createElement("ScrollingFrame", {
                        Size = UDim2.new(1, 0, 1, 0),
                        AutomaticCanvasSize = Enum.AutomaticSize.X,
                        ScrollingDirection = Enum.ScrollingDirection.X,

                        BorderSizePixel = 0,

                        ScrollBarThickness = 10,
                        ScrollBarImageColor3 = Color3.fromHex("#FEC752"),
                        ScrollBarImageTransparency = 0,
                        BackgroundTransparency = 1,

                        TopImage = "rbxassetid://11054259844",
                        MidImage = "rbxassetid://11054259460",
                        BottomImage = "rbxassetid://11054260159",

                        ClipsDescendants = true,
                    }, {
                        Boosts = Test,

                        -- ContentDivider = React.createElement("Frame", {
                        --     Size = UDim2.new(1, 0, 0, 24),
                        -- }, {
                        --     Divider = React.createElement(Divider, {
                        --         Rotation = "Horizontal",
                        --         Accent = Color3.fromHex("#FEC752"),
                        --     }),
                        -- }),

                        Boosts2 = Test,

                        Layout = React.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            Padding = UDim.new(0, 10),
                        }),
                    }),

                    Layout = React.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    }),

                    Padding = React.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 35),
                        PaddingRight = UDim.new(0, 35),
                        PaddingBottom = UDim.new(0, 35+24+25),
                        PaddingLeft = UDim.new(0, 35),
                    }),
                }),

                SizeConstraint = React.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(1200, 650),
                }),
            }),
        
            UIScale = React.createElement(UIScale, {
                MobileScaleMultiplier = 15,
            }),
        }),
        
        -- Background = React.createElement(Background, {
        --     GradientLeft = Color3.fromHex("#BA24FF"),
        --     GradientRight = Color3.fromHex("#FFA82F"),
        -- }),
    })
end

return Shop