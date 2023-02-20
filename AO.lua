-- UNFINISHED

repeat task.wait() until game.Loaded

local Players = game:GetService("Players")

local PlaneCFrames = {
    CFrame.new(-10.0375414, 3.62975502, 168.241211, 0.94143188, 1.95414618e-08, 0.337203294, -5.73879362e-08, 1, 1.02268785e-07, -0.337203294, -1.15630499e-07, 0.94143188),
    CFrame.new(-36.7644501, 22.734108, 206.892746, -0.300702393, 1.13312318e-07, -0.953718007, 4.13837107e-08, 1, 1.05763064e-07, 0.953718007, -7.66518582e-09, -0.300702393),
    CFrame.new(-25.6509171, 82.7889252, 262.483734, -0.342030734, 2.36420616e-09, -0.939688742, -1.42450392e-11, 1, 2.52113108e-09, 0.939688742, 8.75690187e-10, -0.342030734),
    CFrame.new(64.7174301, 95.7907867, 272.695557, 0.866023302, -1.51972319e-08, -0.500003636, 6.02374151e-09, 1, -1.99609183e-08, 0.500003636, 1.42747272e-08, 0.866023302),
    CFrame.new(13.7709465, 232.892792, 82.6054688, 0.99332428, -6.82284735e-08, -0.115355223, 6.1491491e-08, 1, -6.1960634e-08, 0.115355223, 5.44536398e-08, 0.99332428),
    CFrame.new(-6.04802322, 247.21434, 167.182281, 0.27363041, 4.90849885e-08, 0.961834908, -1.84237106e-08, 1, -4.57913316e-08, -0.961834908, -5.19066612e-09, 0.27363041),
    CFrame.new(166.534027, 322.255157, 96.8466797, 0.711459458, 3.04496375e-08, -0.702727139, -1.35110478e-09, 1, 4.19627781e-08, 0.702727139, -2.89053563e-08, 0.711459458),
    CFrame.new(223.13887, 339.983154, 97.0646896, -0.720981181, -3.69180526e-08, -0.692954659, 1.57783719e-09, 1, -5.49179404e-08, 0.692954659, -4.06881711e-08, -0.720981181),
    CFrame.new(191.3479, 340.497162, 160.205124, -0.8788234, -2.57755541e-08, 0.477147222, 5.4352558e-09, 1, 6.40309423e-08, -0.477147222, 5.88653037e-08, -0.8788234),
    CFrame.new(-31.0698833, 362.393585, 165.380646, -0.145503595, 6.18766833e-08, 0.98935771, -7.78246942e-08, 1, -7.39878558e-08, -0.98935771, -8.77619613e-08, -0.145503595)
}

local WallPracticeCFrames = {
    CFrame.new(255.012344, 3.62778091, -342.177032, 0.0871576816, 0, -0.996194482, -0, 1, -0, 0.996194601, 0, 0.0871576741),
    CFrame.new(249.407227, 3.62778139, -405.841583, 0.0871576816, 0, -0.996194482, -0, 1, -0, 0.996194601, 0, 0.0871576741),
    CFrame.new(187.048294, 3.62777948, -399.299194, 0.348226279, -1.97361611e-08, 0.937410533, 2.73787197e-08, 1, 1.08833556e-08, -0.937410533, 2.18752287e-08, 0.348226279)
}

local TennisCourts = {
    CFrame.new(473.310242, 4.59102345, -219.231567, 0.234469071, -1.07400673e-07, 0.972123563, 6.76840273e-09, 1, 1.08847985e-07, -0.972123563, -1.89417637e-08, 0.234469071),
}

local function TennisBot()
    local HRP = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

    task.wait(3)
    local Court = require(workspace.Src.Court)
    function TeleportToCourt()
        for _, CF in next, TennisCourts do
            HRP.CFrame = CF
    
            task.wait(13)
            if Players.LocalPlayer.PlayerGui.GameUI.Enabled == true then
                break;
            end
        end

        HitBall()
    end
    function HitBall()
        repeat task.wait(.5) until Court.GetClientCourtInfo() ~= nil
 
        local courtinfo = Court.GetClientCourtInfo()
        local counter = 0

        while task.wait(.1) do
			repeat task.wait(.1) until courtinfo.ball ~= nil
            local clientball = courtinfo.ball
            pcall(function()
                HRP.CFrame = clientball.Ball.CFrame
            end)

            if counter >= 450 then
                Players.LocalPlayer.Character.Humanoid.Health = 0
                Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                TeleportToCourt()
                break
            end
            
            if Court.GetClientCourtInfo() == nil then
                break
            end

            counter = counter + 1
        end
    end

    TeleportToCourt()

    task.wait(5)
    return
end

function GetPlane()
    local HRP = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

    for _, CF in next, PlaneCFrames do
        HRP.CFrame = CF
        task.wait(3)
    end

    task.wait(2)

    GetBallHead()
end

function GetBallHead()
    local HRP = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local Court = require(workspace.Src.Court)
    function TeleportToCourt()
        for _, CF in next, WallPracticeCFrames do
            HRP.CFrame = CF
    
            task.wait(3)
            if Players.LocalPlayer.PlayerGui.GameUI.Enabled == true then
                break;
            end
        end
        if Players.LocalPlayer.PlayerGui.GameUI.Enabled == true then
            HitBall()
        else
            TeleportToCourt()
        end
    end
    function HitBall()
        local courtinfo = Court.GetClientCourtInfo()
        local clientball = courtinfo.ClientBall
        local counter = 0

        while task.wait(.3) do
            pcall(function()
                HRP.CFrame = clientball.Ball.CFrame
            end)

            if counter >= 25 then
                task.wait(6)
                break
            end
            
            counter = counter + 1
        end
        GetBeachBall()
    end

    TeleportToCourt()
end

function GetBeachBall()
    for i=1,10 do
        TennisBot()
    end

    repeat
        TennisBot()
    until tonumber(Players.LocalPlayer.PlayerGui.HUD.Currency.Levelprogression.LevelCount.LevelAmount.Text) >= 10
end

GetPlane()
