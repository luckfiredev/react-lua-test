--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PreferredInput = game:GetService("PreferredInput")
local React = require(ReplicatedStorage.Shared.Packages.react)

local useEffect = React.useEffect

type UIScaleProps = {
    MobileScaleMultiplier: number?,
}

function GetScale()
    local Camera = workspace.CurrentCamera
    if not Camera then
        return 1
    end

    return math.min(Camera.ViewportSize.Y / 1080, 1)
end

function UIScale(props: UIScaleProps)
    local UIScaleRef = React.useRef(nil)
    local Multiplier = 1

    if PreferredInput == Enum.PreferredInput.Touch and props.MobileScaleMultiplier then
        Multiplier = props.MobileScaleMultiplier
    end

    useEffect(function()
        local Camera = workspace.CurrentCamera
        if not Camera or not UIScaleRef.current then
            return
        end

        local PropertyChanged = Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function ()
            UIScaleRef.current.Scale = GetScale() * Multiplier
        end)

        return function()
            PropertyChanged:Disconnect()
        end
    end, {})

    return React.createElement("UIScale", {
        Scale = GetScale() * Multiplier,

        ref = UIScaleRef,
    })
end

return UIScale