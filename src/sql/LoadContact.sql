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
WHERE contactId = :contactId