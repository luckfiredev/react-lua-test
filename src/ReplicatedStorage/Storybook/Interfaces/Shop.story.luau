--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Shop = require(ReplicatedStorage.UI.Interfaces.Shop)

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    story = function(props)
        return React.createElement(Shop)
    end
}

return story