--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Shop = require(ReplicatedStorage.Shared.UI.Interfaces.Shop)

local handle = Instance.new("ScreenGui",Players.LocalPlayer.PlayerGui)
handle.IgnoreGuiInset = true

local root = ReactRoblox.createRoot(handle)
root:render(React.createElement(Shop, {}, {}))