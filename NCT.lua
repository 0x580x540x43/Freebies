repeat task.wait(.5) until game.Loaded

task.wait(5)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local queue_on_teleport = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)

local function GetObbyRewards()
    for _,v in pairs(workspace.Folder:GetChildren()) do
        LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame

        task.wait(1)
    end
end

local function Main()
    GetObbyRewards()
    local Currency = LocalPlayer.PlayerGui.Currency.Amount

    if tonumber(Currency.Text) >= 22550 then
        ReplicatedStorage.Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ShopService.RE.PurchaseItem:FireServer("Accessories", "008")
        ReplicatedStorage.Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ShopService.RE.PurchaseItem:FireServer("Accessories", "007")
    else
        queue_on_teleport()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId, LocalPlayer)
    end
end

while task.wait(1) do
    pcall(Main)
end
