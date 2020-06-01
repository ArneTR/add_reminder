on alfred_script(q)
	set RemindersList to "Privates"


	# Parse the Date

	set remindMeDate to (current date)
	
	if q contains "tomorrow" then
		set remindMeDate to (current date) + 1 * days
	else if q contains "in 2 days" then
		set remindMeDate to (current date) + 60*24*2 * minutes
	else if q contains "in 3 days" then
		set remindMeDate to (current date) + 60*24*3 * minutes
	else if q contains "in 4 days" then
		set remindMeDate to (current date) + 60*24*4 * minutes
	else if q contains "in 5 days" then
		set remindMeDate to (current date) + 60*24*5 * minutes
	else if q contains "in 6 days" then
		set remindMeDate to (current date) + 60*24*6 * minutes
	else if q contains "in 7 days" then
		set remindMeDate to (current date) + 60*24*7 * minutes
	else if q contains "in 14 days" then
		set remindMeDate to (current date) + 60*24*14 * minutes
	else if q contains "next week" then
		set curWeekDay to weekday of (current date) as string
		if curWeekDay = "Monday" then
			set remindMeDate to (current date) + 7 * days
		else if curWeekDay = "Tuesday" then
			set remindMeDate to (current date) + 6 * days
		else if curWeekDay = "Wednesday" then
			set remindMeDate to (current date) + 5 * days
		else if curWeekDay = "Thursday" then
			set remindMeDate to (current date) + 4 * days
		else if curWeekDay = "Friday" then
			set remindMeDate to (current date) + 3 * days
		else if curWeekDay = "Saturday" then
			set remindMeDate to (current date) + 2 * days
		else if curWeekDay = "Sunday" then
			set remindMeDate to (current date) + 1 * days
		end if
	else if q contains "in 1 week" then
		set remindMeDate to (current date) + 10080 * minutes
	else if q contains "in 1 month" then
		set remindMeDate to (current date) + 43200 * minutes
	else if q contains "in 3 months" then
		set remindMeDate to (current date) + 129600 * minutes
	else if q contains "in 1 year" then
		set remindMeDate to (current date) + 525600 * minutes
	end if

	tell application "Reminders"
	
		tell list RemindersList
		
			make new reminder with properties {name:q, remind me date: remindMeDate}
		
		end tell
	
	end tell

	return {"Task: added to " & RemindersList & "\nDate: " & remindMeDate}

end alfred_script
