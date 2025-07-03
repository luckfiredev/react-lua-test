--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local storybook = {
   name = "UI",
   storyRoots = {
      ReplicatedStorage.Storybook.Interfaces,
      ReplicatedStorage.Storybook.Components,
   },
   groupRoots = true,
}

return storybook