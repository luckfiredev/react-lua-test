--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local ShopCardItem = require(ReplicatedStorage.Shared.UI.Components.ShopCardItem)

local controls = {
    ProductName = "Product Name",
    ProductDescription = "Product Description",
    ProductPrice = 100,

    GradientTop = Color3.fromHex("#00FE00"),
    GradientBottom = Color3.fromHex("#006EFE"),
}

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    controls = controls,
    story = function(props)
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
        }, {
            React.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1,
            }, {
                React.createElement(ShopCardItem, {
                    ProductName = props.controls.ProductName,
                    ProductDescription = props.controls.ProductDescription,
                    ProductPrice = props.controls.ProductPrice,

                    GradientTop = props.controls.GradientTop,
                    GradientBottom = props.controls.GradientBottom,

                    Purchased = false,
                    Giftable = false,

                    OnPurchase = function(setPurchased)
                    end,
                    OnGift = function()
                    end,
                })
            })
        })
    end
}

return story