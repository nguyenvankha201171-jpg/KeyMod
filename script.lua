-- // Chilli Hub - Steal An Egg (Key System Integrated)
-- // Web Get Key: https://nguyenvankha201171-jpg.github.io/KeyMod/

local KeySystem = {
    WebUrl = "https://nguyenvankha201171-jpg.github.io/KeyMod/",
    ValidKey = "CHILLI-FREE-2026" -- Bạn có thể đổi Key này trùng với Key trên Web của bạn
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Khởi tạo thư viện Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌶️ Chilli Hub | Hệ Thống Key",
   LoadingTitle = "Chilli Hub đang kiểm tra...",
   LoadingSubtitle = "by kha71VN",
   ConfigurationSaving = { Enabled = false }
})

-- Tạo Tab Xác Thực Key
local KeyTab = Window:CreateTab("🔑 Xác Thực Key", 4483362458)

KeyTab:CreateParagraph({
    Title = "📌 Hướng dẫn lấy Key",
    Content = "Hãy bấm nút 'Sao chép Link Web Key', dán vào trình duyệt (Chrome/Safari) để lấy Key miễn phí!"
})

KeyTab:CreateButton({
   Name = "📋 Sao Chép Link Web Get Key",
   Callback = function()
      setclipboard(KeySystem.WebUrl)
      Rayfield:Notify({
         Title = "Đã Sao Chép!",
         Content = "Link Web Key đã được lưu vào bộ nhớ tạm. Hãy dán vào trình duyệt!",
         Duration = 4,
      })
   end,
})

KeyTab:CreateInput({
   Name = "Nhập Key Vừa Lấy Được",
   PlaceholderText = "Dán Key vào đây...",
   RemoveTextOnFocus = false,
   Callback = function(EnteredKey)
      if EnteredKey == KeySystem.ValidKey then
          Rayfield:Notify({
             Title = "✅ Kích Hoạt Thành Công!",
             Content = "Key hợp lệ! Đang mở menu tính năng...",
             Duration = 3,
          })
          
          task.wait(1)
          Rayfield:Destroy() -- Đóng UI nhập key
          
          -- ===================================================
          -- 🚀 KHU VỰC MENU TÍNH NĂNG CHÍNH (STEAL AN EGG)
          -- ===================================================
          local MainWindow = Rayfield:CreateWindow({
             Name = "🌶️ Chilli Hub v3.7 | Steal An Egg",
             LoadingTitle = "Đang tải tính năng...",
             ConfigurationSaving = { Enabled = false }
          })

          local MainTab = MainWindow:CreateTab("Tính Năng Chính", 4483362458)

          -- Biến lưu trạng thái tính năng
          local Features = {
              AutoSteal = false,
              SpeedBoost = false,
              WalkSpeed = 32
          }

          -- Vòng lặp Auto Steal Trứng
          task.spawn(function()
              while task.wait(0.3) do
                  if Features.AutoSteal then
                      pcall(function()
                          for _, egg in pairs(workspace:GetChildren()) do
                              if egg:FindFirstChild("TouchInterest") and string.find(string.lower(egg.Name), "egg") then
                                  firetouchinterest(LocalPlayer.Character.HumanoidRootPart, egg, 0)
                                  firetouchinterest(LocalPlayer.Character.HumanoidRootPart, egg, 1)
                              end
                          end
                      end)
                  end
              end
          end)

          -- Vòng lặp Tăng Tốc Độ
          game:GetService("RunService").RenderStepped:Connect(function()
              if Features.SpeedBoost and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                  LocalPlayer.Character.Humanoid.WalkSpeed = Features.WalkSpeed
              end
          end)

          -- Nút Bật/Tắt Auto Steal
          MainTab:CreateToggle({
             Name = "🔥 Auto Steal Eggs (Tự động nhặt trứng)",
             CurrentValue = false,
             Callback = function(Value)
                Features.AutoSteal = Value
             end,
          })

          -- Nút Bật/Tắt Speed Boost
          MainTab:CreateToggle({
             Name = "⚡ Speed Boost (Tăng tốc di chuyển)",
             CurrentValue = false,
             Callback = function(Value)
                Features.SpeedBoost = Value
             end,
          })

          -- Thanh chỉnh Tốc Độ
          MainTab:CreateSlider({
             Name = "Chỉnh Tốc Độ Di Chuyển",
             Range = {16, 150},
             Increment = 1,
             CurrentValue = 32,
             Callback = function(Value)
                Features.WalkSpeed = Value
             end,
          })

      else
          Rayfield:Notify({
             Title = "❌ Key Không Đúng!",
             Content = "Key bạn nhập bị sai hoặc đã hết hạn. Vui lòng kiểm tra lại trên Web!",
             Duration = 4,
          })
      end
   end,
})
