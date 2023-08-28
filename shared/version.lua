-- McKlean-Scripts Server Console Print
local NotUpToDate = [[
	|||^2  |\  /| |/   ^7||| ^1MK-Yoga is not up to date, please head to your ^6keymaster.fivem.net^7^1 to update.^7
	|||^2  | \/ | |\   ^7||| ^2McKleans-Scripts^7 ]]

local UpToDate = [[
	|||^2  |\  /| |/   ^7||| MK-Yoga
	|||^2  | \/ | |\   ^7||| ^2McKleans-Scripts^7 ]]

local Error = [[
	|||^2  |\  /| |/   ^7||| ^1ERROR:^7 There was an error getting the latest version information.
	|||^2  | \/ | |\   ^7||| ^2McKleans-Scripts^7 ]]

local ResourceName = [[
		^1ERROR:^7 Wrong Resource Name Detected!!!
	|||^2  |\  /| |/   ^7||| Resource name is not ^2mk-yoga^7, expect there to be issues with the resource.
	|||^2  | \/ | |\   ^7||| ^5Rename the script back to^7: ^2mk-yoga^7 To Receive Support! ]]

-- Returns the current version set in fxmanifest.lua
local function GetCurrentVersion()
	PerformHttpRequest( "https://raw.githubusercontent.com/McKleans-Scripts/mk-version_check/main/mk-yoga-version.txt", function( err, vertext, headers )
		Wait(3000)
		local MKVersion = GetResourceMetadata(GetCurrentResourceName(), "version")
		if ( vertext ~= MKVersion ) then print(NotUpToDate) elseif ( vertext == MKVersion ) then print(UpToDate) else print(Error) end
		-- If Resource Name has been changed print this
		if ( GetCurrentResourceName() ~= "mk-yoga" ) then print(ResourceName) end
	end)
end
GetCurrentVersion()