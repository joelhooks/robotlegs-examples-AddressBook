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
				contact.id = contactXML.@id;
				contact.name = contactXML.@name;
				contact.phoneNumber = contactXML.@phoneNumber;
				contacts.addItem(contact);
			}
			return contacts;
		}
	}
}