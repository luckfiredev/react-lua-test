--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local storybook = {
   name = "UI",
   storyRoots = {
      ReplicatedStorage.Storybook.Popups,
      ReplicatedStorage.Storybook.Components,
      ReplicatedStorage.Storybook.Gameplay,
   },
   groupRoots = true,
}

return storybook