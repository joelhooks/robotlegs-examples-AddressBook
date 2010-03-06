CREATE TABLE main.contacts
(
	contactId int PRIMARY KEY AUTOINCREMENT,
	firstName String NOT NULL,
	lastName String NOT NULL,
	address String,
	city String,
	state String,
	zip String,
	phone String,
	email String
)