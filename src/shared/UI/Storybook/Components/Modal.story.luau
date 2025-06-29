--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Modal = require(ReplicatedStorage.Shared.UI.Components.Modal)

local controls = {
    AccentPrimary = Color3.fromHex("#FEC752"),
    AccentSecondary = Color3.fromHex("#FFF0D0"),
}

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    controls = controls,
    story = function(props)
        return React.createElement(Modal, {
            accentPrimary = props.controls.AccentPrimary,
            accentSecondary = props.controls.AccentSecondary,
        })
    end
}

return story