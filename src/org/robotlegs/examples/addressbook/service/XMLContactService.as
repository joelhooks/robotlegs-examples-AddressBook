package org.robotlegs.examples.addressbook.service
{
	import org.robotlegs.examples.addressbook.model.ContactsModel;
	import org.robotlegs.examples.addressbook.model.vo.Contact;
	import org.robotlegs.examples.addressbook.service.events.ContactServiceEvent;
	import org.robotlegs.examples.addressbook.service.helpers.ContactXMLParser;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	public class XMLContactService extends Actor implements IContactService
	{
		[Embed(source="/data/contacts.xml",mimeType="text/xml")]
		protected var ContactsXML:Class;
		
		[Inject]
		public var model:ContactsModel;
		
		public function load():void
		{
			var xml:XML = XML( ContactsXML.data );
			model.list = ContactXMLParser.getCollection(xml);
			dispatch(new ContactServiceEvent(ContactServiceEvent.LOADED));
		}
		
		public function save(contact:Contact):void
		{
			if(!model.list.contains(contact))
				model.list.addItem(contact);
			if(contact.id == 0)
				getNextId(contact);
			dispatch(new ContactServiceEvent(ContactServiceEvent.SAVED));
		}
		
		protected function getNextId(forContact:Contact):void
		{
			var id:int = 0;
			for each(var contact:Contact in model.list)
			{
				if(contact.id > id)
					id = contact.id;
			}
			forContact.id = id++;
		}
		
		public function remove(contact:Contact):void
		{
			model.remove(contact);
		}
	}
}