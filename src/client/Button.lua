local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.Roact)

local useState = Roact.useState

local function Button(props)
    local clicks, setClicks = useState(0)

    return Roact.createElement("TextButton", {
        AnchorPoint = props.AnchorPoint,
        Position = props.Position,
        Size = props.Size,

        Text = "Clicks: " .. clicks,

        [Roact.Event.Activated] = function()
            setClicks(clicks + 1)
        end,
    })
end

local function setup()
    local player = game.Players.LocalPlayer

    local root = Roact.createElement("ScreenGui", {}, {
        Roact.createElement(Button, {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(240, 240),
        }),
    })

    Roact.mount(root, player.PlayerGui, "ExampleUI")
end

setup()