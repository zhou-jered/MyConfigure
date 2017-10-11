on run argv
	
	if (count argv) > 0 then
		set userSu to "irteamsu"
	else
		set userSu to "irteam"
	end if
	set homefolder to (path to home folder)
	set hostList to (get hostList of (load script file ((homefolder as text) & "scripts:hostlist.scpt")))
	
	set loginHost to ((choose from list hostList with title "Choose Your Host" with prompt "Choose Host" OK button name "Let's go" cancel button name "No Host Here" with empty selection allowed without multiple selections allowed) as text)
	
	set resp to (display dialog "Enter Yubi-Key Here" default answer "" buttons {"Cancel", "OK"} default button "OK")
	
	set btnReturn to (button returned of resp)
	set yubi to (text returned of resp)
	
	if btnReturn = "Cancel" then
		"canceled"
	else
		yubiLogin(yubi, getHostname to loginHost, "", userSu)
	end if
	
end run




on yubiLogin(yubi, Hostname, pwd, user)
	set cmd to ("cd && " & "scripts/kos.sh " & Hostname & " " & user & " " & yubi)
	tell application "iTerm"
		set nw to (create window with default profile)
		tell current session of current tab of nw
			write text cmd
		end tell
	end tell
end yubiLogin


on getHostname to hostDes
	return item 1 of (words of hostDes)
end getHostname
