local _, S = ...

local L = {
	enUS = {
		RESET = "Settings have been reset",
		SET = "Current scale is now %.2f",
		USAGE_SCALE = "Sets the scale",
		ERROR_SCALE = "%s is not in the valid range of %s",
	},
	deDE = {
		RESET = "Einstellungen wurden zurückgesetzt",
		SET = "Die momentane Skalierung beträgt %.2f",
		USAGE_SCALE = "Legt die Skalierung fest",
		ERROR_SCALE = "%s ist nicht im gültigen Bereich von %s",
	},
	esES = {
	},
	esMX = {
	},
	frFR = {
	},
	itIT = {
	},
	koKR = {
		RESET = "설정이 초기화되었습니다",
		SET = "현재 크기 비율은 %.2f입니다",
		USAGE_SCALE = "크기 비율을 설정합니다",
		ERROR_SCALE = "%s|1은;는; %s의 유효한 범위가 아닙니다",
	},
	ptBR = {
	},
	ruRU = {
	},
	--zhCN = {},
	zhTW = {
		RESET = "設定已經重置",
		SET = "目前的縮放大小是 %.2f",
		ERROR_SCALE = "%s 不在有效的數字範圍 %s 以內",
	},
}

L.zhCN = L.zhTW

S.L = setmetatable(L[GetLocale()] or L.enUS, {__index = function(t, k)
	local v = rawget(L.enUS, k) or k
	rawset(t, k, v)
	return v
end})
