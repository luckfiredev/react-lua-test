--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Background = require(ReplicatedStorage.Shared.UI.Components.Background)

local controls = {
    Accent = Color3.fromHex("#FEC752"),
}

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    controls = controls,
    story = function(props)
        return React.createElement(Background, {
            GradientLeft = Color3.fromHex("#1A85FF"),
            GradientRight = Color3.fromHex("#0FB7FF"),
        })
    end
}

return story