--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Gamepass = require(ReplicatedStorage.Shared.UI.Components.Gamepass)

local controls = {
    ProductId = 965978158,

    GradientTop = Color3.fromHex("#fe8c00"),
    GradientBottom = Color3.fromHex("#fe0000"),
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
                React.createElement(Gamepass, {
                    ProductId = props.controls.ProductId,

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