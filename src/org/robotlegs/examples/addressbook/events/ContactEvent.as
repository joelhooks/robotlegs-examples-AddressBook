package org.robotlegs.examples.addressbook.events
{
	import org.robotlegs.examples.addressbook.model.vo.Contact;
	
	import flash.events.Event;
	
	public class ContactEvent extends Event
	{
		public static const CREATE:String = "createContact";
		public static const CANCEL_CREATE:String = "cancelCreateContact";
		
		public static const EDIT:String = "contactEdit";
		public static const CANCEL_EDIT:String = "contactCancelEdit";
		
		public static const DELETE:String = "contactDelete";
		
		public static const UPDATE:String = "contactUpdate";
		
		public static const SELECT:String = "contactSelect";
		
		private var _contact:Contact;
		
		public function get contact():Contact
		{
			return _contact;
		}
		
		public function ContactEvent(type:String, contact:Contact = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_contact = contact;
		}

		override public function clone():Event
		{
			return new ContactEvent(type,contact,bubbles,cancelable);
		}
	}
}