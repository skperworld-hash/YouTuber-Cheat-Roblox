--[[
    Lenovo Way 2026 GUI for YouTuber Simulator
    Functions: Mod Menu, Auto-Click (Perfect Hit), Money Set
]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Lenovo Way 2026 - YouTuber Sim", "DarkTheme")

-- Вкладка Главная
local Main = Window:NewTab("Main")
local Section = Main:NewSection("Automation")

-- Автоклик (чтобы всегда попадать в кнопки на ПК)
Section:NewToggle("Auto Click (Perfect)", "Автоматически ловит кнопки", function(state)
    getgenv().AutoClick = state
    spawn(function()
        while getgenv().AutoClick do
            -- Логика нажатия на кнопки записи (ClickEvent)
            game:GetService("ReplicatedStorage").Events.ClickEvent:FireServer()
            wait(0.01) -- Очень быстро
        end
    end)
end)

-- Функция "Много денег" (Визуально или через ивент, если работает)
Section:NewTextBox("Выдать деньги", "Введите сумму", function(txt)
    print("Попытка выдать сумму: " .. txt)
    -- В большинстве симуляторов это работает через ивент получения награды
    game:GetService("ReplicatedStorage").Events.ClaimReward:FireServer(tonumber(txt))
end)
