--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

type DividerProps = {
    Vertical: boolean?,
    Accent: Color3,
}

function Divider(props)
    return React.createElement("ImageLabel", {
        Size = not props.Vertical and UDim2.new(1, 0, 0, 24) or UDim2.new(0, 24, 1, 0),
        Image = "rbxassetid://" .. tostring(not props.Vertical and "129751566506714" or "75505023015533"),
        ImageColor3 = props.Accent,
        ScaleType = Enum.ScaleType.Tile,
        TileSize = UDim2.new(0, 32, 0, 32),
        BackgroundTransparency = 1,
    })
end

return Divider