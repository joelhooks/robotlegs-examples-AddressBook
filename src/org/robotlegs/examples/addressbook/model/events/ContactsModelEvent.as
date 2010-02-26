package org.robotlegs.examples.addressbook.model.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class ContactsModelEvent extends Event
	{
		public static const SELECTED:String = "contactModel_contactSelected";
		public static const EDITING:String = "contactModel_contactEditing";
		public static const CREATED:String = "contactModel_contactCreated";
		public static const REMOVED:String = "contactModel_contactRemoved";
		
		public function ContactsModelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ContactsModelEvent(type,bubbles,cancelable);
		}
	}
}