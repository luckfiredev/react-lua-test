--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

local SidebarItem = require(ReplicatedStorage.UI.Components.SidebarItem)

type SidebarProps = {
    ShopOpen: () -> (),
}

function Sidebar(props: SidebarProps)
    return React.createElement("Frame", {
        ZIndex = 100,
        AutomaticSize = Enum.AutomaticSize.XY,
        Size = UDim2.new(0, 0, 1, 0),
        Position = UDim2.new(0, 30, 0, 0),
        BackgroundTransparency = 1,
    }, {
        Shop = React.createElement(SidebarItem, {
            Text = "SHOP",
            IconId = "96289885105455",

            OnClick = props.ShopOpen,
        }),

        -- Settings = React.createElement(SidebarItem, {
        --     Text = "SETTINGS",
        --     IconId = "72912048671835",
        -- }),

        Layout = React.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 25),
        }),
    })
end

return Sidebar