package org.robotlegs.examples.addressbook.model
{
	import org.robotlegs.examples.addressbook.events.ContactEvent;
	import org.robotlegs.examples.addressbook.model.events.ContactsModelEvent;
	import org.robotlegs.examples.addressbook.model.vo.Contact;
	import org.robotlegs.examples.addressbook.service.events.ContactServiceEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	public class ContactsModel extends Actor
	{
		private var _list:ArrayCollection;

		public function get list():ArrayCollection
		{
			return _list;
		}

		public function set list(value:ArrayCollection):void
		{
			_list = value;
		}
		
		private var _selected:Contact;

		public function get selected():Contact
		{
			return _selected;
		}

		public function set selected(value:Contact):void
		{
			_selected = value;
			dispatch(new ContactsModelEvent(ContactsModelEvent.SELECTED));
		}
		
		public function create():Contact
		{
			var contact:Contact = new Contact();
			selected = contact;
			dispatch(new ContactsModelEvent(ContactsModelEvent.CREATED));
			return contact;
		}
		
		public function remove(contact:Contact):void
		{
			var contactIndex:int = list.getItemIndex(contact);
			if(contactIndex > -1) list.removeItemAt(contactIndex);
			if(selected == contact) selected = null;
			dispatch(new ContactsModelEvent(ContactsModelEvent.REMOVED));
		}
	}
}