local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.Roact)

local useState = Roact.useState
local useEffect = Roact.useEffect

local function Clock()
    local currentTime, setCurrentTime = useState(0)

    useEffect(function()
        local running = true

        task.spawn(function()
            while running do
                setCurrentTime(currentTime + 1)
                task.wait(1)
            end
        end)

        -- cleanup
        return function()
            running = false
        end
    end, {})

    return Roact.createElement("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(400, 300),
        Text = "The current time is: " .. currentTime,
    })
end

return Clock