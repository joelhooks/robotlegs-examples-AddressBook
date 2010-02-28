package org.robotlegs.examples.addressbook.view
{
	import flash.events.Event;
	
	import org.robotlegs.examples.addressbook.events.ContactEvent;
	import org.robotlegs.examples.addressbook.model.ContactsModel;
	import org.robotlegs.examples.addressbook.model.events.ContactsModelEvent;
	import org.robotlegs.examples.addressbook.service.events.ContactServiceEvent;
	import org.robotlegs.examples.addressbook.view.events.ContactTabNavigatorEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class ContactsViewMediator extends Mediator
	{
		[Inject]
		public var view:ContactsView;
		
		[Inject]
		public var model:ContactsModel;
		
		override public function onRegister():void
		{
			eventMap.mapListener( eventDispatcher, ContactServiceEvent.LOADED, handleContactsLoaded );
			eventMap.mapListener( eventDispatcher, ContactServiceEvent.SAVED, handleContactSaved);
			
			eventMap.mapListener( eventDispatcher, ContactEvent.CREATE, disableViewOnEvent);
			eventMap.mapListener( eventDispatcher, ContactEvent.CANCEL_CREATE, enableViewOnEvent);
            
            eventMap.mapListener( eventDispatcher,ContactsModelEvent.SELECTED, handleContactSelected);
			
			eventMap.mapListener( view, ContactEvent.SELECT, dispatch );
			eventMap.mapListener( view, ContactEvent.EDIT, dispatch );
			
			dispatch(new ContactServiceEvent(ContactServiceEvent.LOAD));
        }
        
        protected function handleContactSelected(event:Event):void
        {
            view.selectContact(model.selected);
        }
		
		protected function handleContactsLoaded(event:ContactServiceEvent):void
		{
			view.dataProvider = model.list;
		}
		
		protected function handleContactSaved(event:ContactServiceEvent):void
		{
			enableViewOnEvent(event);
			view.selectContact(model.selected);
		}
		
		protected function disableViewOnEvent(event:Event):void
		{
			view.viewEnabled = false;
		}
		
		protected function enableViewOnEvent(event:Event):void
		{
			view.viewEnabled = true;
		}
	}
}