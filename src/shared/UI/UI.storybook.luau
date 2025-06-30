--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local storybook = {
   name = "UI",
   storyRoots = {
      ReplicatedStorage.Shared.UI.Storybook.Interfaces,
      ReplicatedStorage.Shared.UI.Storybook.Components,
   },
   groupRoots = true,
}

return storybook