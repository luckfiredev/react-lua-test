--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Modal = require(ReplicatedStorage.Shared.UI.Components.Modal)
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

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    story = function(props)
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
}

return story