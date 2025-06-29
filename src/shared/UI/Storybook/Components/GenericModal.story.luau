--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Modal = require(ReplicatedStorage.Shared.UI.Components.Modal)

local controls = {
    Accent = Color3.fromHex("#FEC752"),
}

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    controls = controls,
    story = function(props)
        return React.createElement(Modal, {
            accent = props.controls.Accent,
        })
    end
}

return story