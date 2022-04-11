NTH.ServerCallbacks = {}
NTH.ClientCallbacks = {}

---@param name string
---@param cb function
---@param data table
NTH.TriggerCallback = function(name, cb, data)
	local e = 'NTH-CallBackServer:'
	local sendEvent = e..'' ..name
	local returnEvent = e..''..name..'_return'
	if not NTH.ServerCallbacks[returnEvent] then
		NTH.ServerCallbacks[returnEvent] = cb
		RegisterNetEvent(returnEvent)
		AddEventHandler(returnEvent, function(args)
			local cb = NTH.ServerCallbacks[returnEvent]
			cb(args)
		end)
	end
	TriggerServerEvent(sendEvent, data)
end


NTH.RegisterCallback  = function(name, cb)
	if not NTH.ClientCallbacks[name] then
		local e = 'NTH-CallBackClient:'..name
		NTH.ClientCallbacks[name] = cb
		RegisterNetEvent(e)
		AddEventHandler(e, function(args)
			NTH.ClientCallbacks[name](args, function(data)
				TriggerServerEvent(e.. '_return', data)
			end)
		end)
	end
end