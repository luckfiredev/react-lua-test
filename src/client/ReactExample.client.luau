--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Button = require(ReplicatedStorage.Shared.UI.Components.Button)
local Modal = require(ReplicatedStorage.Shared.UI.Components.Modal)

function PurpleCounterButton()
    local count, setCount = React.useState(0)

    return React.createElement(Button, {
        Text = "Count: " .. count,
        GradientLeft = Color3.fromHex("#941AFF"),
        GradientRight = Color3.fromHex("#FF0FB7"),
        OnClick = function()
            setCount(count + 1)
        end
    })
end

local function _Buttons() 
    return React.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),

        BackgroundTransparency = 1,
    }, {
        B = React.createElement(Button, {
            Text = "BUTTON",
            GradientLeft = Color3.fromHex("#1A85FF"),
            GradientRight = Color3.fromHex("#0FB7FF"),
        }),
        C = React.createElement(PurpleCounterButton),
    }, {
        LayoutOrder = React.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 10),
        }),
    })
end

local function Modals()
    return React.createElement(Modal, {
        accentPrimary = Color3.fromHex("#FEC752"),
        accentSecondary = Color3.fromHex("#FFF0D0"),
    })
end

local handle = Instance.new("ScreenGui",Players.LocalPlayer.PlayerGui)
local root = ReactRoblox.createRoot(handle)
root:render(React.createElement(Modals, {}, {}))