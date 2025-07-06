--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

local SidebarItem = require(ReplicatedStorage.UI.Components.SidebarItem)
local Shop = require(ReplicatedStorage.UI.Popups.Shop)
local Settings = require(ReplicatedStorage.UI.Popups.Settings)

local useState = React.useState

local PopupType = {
    None = nil,
    Shop = "Shop",
    Settings = "Settings",
}

type Popups = "Shop" | "Settings"

function MainLayout()
    local OpenedPopup, SetOpenPopup = useState(nil :: Popups?)

    return React.createElement(React.Fragment, {}, {
        Sidebar = React.createElement("Frame", {
            ZIndex = 2,
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.new(0, 0, 1, 0),
            Position = UDim2.new(0, 30, 0, 0),
            BackgroundTransparency = 1,
        }, {
            A_Rewards = React.createElement(SidebarItem, {
                Text = "REWARDS",
                IconId = "113088492002220",
            }),

            Shop = React.createElement(SidebarItem, {
                Text = "SHOP",
                IconId = "96289885105455",

                OnClick = function ()
                    if OpenedPopup then
                        return
                    end

                    SetOpenPopup(PopupType.Shop :: Popups)
                end,
            }),

            Rebirth = React.createElement(SidebarItem, {
                Text = "REBIRTH",
                IconId = "116423965217269",
            }),

            D_Settings = React.createElement(SidebarItem, {
                Text = "SETTINGS",
                IconId = "72912048671835",
                OnClick = function ()
                    if OpenedPopup then
                        return
                    end

                    SetOpenPopup(PopupType.Settings :: Popups)
                end,
            }),

            Layout = React.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 25),
            }),
        }),

        Shop = OpenedPopup == PopupType.Shop and
            React.createElement(Shop, {
                OnClose = function()
                    SetOpenPopup(nil :: Popups?)
                end,
            }),

        Settings = OpenedPopup == PopupType.Settings and
            React.createElement(Settings, {
                OnClose = function()
                    SetOpenPopup(nil :: Popups?)
                end,
            }),
    })
end

return MainLayout