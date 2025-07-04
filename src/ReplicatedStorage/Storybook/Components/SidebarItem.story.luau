--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local SidebarItem = require(ReplicatedStorage.UI.Components.SidebarItem)

local controls = {
    Text = "SETTINGS",
    IconId = "72912048671835",

    HasNotice = false,
}

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    controls = controls,
    story = function(props)
        return React.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),

            BackgroundTransparency = 1,
        }, {
            SidebarItem = React.createElement(SidebarItem, {
                Text = controls.Text,
                IconId = controls.IconId,

                HasNotice = controls.HasNotice,

                OnClick = function()
                    print("Clicked")
                end
            })
        })
    end
}

return story