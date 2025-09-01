::mods_hookExactClass("states/world_state", function(ws) {
	local helper_handleContextualKeyInput = ws.helper_handleContextualKeyInput;

	ws.helper_handleContextualKeyInput = function(_key) {
		if (isInLoadingScreen())
			return true;

		// 35 == Y
		if (_key.getState() == 0) {
			switch(_key.getKey()) {
				case 35: {
					Tooltip.toggle()
					return;
				}
			}
		}

		helper_handleContextualKeyInput(_key);
	}
});

::mods_hookExactClass("states/tactical_state", function(ts) {
	local helper_handleContextualKeyInput = ts.helper_handleContextualKeyInput;

	ts.helper_handleContextualKeyInput = function(_key) {
		// 35 == Y
		if (_key.getState() == 0) {
			switch(_key.getKey()) {
				case 35: {
					Tooltip.toggle()
					return;
				}
			}
		}

		helper_handleContextualKeyInput(_key);
	}
});

::mods_hookClass("ui/screens/tooltip/modules/tooltip", function(t) {
	::mods_addField(t, "tooltip", "IsToggled", false);
	::mods_addField(t, "tooltip", "BackupOnQueryTileTooltipDataListener", null);
	::mods_addField(t, "tooltip", "BackupOnQueryRosterEntityTooltipDataListener", null);
	::mods_addField(t, "tooltip", "BackupOnQueryEntityTooltipDataListener", null);
	::mods_addField(t, "tooltip", "BackupOnQuerySkillTooltipDataListener", null);
	::mods_addField(t, "tooltip", "BackupOnQueryStatusEffectTooltipDataListener", null);
	::mods_addField(t, "tooltip", "BackupOnQuerySettlementStatusEffectTooltipDataListener", null);
	::mods_addField(t, "tooltip", "BackupOnQueryUIElementTooltipDataListener", null);
	::mods_addField(t, "tooltip", "BackupOnQueryUIItemTooltipDataListener", null);
	::mods_addField(t, "tooltip", "BackupOnQueryUIPerkTooltipDataListener", null);
	::mods_addField(t, "tooltip", "BackupOnQueryFollowerTooltipDataListener", null);

	::mods_addMember(t, "tooltip", "toggle", function() {
		m.IsToggled = !m.IsToggled;

		if (m.IsToggled) {
			m.BackupOnQueryTileTooltipDataListener = m.OnQueryTileTooltipDataListener;
			m.BackupOnQueryRosterEntityTooltipDataListener = m.OnQueryRosterEntityTooltipDataListener;
			m.BackupOnQueryEntityTooltipDataListener = m.OnQueryEntityTooltipDataListener;
			m.BackupOnQuerySkillTooltipDataListener = m.OnQuerySkillTooltipDataListener;
			m.BackupOnQueryStatusEffectTooltipDataListener = m.OnQueryStatusEffectTooltipDataListener;
			m.BackupOnQuerySettlementStatusEffectTooltipDataListener = m.OnQuerySettlementStatusEffectTooltipDataListener;
			m.BackupOnQueryUIElementTooltipDataListener = m.OnQueryUIElementTooltipDataListener;
			m.BackupOnQueryUIItemTooltipDataListener = m.OnQueryUIItemTooltipDataListener;
			m.BackupOnQueryUIPerkTooltipDataListener = m.OnQueryUIPerkTooltipDataListener;
			m.BackupOnQueryFollowerTooltipDataListener = m.OnQueryFollowerTooltipDataListener;
	
			m.OnQueryTileTooltipDataListener = null;
			m.OnQueryRosterEntityTooltipDataListener = null;
			m.OnQueryEntityTooltipDataListener = null;
			m.OnQuerySkillTooltipDataListener = null;
			m.OnQueryStatusEffectTooltipDataListener = null;
			m.OnQuerySettlementStatusEffectTooltipDataListener = null;
			m.OnQueryUIElementTooltipDataListener = null;
			m.OnQueryUIItemTooltipDataListener = null;
			m.OnQueryUIPerkTooltipDataListener = null;
			m.OnQueryFollowerTooltipDataListener = null;
		} else {
			m.OnQueryTileTooltipDataListener = m.BackupOnQueryTileTooltipDataListener;
			m.OnQueryRosterEntityTooltipDataListener = m.BackupOnQueryRosterEntityTooltipDataListener;
			m.OnQueryEntityTooltipDataListener = m.BackupOnQueryEntityTooltipDataListener;
			m.OnQuerySkillTooltipDataListener = m.BackupOnQuerySkillTooltipDataListener;
			m.OnQueryStatusEffectTooltipDataListener = m.BackupOnQueryStatusEffectTooltipDataListener;
			m.OnQuerySettlementStatusEffectTooltipDataListener = m.BackupOnQuerySettlementStatusEffectTooltipDataListener;
			m.OnQueryUIElementTooltipDataListener = m.BackupOnQueryUIElementTooltipDataListener;
			m.OnQueryUIItemTooltipDataListener = m.BackupOnQueryUIItemTooltipDataListener;
			m.OnQueryUIPerkTooltipDataListener = m.BackupOnQueryUIPerkTooltipDataListener;
			m.OnQueryFollowerTooltipDataListener = m.BackupOnQueryFollowerTooltipDataListener;
		}
	});
});
