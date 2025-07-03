--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local UIScale = require(ReplicatedStorage.UI.Components.UIScale)

local Shop = require(ReplicatedStorage.UI.Interfaces.Shop)
local Switch = require(ReplicatedStorage.UI.Components.Switch)

local handle = Instance.new("ScreenGui",Players.LocalPlayer.PlayerGui)
handle.IgnoreGuiInset = true

local CreateSwitch = function()
    local IsToggled, SetToggled = React.useState(false)

    return React.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 1,
    }, {
        Switch = React.createElement(Switch, {
            Toggled = IsToggled,
            OnToggle = function()
                SetToggled(not IsToggled)
            end,
        }),
    }, {
        LayoutOrder = React.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 10),
        }),

        Scale = React.createElement(UIScale, {
            MobileScaleMultiplier = 1.5,
        }),
    })
end

local root = ReactRoblox.createRoot(handle)
root:render(React.createElement(CreateSwitch, {}, {}))