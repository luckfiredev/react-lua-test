--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Modal = require(ReplicatedStorage.UI.Components.Modal)
local UIScale = require(ReplicatedStorage.UI.Components.UIScale)

local controls = {
    Text = "EXAMPLE",
    Accent = Color3.fromHex("#FEC752"),
}

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    controls = controls,
    story = function(props)
        return React.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0, 1200, 0, 650),
            BackgroundTransparency = 1,
        }, {
            Modal = React.createElement(Modal, {
                Text = props.controls.Text,
                Accent = props.controls.Accent,
            }),

            UIScale = React.createElement(UIScale, {
                MobileScaleMultiplier = 1.5,
            }),
        })
    end
}

return story