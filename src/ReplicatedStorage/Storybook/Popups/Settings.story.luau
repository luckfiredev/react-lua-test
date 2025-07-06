--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Settings = require(ReplicatedStorage.UI.Popups.Settings)

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    story = function(props)
        return React.createElement(Settings)
    end
}

return story