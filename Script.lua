local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Lenovo Way 2026 - YouTuber Sim", "DarkTheme")

local Main = Window:NewTab("Main")
local Section = Main:NewSection("Money & Clicks")

-- Улучшенный автоклик (находит удаленное событие)
Section:NewToggle("Auto Click", "Фарм видео", function(state)
    getgenv().Auto = state
    while getgenv().Auto do
        -- Пытаемся найти событие клика автоматически
        local event = game:GetService("ReplicatedStorage"):FindFirstChild("ClickEvent", true) or 
                      game:GetService("ReplicatedStorage"):FindFirstChild("Click", true)
        if event then
            event:FireServer()
        end
        wait(0.01)
    end
end)

-- Выдать деньги (через изменение данных игрока)
Section:NewTextBox("Выдать деньги", "Впиши число", function(txt)
    local amount = tonumber(txt)
    -- Пытаемся изменить значение в лидерстатс (визуально + попытка синхронизации)
    local stats = game.Players.LocalPlayer:FindFirstChild("leaderstats")
    if stats then
        local money = stats:FindFirstChild("Money") or stats:FindFirstChild("Cash")
        if money then
            money.Value = money.Value + amount
        end
    end
    print("Lenovo Way: Попытка добавить " .. txt)
end)
