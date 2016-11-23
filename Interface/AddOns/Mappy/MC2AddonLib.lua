local AddonName, Addon = ...

Addon.AddonPath = "Interface\\Addons\\"..AddonName.."\\"

function Addon:new(methodTable, ...)
	assert(type(methodTable) == "table", "table expected")
	
	local object
	
	if methodTable.New then
		object = methodTable:New(...)
	else
		object = {}
	end
	
	object.Inherit = self.Inherit
	object.InheritOver = self.InheritOver
	
	object:InheritOver(methodTable, ...)
	
	return object
end

function Addon:inheritOver(methodTable, ...)
	for key, value in pairs(methodTable) do
		if self[key] then
			if not self.Inherited then
				self.Inherited = {}
			end
			
			self.Inherited[key] = self[key]
		end
		
		self[key] = value
	end
	
	if methodTable.construct then
		methodTable.construct(self, ...)
	elseif methodTable.Construct then
		methodTable.Construct(self, ...)
	end
end

function Addon:inherit(methodTable, ...)
	for key, value in pairs(methodTable) do
		if self[key] then
			if not self.Inherited then
				self.Inherited = {}
			end
			
			if not self.Inherited[key] then
				self.Inherited[key] = value
			end
		else
			self[key] = value
		end
	end
	
	if methodTable.construct then
		methodTable.construct(self, ...)
	elseif methodTable.Construct then
		methodTable.Construct(self, ...)
	end
end

function Addon:duplicateTable(table, recurse, destTable)
	if not table then
		return nil
	end
	
	local vTable
	
	if destTable then
		if type(destTable) ~= "table" then
			error("table expected for destTable")
		end
		
		vTable = destTable
	else
		vTable = {}
	end
	
	if recurse then
		for key, value in pairs(table) do
			if type(value) == "table" then
				vTable[key] = self:duplicateTable(value, true)
			else
				vTable[key] = value
			end
		end
	else
		self:copyTable(vTable, table)
	end
	
	return vTable
end

function Addon:copyTable(destTable, table)
	for key, value in pairs(table) do
		destTable[key] = value
	end
end

function Addon:eraseTable(table)
	for key, _ in pairs(table) do
		table[key] = nil
	end
end

function Addon:recycleTable(table)
	if table then
		self:eraseTable(table)
		return table
	else
		return {}
	end
end

function Addon:hookScript(frame, scriptID, func)
	if not frame:GetScript(scriptID) then
		frame:SetScript(scriptID, func)
	else
		frame:HookScript(scriptID, func)
	end
end

-- Old name compatibility
Addon.New = Addon.new
Addon.Inherit = Addon.inherit
Addon.InheritOver  = Addon.inheritOver
Addon.DuplicateTable  = Addon.duplicateTable
Addon.CopyTable  = Addon.copyTable
Addon.EraseTable  = Addon.eraseTable
Addon.RecycleTable  = Addon.recycleTable
Addon.HookScript  = Addon.hookScript
