--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.Packages.react)
local Spr = require(ReplicatedStorage.Shared.Packages.spr)

local Rubik = require(ReplicatedStorage.Fonts.Rubik)
local UIScale = require(ReplicatedStorage.UI.Components.UIScale)

local Sound = require(ReplicatedStorage.Utility.Sound)

local useRef = React.useRef

type SidebarItemProps = {
    Text: string,
    IconId: string,

    HasNotice: boolean,

    OnClick: () -> (),
}

function SidebarItem(props: SidebarItemProps)
    local ScaleRef = useRef(nil)

    local HandleHover = function()
        if not ScaleRef.current then
            return
        end

        Spr.target(ScaleRef.current, 1, 3, {
            Scale = 1.1
        })

        Sound:PlaySound({
            Id = "17161204665",
            Volume = 0.5,
        })
    end

    local HandleUnhover = function()
        if not ScaleRef.current then
            return
        end

        Spr.target(ScaleRef.current, 1, 3, {
            Scale = 1
        })
    end

    local HandleClick = function()
        if props.OnClick then
            props.OnClick()
        end

        Sound:PlaySound({
            Id = "17161216230",
            Volume = 0.5,
        })
    end

    return React.createElement("Frame", {
        Size = UDim2.new(0, 70, 0, 70),
        BackgroundTransparency = 1,
    }, {
        Button = React.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            ImageColor3 = Color3.new(1,1,1),
            Image = "rbxassetid://" .. props.IconId,

            [React.Event.MouseEnter] = HandleHover,
            [React.Event.MouseLeave] = HandleUnhover,

            [React.Event.Activated] = HandleClick,
        }, {
            NoticeIcon = props.HasNotice and React.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(1, -6, 0, 6),
                Image = "rbxassetid://112857302578293",
                Size = UDim2.new(0, 32, 0, 32),
                BackgroundTransparency = 1,
            }),

            Text = React.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 10),
                Text = props.Text,
                TextSize = 28,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Bottom,
                FontFace = Rubik.Bold,

                BackgroundTransparency = 1,
            }, {
                Stroke = React.createElement("UIStroke", {
                    Thickness = 4,
                    Color = Color3.fromHex("#1A1A1A"),
                }),
            }),

            UIScale = React.createElement("UIScale", {
                Scale = 1,

                ref = ScaleRef,
            }),
        }),

        Layout = React.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),

        UIScale = React.createElement(UIScale, {
            MobileScaleMultiplier = 1.5,
        }),
    })
end

return SidebarItem