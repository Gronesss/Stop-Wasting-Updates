Hooks:PostHook(ScriptUnitData, "init", "stop_wasting_updates_init", function(self, unit)
	call_on_next_update(function() -- extensions aren't all initialised yet
		if alive(unit) then
			for name, extension in pairs(unit:extensions_infos()) do
				if not extension.update and not extension.paused_update then
					unit:set_extension_update_enabled(Idstring(name), false)
				end
			end
		end
	end)
end)