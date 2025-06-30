--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Button = require(ReplicatedStorage.Shared.UI.Components.Button)
local Modal = require(ReplicatedStorage.Shared.UI.Components.Modal)
local ShopCardItem = require(ReplicatedStorage.Shared.UI.Components.ShopCardItem)

function PurpleCounterButton()
    local count, setCount = React.useState(0)

    return React.createElement(Button, {
        Text = "Count: " .. count,
        GradientLeft = Color3.fromHex("#941AFF"),
        GradientRight = Color3.fromHex("#FF0FB7"),
        OnClick = function()
            setCount(count + 1)
        end
    })
end

local function _Buttons() 
    return React.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),

        BackgroundTransparency = 1,
    }, {
        B = React.createElement(Button, {
            Text = "BUTTON",
            GradientLeft = Color3.fromHex("#1A85FF"),
            GradientRight = Color3.fromHex("#0FB7FF"),
        }),
        C = React.createElement(PurpleCounterButton),
    }, {
        LayoutOrder = React.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 10),
        }),
    })
end

local function Modals()
    return React.createElement(Modal, {
        accent = Color3.fromHex("#FEC752"),
    }, {
        Content = React.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            -- BackgroundTransparency = 1,
        }, {
            ShopCardItem = React.createElement(ShopCardItem, {
                ProductName = "Product Name",
                ProductDescription = "Product Description",
                ProductPrice = 100,

                GradientTop = Color3.fromHex("#1A85FF"),
                GradientBottom = Color3.fromHex("#0FB7FF"),
                Purchased = false,
                Giftable = false,
            }),

            -- Layout = React.createElement("UIListLayout", {
            --     FillDirection = Enum.FillDirection.Vertical,
            --     SortOrder = Enum.SortOrder.LayoutOrder,
            --     VerticalAlignment = Enum.VerticalAlignment.Center,
            --     HorizontalAlignment = Enum.HorizontalAlignment.Center,
            -- }),

            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 12),
            }),
        }),
    })
end

local function Shop()
    local shopItems: { ShopCardItem.ShopCardItemProps } = { 
        {
            ProductName = "x2 Cash",
            ProductDescription = "Obtain double the currency to upgrade your tycoon faster!\n* Does not apply to cash purchases.",
            ProductPrice = 100,

            GradientTop = Color3.fromHex("#00FE00"),
            GradientBottom = Color3.fromHex("#0FB7FF"),

            Purchased = false,
            Giftable = true,
            OnPurchase = function(setPurchased)
                setPurchased(true)
            end,
            OnGift = function()
                print("Gift")
            end,
        },
        {
            ProductName = "Auto Rebirth",
            ProductDescription = "Automatically rebirth when you hit the requirements.\n* Toggleable in Rebirth Menu & Settings.",
            ProductPrice = 100,

            GradientTop = Color3.fromHex("#FF41AC"),
            GradientBottom = Color3.fromHex("#FE8C00"),

            Purchased = false,
            Giftable = true,
            OnPurchase = function(setPurchased)
                setPurchased(true)
            end,
            OnGift = function()
                print("Gift")
            end,
        }
    }

    local Items = {}
    for _, item in ipairs(shopItems) do
        table.insert(Items, React.createElement(ShopCardItem, item))
    end
    return React.createElement(Modal, {
        accent = Color3.fromHex("#FEC752"),
    }, {
        Content = React.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
        }, {
            React.createElement(React.Fragment, {}, Items),
            Layout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 10),
            }),
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 35),
            }),
        }),
    })
end

local handle = Instance.new("ScreenGui",Players.LocalPlayer.PlayerGui)
local root = ReactRoblox.createRoot(handle)
root:render(React.createElement(Shop, {}, {}))