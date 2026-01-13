-- iTerm2 Window Switcher
-- Bind cmd+1 through cmd+9 to switch to specific iTerm windows

local function switchToITermWindow(windowIndex)
    local iterm = hs.application.get("iTerm2") or hs.application.get("iTerm")

    if not iterm then
        hs.alert.show("iTerm is not running")
        return
    end

    local windows = iterm:allWindows()

    -- Sort windows by ID to maintain consistent order
    table.sort(windows, function(a, b)
        return a:id() < b:id()
    end)

    iterm:activate()

    if windows[windowIndex] then
        windows[windowIndex]:focus()
    end
end

-- Bind cmd+1 through cmd+9
for i = 1, 9 do
    hs.hotkey.bind({"cmd"}, tostring(i), function()
        switchToITermWindow(i)
    end)
end
