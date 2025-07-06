--!strict

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local Spr = require(ReplicatedStorage.Shared.Packages.spr)

local useEffect, useRef = React.useEffect, React.useRef

local Background = require(ReplicatedStorage.UI.Components.Background)
local Modal = require(ReplicatedStorage.UI.Components.Modal)
local UIScale = require(ReplicatedStorage.UI.Components.UIScale)

type SettingsProps = {
    OnClose: () -> (),
}

function Settings(props: SettingsProps)
    local SettingsRef = useRef(nil)
    local BackgroundRef = useRef(nil)

    local Blur = Instance.new("BlurEffect")

    useEffect(function()
        if not BackgroundRef.current or not SettingsRef.current then
            return
        end

        Blur.Parent = Lighting
        Spr.target(Blur, 0.75, 2.5, {
            Size = 50,
        })

        Spr.target(BackgroundRef.current, 1, 2.5, {
            BackgroundTransparency = 0.5,
        })

        Spr.target(BackgroundRef.current.Pattern, 1, 2.5, {
            ImageTransparency = 0.75,
        })

        Spr.target(SettingsRef.current, 0.75, 2.5, {
            Position = UDim2.new(0.5, 0, 0.5, 0),
        })

        return function()
            Blur:Destroy()
        end
    end, {})

    local HandleClose = function()
        if not BackgroundRef.current or not SettingsRef.current then
            return
        end

        Spr.target(Blur, 1, 2.5, {
            Size = 0,
        })

        Spr.target(BackgroundRef.current, 1, 2.5, {
            BackgroundTransparency = 1,
        })

        Spr.target(BackgroundRef.current.Pattern, 1, 2.5, {
            ImageTransparency = 1,
        })

        Spr.target(SettingsRef.current, 1, 2.5, {
            Position = UDim2.new(0.5, 0, -2, 0),
        })

        if props.OnClose then
            task.delay(0.25, props.OnClose)
        end
    end

    return React.createElement(React.Fragment, {}, {
        Settings = React.createElement("Frame", {
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 2, 0),
            Size = UDim2.new(0, 1200, 0, 650),
            BackgroundTransparency = 1,

            ref = SettingsRef,
        }, {
            Modal = React.createElement(Modal, {
                Text = "SETTINGS",
                Accent = Color3.fromHex("#0077FF"),

                OnClose = HandleClose,
            }, {
                SizeConstraint = React.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(800, 650),
                }),
            }),

            UIScale = React.createElement(UIScale, {
                MobileScaleMultiplier = 1.5,
            }),

            Layout = React.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 25),
            }),
        }),

        Background = React.createElement(Background, {
            GradientLeft = Color3.fromHex("#242bf0"),
            GradientRight = Color3.fromHex("#2495ff"),

            ref = BackgroundRef,
        }),
    })
end

return Settings