-- // Chilli Hub v3.7 - Steal An Egg (Orion UI Super Lightweight)
local WebUrl = "https://nguyenvankha201171-jpg.github.io/KeyMod/"
local CorrectKey = "CHILLI-FREE-2026"

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Tải thư viện Orion Library (Chạy mượt trên điện thoại)
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

local Window = OrionLib:MakeWindow({Name = "🌶️ Chilli Hub | Steal An Egg", HidePremium = true, SaveConfig = false, ConfigFolder = "ChilliConfig"})

-- TAB KEY
local KeyTab = Window:MakeTab({
	Name = "🔑 Nhập Key",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

KeyTab:AddButton({
	Name = "📋 Copy Link Web Get Key",
	Callback = function()
     setclipboard(WebUrl)
     OrionLib:MakeNotification({
		Name = "Đã Sao Chép!",
		Content = "Link Web Key đã được lưu vào bộ nhớ tạm.",
		Image = "rbxassetid://4483362458",
		Time = 3
	})
  end    
})

KeyTab:AddTextbox({
	Name = "Nhập Key",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		local CleanKey = string.gsub(Value, "%s+", "")
        if CleanKey == CorrectKey or CleanKey == "CHILLI-2026" then
            OrionLib:MakeNotification({
                Name = "✅ Thành Công!",
                Content = "Key chính xác!",
                Image = "rbxassetid://4483362458",
                Time = 3
            })
            task.wait(1)
            OrionLib:Destroy()

            -- ==========================================
            -- 🚀 TẠO MENU CHÍNH SAU KHI XÁC THỰC KEY
            -- ==========================================
            local MainWin = OrionLib:MakeWindow({Name = "🌶️ Chilli Hub v3.7 Main", HidePremium = true, SaveConfig = false})
            local MainTab = MainWin:MakeTab({Name = "Tính Năng", Icon = "rbxassetid://4483362458"})

            local Features = { AutoSteal = false, SpeedBoost = false, WalkSpeed = 32 }

            -- Auto Steal Loop
            task.spawn(function()
                while task.wait(0.1) do
                    if Features.AutoSteal then
                        pcall(function()
                            local char = LocalPlayer.Character
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                for _, v in pairs(workspace:GetDescendants()) do
                                    if Features.AutoSteal and (string.find(string.lower(v.Name), "egg") or v:FindFirstChild("TouchInterest")) then
                                        if v:IsA("BasePart") then
                                            char.HumanoidRootPart.CFrame = v.CFrame
                                            task.wait(0.05)
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end
            end)

            -- Speed Loop
            task.spawn(function()
                while task.wait(0.2) do
                    if Features.SpeedBoost and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.WalkSpeed = Features.WalkSpeed
                    end
                end
            end)

            MainTab:AddToggle({
                Name = "🔥 Auto Steal Eggs",
                Default = false,
                Callback = function(Value) Features.AutoSteal = Value end
            })

            MainTab:AddToggle({
                Name = "⚡ Speed Boost",
                Default = false,
                Callback = function(Value)
                    Features.SpeedBoost = Value
                    if not Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    end
                end
            })

            MainTab:AddSlider({
                Name = "Tốc độ di chuyển",
                Min = 16,
                Max = 120,
                Default = 32,
                Color = Color3.fromRGB(255,69,0),
                Increment = 1,
                ValueName = "Speed",
                Callback = function(Value) Features.WalkSpeed = Value end    
            })

            OrionLib:Init()
        else
            OrionLib:MakeNotification({
                Name = "❌ Key Sai!",
                Content = "Nhập: CHILLI-FREE-2026",
                Image = "rbxassetid://4483362458",
                Time = 3
            })
        end
	end
})

OrionLib:Init()
