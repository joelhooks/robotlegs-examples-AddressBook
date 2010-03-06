package org.robotlegs.examples.addressbook.events
{
	import flash.events.Event;
	
	public class ContextEvent extends Event
	{
		public static const STARTUP:String = "startup";
		
		
		public function ContextEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{ 
			super(type, bubbles, cancelable);
		} 
		
		
		public override function clone():Event
		{ 
			return new ContextEvent(type, bubbles, cancelable);
		} 
		
		
		public override function toString():String
		{ 
			return formatToString("ContextEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}
}