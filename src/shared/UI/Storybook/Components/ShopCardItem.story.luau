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
        return React.createElement(ShopCardItem, {
            ProductName = props.controls.ProductName,
            ProductDescription = props.controls.ProductDescription,
            ProductPrice = props.controls.ProductPrice,

            GradientTop = props.controls.GradientTop,
            GradientBottom = props.controls.GradientBottom,

            Purchased = false,
            Giftable = true,

            OnPurchase = function(setPurchased)
                -- setPurchased(true)
            end,
            OnGift = function()
                print("Gift")
            end,
        })
    end
}

return story