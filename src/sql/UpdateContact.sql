UPDATE main.contacts
SET firstName = :firstName,
	lastName = :lastName,
	address = :address,
	city = :city,
	state = :state,
	zip = :zip,
	phone = :phone,
	email = :email
WHERE contactId = :contactId