--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Sidebar = require(ReplicatedStorage.UI.Components.Sidebar)

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    story = function(props)
        return React.createElement(Sidebar)
    end
}

return story