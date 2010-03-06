SELECT contactId,
	firstName,
	lastName,
	address,
	city,
	state,
	zip,
	phone,
	email
FROM main.contacts
ORDER BY lastName COLLATE NOCASE, firstName COLLATE NOCASE