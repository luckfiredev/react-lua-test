--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Switch = require(ReplicatedStorage.UI.Components.Switch)

local CreateSwitch = function()
    local IsToggled, SetToggled = React.useState(false)

    return React.createElement(Switch, {
        Toggled = IsToggled,
        OnToggle = function()
            SetToggled(not IsToggled)
        end,
    })
end

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    story = function(props)
        return React.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),

            BackgroundTransparency = 1,
        }, {
            Switch = React.createElement(CreateSwitch)
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