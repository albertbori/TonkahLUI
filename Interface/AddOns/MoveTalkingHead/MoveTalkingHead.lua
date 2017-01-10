-- Author: Ketho (EU-Boulderfist)
-- License: Public Domain

local NAME, S = ...
local L = S.L
local f = CreateFrame("Frame")
local db, THF, model

local function round(num, q)
	return floor(num*q + .5) / q
end

local function RemoveAnchor()
	for i, alertSubSystem in pairs(AlertFrame.alertFrameSubSystems) do
		if alertSubSystem.anchorFrame == THF then
			tremove(AlertFrame.alertFrameSubSystems, i)
			return 
		end
	end
end

function f:OnEvent(event, ...)
	if event == "ADDON_LOADED" then
		local addon = ...
		if addon == NAME then
			MoveTalkingHeadDB = MoveTalkingHeadDB or {}
			db = MoveTalkingHeadDB
			
			THF = TalkingHeadFrame
			model = THF.MainFrame.Model

			THF:SetMovable(true)
			THF:SetClampedToScreen(true)
			THF.ignoreFramePositionManager = true -- important
			
			THF:RegisterForDrag("LeftButton")
			THF:SetScript("OnDragStart", function(self)
				if IsModifierKeyDown() then -- allow ctrl/shift/alt
					self:StartMoving()
				end
			end)
			THF:SetScript("OnDragStop", function(self)
				self:StopMovingOrSizing()
				if not db.point then
					RemoveAnchor()
				end
				local point, _, relPoint, dx, dy = self:GetPoint()
				db.point = point
				db.relPoint = relPoint
				db.dx = dx
				db.dy = dy
			end)

			THF:SetScript("OnMouseWheel", function(self, delta)
				if IsModifierKeyDown() then
					-- prefer a rounded number from GetScale
					local scale = round(self:GetScale(), 10^2) + (.05 * delta)
					scale = max(min(scale, 2), .5)
					if db.scale ~= scale then
						db.scale = scale
						self:SetScale(scale)
						-- update model camera for new scale
						Model_ApplyUICamera(model, model.uiCameraID)
					end
				end
			end)

			if db.point then
				THF:ClearAllPoints()
				THF:SetPoint(db.point, nil, db.relPoint, db.dx, db.dy)
				RemoveAnchor() -- only remove the anchor if the frame has been moved
			end
			if db.scale then
				THF:SetScale(db.scale)
			end
			THF:EnableMouse(false)
			
			self:UnregisterEvent(event)
		end
	elseif event == "MODIFIER_STATE_CHANGED" then
		local key, state = ...
		if THF:IsShown() and not THF:IsDragging() then
			-- click-through for normal clicks
			THF:EnableMouse(state == 1)
		end
	end
end

f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("MODIFIER_STATE_CHANGED")
f:SetScript("OnEvent", f.OnEvent)

for i, v in pairs({"th", "mth", "movetalking", "movetalkinghead"}) do
	_G["SLASH_MOVETALKINGHEAD"..i] = "/"..v
end

function SlashCmdList.MOVETALKINGHEAD(msg)
	local scale = tonumber(msg)
	
	if msg == "reset" then
		wipe(db)
		THF:ClearAllPoints()
		THF:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 96)
		THF:SetScale(1)
		Model_ApplyUICamera(model, model.uiCameraID)
		print(L.RESET)
	elseif scale then
		if scale <= 2 and scale >= .5 then
			db.scale = scale
			THF:SetScale(db.scale)
			Model_ApplyUICamera(model, model.uiCameraID)
			print(L.SET:format(scale))
		else
			print(L.ERROR_SCALE:format(msg, "[0.50, 2.00]"))
		end
	else
		print("/th |cffFFFF00reset|r - "..RESET_TO_DEFAULT)
		print("/th |cffFFFF000.8|r - "..L.USAGE_SCALE.." [0.50, 2.00]")
	end
end
