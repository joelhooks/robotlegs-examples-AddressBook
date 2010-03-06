package org.robotlegs.examples.addressbook.events
{
	import flash.events.Event;
	
	public class ApplicationConfigurationEvent extends Event
	{
		public static const CONFIGURE_SERVICES:String = "configureServices";
		public static const CREATE_DATABASE:String = "createDatabase";
		public static const DATABASE_READY:String = "databaseReady";
		
		
		public function ApplicationConfigurationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		
		public override function clone():Event
		{ 
			return new ApplicationConfigurationEvent(type, bubbles, cancelable);
		} 
		
		
		public override function toString():String
		{ 
			return formatToString("ApplicationConfigurationEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}
}