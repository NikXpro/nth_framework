NTH.ServerCallbacks = {}
NTH.ClientCallbacks = {}
NTH.CurrentRequestId = 0

NTH.TriggerCallback = function(name, cb, data, player)
	local e = 'NTH-CallBackClient:'
	local sendEvent = e..'' ..name
	local returnEvent = e..''..name..'_return'
	if not NTH.ClientCallbacks[returnEvent] then
		NTH.ClientCallbacks[returnEvent] = cb
		RegisterServerEvent(returnEvent)
		AddEventHandler(returnEvent, function(args)
			local cb = NTH.ClientCallbacks[returnEvent]
			cb(args)
		end)
	end
	TriggerClientEvent(sendEvent, player, data)
end


NTH.RegisterCallback  = function(name, cb)
	if not NTH.ServerCallbacks[name] then
		local e = 'NTH-CallBackServer:'..name
		NTH.ServerCallbacks[name] = cb
		RegisterServerEvent(e)
		AddEventHandler(e, function(args)
			local src = source
			NTH.ServerCallbacks[name](args, src, function(data)
				TriggerClientEvent(e.. '_return', src, data)
			end)
		end)
	end
end