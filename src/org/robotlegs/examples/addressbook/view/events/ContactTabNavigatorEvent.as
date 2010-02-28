package org.robotlegs.examples.addressbook.view.events
{
    import flash.events.Event;
    
    public class ContactTabNavigatorEvent extends Event
    {
        public static const ALL_TABS_CLOSED:String = "allTabsClosed";
        
        public function ContactTabNavigatorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }
        
        override public function clone():Event
        {
            return new ContactTabNavigatorEvent(type,bubbles,cancelable);
        }
    }
}