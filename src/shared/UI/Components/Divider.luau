--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)

type DividerProps = {
    Rotation: "Horizontal" | "Vertical",
    Accent: Color3,
}

function Divider(props)
    return React.createElement("ImageLabel", {
        Size = UDim2.new(1, 0, 0, 24),
        Image = "rbxassetid://130173825949601",
        ImageColor3 = props.Accent,
        ScaleType = Enum.ScaleType.Tile,
        TileSize = UDim2.new(0, 72, 0, 24),
        BackgroundTransparency = 1,

        Rotation = props.Position == "Horizontal" and 90 or 0,
    })
end

return Divider