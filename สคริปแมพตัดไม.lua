-- Roblox Lumber Tycoon 2 - All-in-One Helper Script
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "LT2 - Ultimate Hub 🌲",
   LoadingTitle = "Loading LT2 Script...",
   LoadingSubtitle = "by Assistant AI",
   ConfigurationSaving = { Enabled = false }
})

-- ==================== TAB 1: ไม้หายาก (RARE TREES) ====================
local WoodTab = Window:CreateTab("ไม้หายาก (Trees)", 4483362458)

local RareTrees = {
    ["Volcano Wood (ไม้ลาวา)"] = Vector3.new(-1600, 622, 1100),
    ["Cave Wood (ไม้ถ้ำ/ฟ้า)"] = Vector3.new(3500, -200, 500),
    ["End Times Wood (ไม้ phantom)"] = Vector3.new(115, -6, -3500),
    ["Swamp Wood (ไม้หนองน้ำ)"] = Vector3.new(-2500, -5, -1750),
    ["Palm Wood (ไม้เกาะเกล็ด)"] = Vector3.new(2500, 5, -2500),
    ["Frost Wood (ไม้หิมะ)"] = Vector3.new(1450, 410, 3200)
}

WoodTab:CreateSection("วาร์ปไปจุดต้นไม้หายาก")

for treeName, coords in pairs(RareTrees) do
    WoodTab:CreateButton({
        Name = "วาร์ปไป: " .. treeName,
        Callback = function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(coords)
                Rayfield:Notify({Title = "Teleported", Content = "วาร์ปไป " .. treeName .. " เรียบร้อย!", Duration = 3})
            end
        end,
    })
end

-- ==================== TAB 2: ร้านค้า/ซื้อขวาน (STORES & AXES) ====================
local StoreTab = Window:CreateTab("ร้านค้า & ขวาน (Stores)", 4483362458)

StoreTab:CreateSection("วาร์ปไปร้านขายขวาน / อุปกรณ์")

StoreTab:CreateButton({
   Name = "ร้าน Woodman's Store (ขวานเริ่มต้น/ขวานเหล็ก)",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if char and char:FindFirstChild("HumanoidRootPart") then
           char.HumanoidRootPart.CFrame = CFrame.new(265, 3, -630)
       end
   end,
})

StoreTab:CreateButton({
   Name = "ร้าน Fancy Furnishings (เฟอร์นิเจอร์/ขวาน Silver)",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if char and char:FindFirstChild("HumanoidRootPart") then
           char.HumanoidRootPart.CFrame = CFrame.new(490, 3, -1720)
       end
   end,
})

StoreTab:CreateButton({
   Name = "ร้าน Boxed Cars / Land Store",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if char and char:FindFirstChild("HumanoidRootPart") then
           char.HumanoidRootPart.CFrame = CFrame.new(510, 3, -600)
       end
   end,
})

-- ==================== TAB 3: ระบบช่วยฟาร์ม/ขายไม้ (AUTO FARM) ====================
local FarmTab = Window:CreateTab("ระบบฟาร์ม (Auto Farm)", 4483362458)

FarmTab:CreateSection("ระบบช่วยขายไม้")

FarmTab:CreateButton({
   Name = "วาร์ปไม้ใกล้ตัวไปจุดขายเงิน (Sell Nearby Wood)",
   Callback = function()
        local dropoff = workspace:FindFirstChild("Stores") and workspace.Stores:FindFirstChild("WoodDropoff")
        if not dropoff then
            Rayfield:Notify({Title = "Error", Content = "ไม่พบจุดขายไม้ใน Server", Duration = 3})
            return
        end

        local count = 0
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            for _, item in ipairs(workspace:GetChildren()) do
                if item.Name == "TreeRegion" or item:FindFirstChild("WoodSection") then
                    for _, part in ipairs(item:GetDescendants()) do
                        if part:IsA("BasePart") and part.Name == "Wood" then
                            if (char.HumanoidRootPart.Position - part.Position).Magnitude < 150 then
                                part.CFrame = dropoff.CFrame + Vector3.new(0, 3, 0)
                                count = count + 1
                            end
                        end
                    end
                end
            end
        end
        Rayfield:Notify({Title = "Success", Content = "ย้ายไม้จำนวน " .. tostring(count) .. " ชิ้นไปจุดขายสำเร็จ!", Duration = 3})
   end,
})

FarmTab:CreateButton({
   Name = "วาร์ปตัวละครไปจุดขายไม้ (Wood Dropoff)",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if char and char:FindFirstChild("HumanoidRootPart") then
           char.HumanoidRootPart.CFrame = CFrame.new(315, 3, -1300)
       end
   end,
})
