--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Shared.Packages["react-roblox"])
local Spr = require(ReplicatedStorage.Shared.Packages.spr)

local useRef, useEffect = React.useRef, React.useEffect

local Background = require(ReplicatedStorage.UI.Components.Background)

local controls = {
    GradientLeft = Color3.fromHex("#1A85FF"),
    GradientRight = Color3.fromHex("#0FB7FF"),
}

function GenerateBackground(props)
    local BackgroundRef = useRef(nil)

    useEffect(function()
        if not BackgroundRef.current then
            return
        end

        Spr.target(BackgroundRef.current, 1, 2.5, {
            BackgroundTransparency = 0.5,
        })

        Spr.target(BackgroundRef.current.Pattern, 1, 2.5, {
            ImageTransparency = 0.75,
        })
    end, {})

    return React.createElement(Background, {
        GradientLeft = props.GradientLeft,
        GradientRight = props.GradientRight,

        ref = BackgroundRef,
    })
end

local story = {
    react = React,
    reactRoblox = ReactRoblox,
    controls = controls,
    story = function(props)
        return React.createElement(GenerateBackground, props.controls)
    end
}

return story