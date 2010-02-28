package org.robotlegs.examples.addressbook.view
{
    import flash.events.Event;
    
    import org.robotlegs.examples.addressbook.events.ContactEvent;
    import org.robotlegs.examples.addressbook.model.ContactsModel;
    import org.robotlegs.examples.addressbook.model.events.ContactsModelEvent;
    import org.robotlegs.examples.addressbook.view.events.ContactTabNavigatorEvent;
    import org.robotlegs.mvcs.Mediator;
    
    public class ApplicationMediator extends Mediator
    {
        [Inject]
        public var view:RobotlegsAddressBook;
        
        [Inject]
        public var model:ContactsModel;
        
        override public function onRegister():void
        {
            eventMap.mapListener( eventDispatcher, ContactsModelEvent.SELECTED, handleContactSelected );
            eventMap.mapListener( eventDispatcher, ContactTabNavigatorEvent.ALL_TABS_CLOSED, handleAllTabsClosed );
        }
        
        protected function handleAllTabsClosed(event:Event):void
        {
            view.currentState = RobotlegsAddressBook.HIDE_CONTACT_DETAILS;
        }
        
        protected function handleContactSelected(event:ContactsModelEvent):void
        {
            if(model.selected)
                view.currentState = RobotlegsAddressBook.SHOW_CONTACT_DETAILS;
        }
    }
}