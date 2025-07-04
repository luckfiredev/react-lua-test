--!strict
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local Spr = require(ReplicatedStorage.Shared.Packages.spr)

local useEffect, useRef = React.useEffect, React.useRef

local Rubik = require(ReplicatedStorage.Fonts.Rubik)
local UIScale = require(ReplicatedStorage.UI.Components.UIScale)
local Background = require(ReplicatedStorage.UI.Components.Background)
local Modal = require(ReplicatedStorage.UI.Components.Modal)
local Divider = require(ReplicatedStorage.UI.Components.Divider)
local Gamepass = require(ReplicatedStorage.UI.Components.Gamepass)

local Sound = require(ReplicatedStorage.Utility.Sound)

local shopItems: { Gamepass.GamepassProps } = { 
    {
        ProductId = 965978158,

        GradientTop = Color3.fromHex("#fe8c00"),
        GradientBottom = Color3.fromHex("#fe0000"),

        Purchased = false,
        Giftable = false,

        OnPurchase = function()
        end,
        OnGift = function()
        end,
    },
    {
        ProductId = 880675418,

        GradientTop = Color3.fromHex("#fe00fe"),
        GradientBottom = Color3.fromHex("#5000fe"),

        Purchased = true,
        Giftable = true,

        OnPurchase = function()
        end,
        OnGift = function()
        end,
    },
    {
        ProductId = 270896353,

        GradientTop = Color3.fromHex("#fe0000"),
        GradientBottom = Color3.fromHex("#fecb00"),

        Purchased = true,
        Giftable = false,

        OnPurchase = function()
        end,
        OnGift = function()
        end,
    },
    {
        ProductId = 854422625,

        GradientTop = Color3.fromHex("#00fe6a"),
        GradientBottom = Color3.fromHex("#32ce13"),

        Purchased = false,
        Giftable = true,

        OnPurchase = function()
        end,
        OnGift = function()
        end,
    },
    {
        ProductId = 962559337,

        GradientTop = Color3.fromHex("#00a5fe"),
        GradientBottom = Color3.fromHex("#2913ce"),

        Purchased = false,
        Giftable = true,

        OnPurchase = function()
        end,
        OnGift = function()
        end,
    },
    {
        ProductId = 139868048,

        GradientTop = Color3.fromHex("#cb00fe"),
        GradientBottom = Color3.fromHex("#ff0073"),

        Purchased = false,
        Giftable = true,

        OnPurchase = function()
        end,
        OnGift = function()
        end,
    },
    {
        ProductId = 107966795,

        GradientTop = Color3.fromHex("#fef600"),
        GradientBottom = Color3.fromHex("#ffad0a"),

        Purchased = false,
        Giftable = true,

        OnPurchase = function()
        end,
        OnGift = function()
        end,
    },
}

type CatgegoryProps = {
    Title: string,
    Icon: string,

    Items: { Gamepass.GamepassProps },

    LastChild: boolean,
}

function Category(props: CatgegoryProps)
    local Items = {}
    for _, item in ipairs(props.Items) do
        table.insert(Items, React.createElement(Gamepass, item))
    end

    return React.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
    }, {
        Heading = React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 50),
            BackgroundTransparency = 1,
        }, {
            Icon = React.createElement("ImageLabel", {
                Image = props.Icon,
                Size = UDim2.new(0, 50, 0, 50),
                BackgroundTransparency = 1,
            }),

            Text = React.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                FontFace = Rubik.ExtraBold,
                Text = "Boosts",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 48,

                BackgroundTransparency = 1,
            }, {
                Stroke = React.createElement("UIStroke", {
                    Thickness = 4,
                    Color = Color3.fromRGB(0,0,0),
                }),
            }),

            Layout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 5),
            }),

            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 2),
            }),
        }),

        Items = React.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1,
        }, {
            React.createElement(React.Fragment, {}, Items),

            ContentDivider = not props.LastChild and React.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.new(0, 32, 1, -10),
                BackgroundTransparency = 1,
            }, {
                Divider = React.createElement(Divider, {
                    Vertical = true,
                    Accent = Color3.fromHex("#FEC752"),
                }),

                Padding = React.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, 10),
                    PaddingLeft = UDim.new(0, 10),
                }),
            }),

            Layout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Padding = UDim.new(0, 15),
            }),

            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 20),
                PaddingRight = UDim.new(0, 3),
                PaddingLeft = UDim.new(0, 3),
            }),
        }),
    })
