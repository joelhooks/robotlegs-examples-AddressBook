package org.robotlegs.examples.addressbook.view
{
    import mx.containers.Canvas;
    
    import org.robotlegs.examples.addressbook.events.ContactEvent;
    import org.robotlegs.examples.addressbook.model.ContactsModel;
    import org.robotlegs.examples.addressbook.model.events.ContactsModelEvent;
    import org.robotlegs.examples.addressbook.model.vo.Contact;
    import org.robotlegs.examples.addressbook.view.events.ContactTabNavigatorEvent;
    import org.robotlegs.mvcs.Mediator;
    
    public class ContactsTabNavigatorMediator extends Mediator
    {
        [Inject]
        public var view:ContactsTabNavigator;
        
        [Inject]
        public var model:ContactsModel;
        
        override public function onRegister():void
        {
            eventMap.mapListener( eventDispatcher, ContactsModelEvent.SELECTED, openFormOnEvent );
            eventMap.mapListener( eventDispatcher, ContactEvent.DELETE, handleContactDelete );
            eventMap.mapListener( view, ContactEvent.SELECT, dispatch );
            eventMap.mapListener( view, ContactEvent.CANCEL_CREATE, dispatch );
            eventMap.mapListener( view, ContactTabNavigatorEvent.ALL_TABS_CLOSED, dispatch );
        }
        
        protected function handleContactDelete(event:ContactEvent):void
        {
            view.removeContact(event.contact);
        }
        
        protected function openFormOnEvent(event:ContactsModelEvent):void
        {
            view.openContactForm(model.selected);
        }
    }
}