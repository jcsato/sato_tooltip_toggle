::mods_registerMod("sato_tooltip_toggle", 0.1, "Sato Tooltip Toggle");

::mods_queue("sato_tooltip_toggle", null, function() {
	::include("script_hooks/stt_suppress_tooltips");
});
