local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Klemplus pro gamer", HidePremium = false, SaveConfig = true, ConfigFolder = "Maydabihack"})
OrionLib:MakeNotification({
	Name = "Warning!!",
	Content = "Do not use Money farm and Exp farm at the same time or get crashed :) ",
	Image = "rbxassetid://4483345998",
	Time = 100
})
OrionLib:MakeNotification({
	Name = "Ghi chú!!!",
	Content = "Đéo dùng Farm Money với farm exp cùng lúc , bị lỗi ráng chịu =)))",
	Image = "rbxassetid://4483345998",
	Time = 100
})


local Tab1 = Window:MakeTab({
	Name = "AutoFarm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Fun =)",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab1:AddToggle({
	Name = "Farm Exp",
	Default = false,
	Callback = function(Value)
		Farm1()
	end    
})

Tab1:AddToggle({
	Name = "Money farm",
	Default = false,
	Callback = function(Value)
		Farm2()
	end    
})

Tab1:AddToggle({
	Name = "Lock fps , White screen (reduced gpu) , lq",
	Default = false,
	Callback = function(Value)
		reduceLag()
	end    
})

Tab2:AddToggle({
	Name = "Auto Respawn",
	Default = false,
	Callback = function(Value)
		AR()
	end    
})
Tab2:AddToggle({
	Name = "Auto Cola!",
	Default = false,
	Callback = function(Value)
		Ac()
	end    
})

Tab2:AddToggle({
	Name = "uh ",
	Default = false,
	Callback = function(Value)
		local np = "<font color=\"rgb(100,255,100)\">Klemplus on top ez</font>"
		game:GetService("Players").LocalPlayer.PlayerGui.HUD.Messages.Use:Fire(np)
	end    
})


function Farm1()
  local plr = game:service"Players".LocalPlayer;
  local tween_s = game:service"TweenService";
  local info = TweenInfo.new(0,Enum.EasingStyle.Quad); 
  function tp(...)
local tic_k = tick();
local params = {...};
local cframe = CFrame.new(params[1],params[2],params[3]);
local tween,err = pcall(function()
local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
      tween:Play();
end)
   if not tween then return err end
end
wait(1)
tp(-50.9600944519043, 9999.038965225219727, -265.03851318359375);
local v = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
v:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
v:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end

function reduceLag()
local L = "LowQuality"
local L2 = true
game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer(L, L2)
local Rc = game:GetService("RunService")
Rc:Set3dRenderingEnabled(false)
setfpscap(10)
end

function Farm2()
		local WorkspacePlayers = game:GetService("Workspace").Game.Players
		local Players = game:GetService('Players')
		local localplayer = Players.LocalPlayer
		local GuiService = game:GetService("GuiService")
		local Light = game:GetService("Lighting")
		local GetDownedPlr = function()
			for i,v in pairs(WorkspacePlayers:GetChildren()) do
				if v:GetAttribute("Downed") then
					return v
				end
			end
		end

			local downedplr = GetDownedPlr()
			if downedplr ~= nil and downedplr:FindFirstChild('HumanoidRootPart') then
				task.spawn(function()
					while task.wait() do
						if localplayer.Character then
							workspace.Game.Settings:SetAttribute("ReviveTime", 2.2)
							localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(downedplr:FindFirstChild('HumanoidRootPart').Position.X, downedplr:FindFirstChild('HumanoidRootPart').Position.Y + 3, downedplr:FindFirstChild('HumanoidRootPart').Position.Z)
							task.wait()
							game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), false)
							task.wait(4.5)
							game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
							game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
							game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
							break
					end
				end)
			end
		end
	end
function AR()
local Players = game:GetService('Players')
local localplayer = Players.LocalPlayer
local GuiService = game:GetService("GuiService")
if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
end
end
function Ac()
	local c = "Cola"
	game:GetService("ReplicatedStorage").Events.UseUsable:FireServer(c)
	wait(6)
end