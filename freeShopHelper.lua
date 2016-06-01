local keyUrl = "https://3ds.titlekeys.com/downloadenc"
local keyPath = "/freeShop/encTitleKeys.bin"
local green = Color.new(0,255,0)
local red = Color.new(255,0,0)
local white = Color.new(255,255,255)
local orange = Color.new(255,69,0)
local curPos = 15

local pad = Controls.read()


function download(site)
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	Screen.waitVblankStart()
	Screen.flip()
	if Network.isWifiEnabled() then
		Screen.debugPrint(5,5, "Downloading encTitleKeys.bin", orange, TOP_SCREEN)
		Network.downloadFile(keyUrl, keyPath)
		Screen.debugPrint(5,20, "Tickets downloaded!", green, TOP_SCREEN)
		Screen.debugPrint(5,35, "Press START to go back to home screen", green, TOP_SCREEN)
		Screen.debugPrint(5,50, "Press SELECT to reboot the system", green, TOP_SCREEN)
		
		while true do
			pad = Controls.read()
			if Controls.check(pad,KEY_START) then
				Screen.flip()
				Screen.waitVblankStart()
				System.exit()
			elseif Controls.check(pad,KEY_SELECT) then
				System.reboot()
			end
		end
		
	else
		Screen.debugPrint(5,5, "Please turn on your WiFi connection.", red, TOP_SCREEN)
		Screen.debugPrint(5,20, "Press START to go back to home screen", red, TOP_SCREEN)
		Screen.debugPrint(5,35, "Press SELECT to reboot the system", red, TOP_SCREEN)
		
		while true do
			pad = Controls.read()
			if Controls.check(pad, KEY_START) then
				Screen.flip()
				Screen.waitVblankStart()
				System.exit()
			elseif Controls.check(pad,KEY_SELECT) then
				System.reboot()
			end
		end
	end
end

function main()
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	Screen.debugPrint(15,5, "freeShop Helper v1.0", white, TOP_SCREEN)
	Screen.debugPrint(0, curPos, "*", red, TOP_SCREEN)
	Screen.debugPrint(15,15, "Download encTitleKeys", white, TOP_SCREEN)
	Screen.debugPrint(15,30, "Check if file is on the SD", white, TOP_SCREEN)
	Screen.debugPrint(15,45, "Go back to home screen", white, TOP_SCREEN)
	Screen.debugPrint(15,60, "Reboot the system", white, TOP_SCREEN)
	Screen.flip()
end
	
main()
while true do

	pad = Controls.read()
	
	if Controls.check(pad, KEY_DDOWN) then	
		if (curPos < 60) then
			curPos = curPos + 15
			main()
		end
	elseif Controls.check(pad,KEY_DUP) then 
		if (curPos > 15) then
			curPos = curPos - 15
			main()
		end
	elseif Controls.check(pad,KEY_A) then 
		if (curPos == 15) then
			download(keyURL)
		elseif (curPos == 30) then
			Screen.debugPrint(5,5, "This will be implemented in a later build", red, BOT_SCREEN)
		elseif (curPos == 45) then
			Screen.flip()
			Screen.waitVblankStart()
			System.exit()
		elseif (curPos == 60) then
			System.reboot()
		end
	end
end
	
		