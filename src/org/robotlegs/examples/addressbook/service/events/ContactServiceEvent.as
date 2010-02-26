package org.robotlegs.examples.addressbook.service.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class ContactServiceEvent extends Event
	{
		public static const LOAD:String = "contactService_load";
		public static const LOADED:String = "contactSerivce_loaded";
		public static const SAVED:String = "contactService_saved";
		public static const REMOVED:String = "contactService_removed";
		
		public function ContactServiceEvent(type:String,  bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new ContactServiceEvent(type,bubbles,cancelable);
		}
	}
}