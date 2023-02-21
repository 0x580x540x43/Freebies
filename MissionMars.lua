local Badges = {
    2129729553,
    2129729565,
    2129729570,
    2129729618,
    2129729625,
    2129729628,
    2129729636,
    2132597495,
    2132597499,
    2132597526,
    2132597558,
    2132597594
}

for _, Badge in next, Badges do
    game:GetService("ReplicatedStorage").Remotes.Events.Profile.AwardBadge:FireServer(Badge)
end
