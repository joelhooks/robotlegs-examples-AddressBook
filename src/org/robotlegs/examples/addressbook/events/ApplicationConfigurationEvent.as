package org.robotlegs.examples.addressbook.events
{
	import flash.events.Event;
	
	public class ApplicationConfigurationEvent extends Event
	{
		public static const CONFIGURE_SERVICE:String = "configureService";
        public static const CONFIGURE_VIEW:String = "configureViews";
        public static const CONFIGURE_MODEL:String = "configureModel";
        public static const CONFIGURE_CONTROLLER:String = "configureController";
		public static const CONFIGURE_DATABASE:String = "configureDatabase";
				
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