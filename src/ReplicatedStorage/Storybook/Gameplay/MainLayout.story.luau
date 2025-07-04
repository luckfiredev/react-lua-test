--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local MainLayout = require(ReplicatedStorage.UI.Gameplay.MainLayout)

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    story = function(props)
        return React.createElement(MainLayout)
    end
}

return story