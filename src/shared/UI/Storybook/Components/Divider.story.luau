--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Divider = require(ReplicatedStorage.Shared.UI.Components.Divider)

local controls = {
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
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
        }, {
            VerticalDivider = React.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 24),
                BackgroundTransparency = 1,
            }, {
                Divider = React.createElement(Divider, {
                    Rotation = "Vertical",
                    Accent = props.controls.Accent,
                }),
            }),

            VerticalDividerCustomWidth = React.createElement("Frame", {
                Size = UDim2.new(0.5, 0, 0, 24),
                BackgroundTransparency = 1,
            }, {
                Divider = React.createElement(Divider, {
                    Rotation = "Vertical",
                    Accent = props.controls.Accent,
                }),
            }),

            Layout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
        })
    end
}

return story