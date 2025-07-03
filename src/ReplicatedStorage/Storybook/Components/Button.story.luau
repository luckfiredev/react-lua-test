--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])

local Button = require(ReplicatedStorage.UI.Components.Button)

function PurpleCounterButton()
    local count, setCount = React.useState(0)

    return React.createElement(Button, {
        Text = tostring(count),
        GradientLeft = Color3.fromHex("#941AFF"),
        GradientRight = Color3.fromHex("#FF0FB7"),
        OnClick = function()
            setCount(count + 1)
        end
    })
end

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    story = function(props)
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
            D = React.createElement(Button, {
                Disabled = true,
                Text = "DISABLED",
                GradientLeft = Color3.fromHex("#CFCFCF"),
                GradientRight = Color3.fromHex("#717171"),
            })
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
}

return story