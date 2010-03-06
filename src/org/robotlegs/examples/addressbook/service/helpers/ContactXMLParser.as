package org.robotlegs.examples.addressbook.service.helpers
{
	import org.robotlegs.examples.addressbook.model.vo.Contact;
	
	import mx.collections.ArrayCollection;

	public class ContactXMLParser
	{
		public static function getCollection(xml:XML):ArrayCollection
		{
			var contacts:ArrayCollection = new ArrayCollection();
			for each(var contactXML:XML in xml.contact)
			{
				var contact:Contact = new Contact();
				contact.contactId = contactXML.@id;
				contact.firstName = contactXML.@firstName;
                contact.lastName = contactXML.@lastName
				contact.phone = contactXML.@phone;
                contact.email = contactXML.@email;
                contact.address = contactXML.@address;
                contact.city = contactXML.@city;
                contact.state = contactXML.@state;
                contact.zip = contactXML.@zip;
				contacts.addItem(contact);
			}
			return contacts;
		}
	}
}