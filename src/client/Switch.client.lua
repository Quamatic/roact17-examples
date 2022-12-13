local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.Roact)

local useState = Roact.useState

local function Switch(props)
    return Roact.createElement("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(40, 15),
        Text = "",
        BackgroundColor3 = if props.value then Color3.fromRGB() else Color3.fromRGB(),

        [Roact.Event.Activated] = function()
            props.onChange(not props.value)
        end,
    }, {
        UICorner = Roact.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0),
        }),

        Dot = Roact.createElement("Frame", {
            AnchorPoint = if props.value then Vector2.new(1, 0.5) else Vector2.new(0, 0.5),
            Position = if props.value then UDim2.fromScale(1, 0.5) else UDim2.fromScale(0, 0.5),
            Size = UDim2.fromOffset(20, 20),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            UICorner = Roact.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0),
            }),
        })
    })
end

local function setup()
    local player = game.Players.LocalPlayer

    local function TestSwitch()
        local state, setState = useState(false)

        return Roact.createElement(Switch, {
            value = state,
            onChange = setState,
        })
    end

    local root = Roact.createElement("ScreenGui", {}, {
        Roact.createElement(TestSwitch)
    })

    Roact.mount(root, player.PlayerGui, "ExampleUI")
end


setup()