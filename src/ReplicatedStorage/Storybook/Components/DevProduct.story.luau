--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local DevProduct = require(ReplicatedStorage.UI.Components.DevProduct)

local controls = {
    ProductId = 1573206663,

    GradientTop = Color3.fromHex("#00FE00"),
    GradientBottom = Color3.fromHex("#006EFE"),

    Purchased = false,
    Giftable = false,
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
                React.createElement(DevProduct, props.controls)
            })
        })
    end
}

return story