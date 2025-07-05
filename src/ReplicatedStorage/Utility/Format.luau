--!strict

local Format = {}

function Format:Number(num: number)
    return tostring(math.floor(num)):reverse():gsub("(%d%d%d)","%1,")
        :gsub(",(%-?)$","%1"):reverse()
end

return Format