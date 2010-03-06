INSERT INTO main.contacts (contactId, firstName, lastName, address, city, state, zip, phone, email)
SELECT 1, 'Joel', 'Hooks', '2222 A St.', 'Fort Worth', 'TX', '76112', '817-555-1432', 'joelhooks@gmail.com' UNION
SELECT 2, 'Paul', 'Robertson', '1401 B St.', 'Dublin', 'CA', '94568', '925-555-1110', 'paul@probertson.com'