end

type ShopProps = {
    OnClose: () -> (),
}

function Shop(props: ShopProps)
    local ShopRef = useRef(nil)
    local BackgroundRef = useRef(nil)

    local Blur = Instance.new("BlurEffect")

    local Items = {}
    for _, item in ipairs(shopItems) do
        table.insert(Items, React.createElement(Gamepass, item))
    end

    useEffect(function()
        if not BackgroundRef.current or not ShopRef.current then
            return
        end

        Blur.Parent = Lighting
        Spr.target(Blur, 0.75, 2.5, {
            Size = 50,
        })

        Spr.target(BackgroundRef.current, 1, 2.5, {
            BackgroundTransparency = 0.5,
        })

        Spr.target(BackgroundRef.current.Pattern, 1, 2.5, {
            ImageTransparency = 0.75,
        })
        
        Spr.target(ShopRef.current, 0.75, 2.5, {
            Position = UDim2.new(0.5, 0, 0.5, 0),
        })

        Sound:PlaySound({
            Id = "8382337318",
            Volume = 0.5,
        })

        return function()
            Blur:Destroy()
        end
    end, {})

    local HandleClose = function()
        if not BackgroundRef.current or not ShopRef.current then
            return
        end

        Spr.target(Blur, 1, 2.5, {
            Size = 0,
        })

        Spr.target(BackgroundRef.current, 1, 2.5, {
            BackgroundTransparency = 1,
        })

        Spr.target(BackgroundRef.current.Pattern, 1, 2.5, {
            ImageTransparency = 1,
        })

        Spr.target(ShopRef.current, 1, 2.5, {
            Position = UDim2.new(0.5, 0, -2, 0),
        })

        if props.OnClose then
            task.delay(0.25, props.OnClose)
        end
    end

    return React.createElement(React.Fragment, {}, {
        Shop = React.createElement("Frame", {
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 2, 0),
            Size = UDim2.new(0, 1200, 0, 650),
            BackgroundTransparency = 1,

            ref = ShopRef,
        }, {
            Modal = React.createElement(Modal, {
                Text = "SHOP",
                Accent = Color3.fromHex("#FEC752"),

                OnClose = HandleClose,
            }, {
                SpecialHeadingImage = React.createElement("ImageLabel", {
                    ZIndex = 2,
                    Position = UDim2.new(0, -195, 0, -150),
                    Size = UDim2.new(0, 500, 0, 312),
                    Image = "rbxassetid://85482605299777",
                    BackgroundTransparency = 1,
                    Rotation = -5
                }),

                Content = React.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                }, {
                    HeadingDivider = React.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY,
                        Size = UDim2.new(1, -25, 0, 32),
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
                            PaddingLeft = UDim.new(0, 182),
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

                        TopImage = "rbxassetid://95060122767444",
                        MidImage = "rbxassetid://107549054916235",
                        BottomImage = "rbxassetid://106610897877102",
                    }, {
                        Boosts = React.createElement(Category, {
                            Title = "Boosts",
                            Icon = "rbxassetid://79399947545310",
                            Items = shopItems,
                            LastChild = true,
                        }),

                        Layout = React.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder,
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
                        PaddingBottom = UDim.new(0, 35+24+8),
                        PaddingLeft = UDim.new(0, 35),
                    }),
                }),

                SizeConstraint = React.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(1200, 650),
                }),
            }),
        
            UIScale = React.createElement(UIScale, {
                MobileScaleMultiplier = 1.5,
            }),
        }),
        
        Background = React.createElement(Background, {
            GradientLeft = Color3.fromHex("#BA24FF"),
            GradientRight = Color3.fromHex("#FFA82F"),

            ref = BackgroundRef,
        }),
    })
end

return Shop