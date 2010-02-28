package org.robotlegs.examples.addressbook.view
{
    import org.robotlegs.examples.addressbook.events.ContactEvent;
    import org.robotlegs.mvcs.Mediator;
    
    public class ContactFormMediator extends Mediator
    {
        [Inject]
        public var view:ContactForm;
        
        override public function onRegister():void
        {
            eventMap.mapListener(view, ContactEvent.UPDATE, dispatch);
            eventMap.mapListener(view, ContactEvent.DELETE, dispatch);
        }
    }
}