---Put together by Jennifer Blom---
---Copy as needed ;)---

--------------------------
-----Available Colors-----
--------------------------
blue = reaper.ColorToNative(0,0,255)|0x1000000
red = reaper.ColorToNative(255,0,0)|0x1000000
green = reaper.ColorToNative(0,255,0)|0x1000000
cyan = reaper.ColorToNative(0,255,255)|0x1000000
magenta = reaper.ColorToNative(255,0,255)|0x1000000
yellow = reaper.ColorToNative(255,255,0)|0x1000000
orange = reaper.ColorToNative(255,125,0)|0x1000000
purple = reaper.ColorToNative(125,0,225)|0x1000000
lightblue = reaper.ColorToNative(13,165,175)|0x1000000
lightgreen = reaper.ColorToNative(125,255,155)|0x1000000
pink = reaper.ColorToNative(225,95,155)|0x1000000
brown = reaper.ColorToNative(125,95,25)|0x1000000
gray = reaper.ColorToNative(125,125,125)|0x1000000
white =  reaper.ColorToNative(255,255,255)|0x1000000
Black =  reaper.ColorToNative(0,0,0)|0x1000000
--------------------------

color = lightblue      --<<<<<<--Marker Color
name = "character_ref/$project/$region" --<<<<<<--The name you want for the file if you want to customize.

---Don't change anything under this line.---
--------------------------
characterName = ""

function msg(m)                         
	reaper.ShowConsoleMsg(tostring(m) .. '\n')
end

function Insert_Marker_Custom_Name_Color()
	reaper.Main_OnCommand(40630, 0)   
	start_cursor_pos = reaper.GetCursorPosition()
	reaper.Main_OnCommand(40631, 0)   
	end_cursor_pos = reaper.GetCursorPosition()
	marker_index, num_markersOut, num_regionsOut = reaper.CountProjectMarkers( 0 )
	region_to_render = reaper.AddProjectMarker2( 0, 1, start_cursor_pos, end_cursor_pos, characterName, marker_index+1,color )
	track = reaper.GetTrack( 0, 0 )
	reaper.SetRegionRenderMatrix( 0, region_to_render, track, 1 )
end

function renderSettings()
	prev_name = ''
	retval, prev_name = reaper.GetSetProjectInfo_String(0, 'RENDER_PATTERN', prev_name, false)

	reaper.GetSetProjectInfo_String(0, 'RENDER_PATTERN', name, true)
	reaper.GetSetProjectInfo(0, 'RENDER_SETTINGS', 8, true)
	reaper.GetSetProjectInfo(0, 'RENDER_BOUNDSFLAG', 3, true)  

	reaper.Main_OnCommand(40521, 0)
	reaper.Main_OnCommand(40342, 0)
	reaper.Main_OnCommand(41824, 0)

	reaper.GetSetProjectInfo_String(0, 'RENDER_PATTERN', prev_name, true)
end

function Main()
	reaper.Undo_BeginBlock()
	retval1, characterName = reaper.GetUserInputs("Character Voice Reference",1,"Which Character is this?:",tostring(characterName))          
	Insert_Marker_Custom_Name_Color()
	reaper.Main_OnCommand(40635, 0)
	reaper.Undo_EndBlock("Insert_Marker_Custom_Name_Color", 0)
	renderSettings()
	reaper.SetRegionRenderMatrix( 0, region_to_render, track, -1 )
end

Main()
reaper.UpdateArrange()
