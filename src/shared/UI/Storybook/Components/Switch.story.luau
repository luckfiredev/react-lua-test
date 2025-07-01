--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Switch = require(ReplicatedStorage.Shared.UI.Components.Switch)

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    story = function(props)
        return React.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),

            BackgroundTransparency = 1,
        }, {
            Switch = React.createElement(Switch, {
                Toggled = false,
            }),
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
}

return story