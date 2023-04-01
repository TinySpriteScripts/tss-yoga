-- McKlean-Scripts Server Console Print
local label = [[
	   MK-Yoga
	|||^2  |\  /| |/  ^7|||
	|||^2  | \/ | |\  ^7|||
	  ^2McKleans-Scripts^7
	^6discord.gg/DEWp9TP7p6^7
]]

-- local label = [[
-- 	  ---------- // ^2McKlean-Scripts^7 - ^6discord.gg/DEWp9TP7p6^7 \\ ----------
-- ]]

local function GetCurrentVersion()
	PerformHttpRequest( "https://raw.githubusercontent.com/McKleans-Scripts/mk-version_check/main/mk-yoga-version.txt", function( err, vertext, headers )
		Wait(4000)
		print("\n"..label)

		local MKVersion = GetResourceMetadata(GetCurrentResourceName(), "version")
		print("---------- // Current version: "..MKVersion)
		if ( vertext ~= nil ) then print("---------- // Latest recommended version: "..vertext)
			if ( vertext ~= MKVersion ) then print( "---------- // ^1MK-Yoga is not up to date, please head to your keymaster.fivem.net to update.^7" )
			else print("---------- // ^2MK-Yoga is up to date!^7") end
		else print("---------- // ^1There was an error getting the latest version information.^7") end

		-- Keep Credit where Credit is due
		if ( GetCurrentResourceName() ~= "mk-yoga" ) then
			print( "^1ERROR:^7 Resource name is not ^2mk-yoga^7, expect there to be issues with the resource. ^5Rename the script back to^7: ^2mk-yoga^7 To Receive Support!" )
		end
	end)
end

GetCurrentVersion()