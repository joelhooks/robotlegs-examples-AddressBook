package org.robotlegs.examples.addressbook.view
{
	import org.robotlegs.examples.addressbook.events.ContactEvent;
	import org.robotlegs.examples.addressbook.model.ContactsModel;
	import org.robotlegs.examples.addressbook.model.events.ContactsModelEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ContactsToolbarViewMediator extends Mediator
	{
		[Inject]
		public var view:ContactsToolbarView;
		
		[Inject]
		public var model:ContactsModel;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, ContactsModelEvent.SELECTED, handleContactSelected);
			eventMap.mapListener(eventDispatcher, ContactsModelEvent.EDITING, handleContactEditing);
			
			eventMap.mapListener(view, ContactEvent.EDIT, dispatch);
			eventMap.mapListener(view, ContactEvent.DELETE, dispatch);
			eventMap.mapListener(view, ContactEvent.CREATE, dispatch);
		}
		
		protected function handleContactSelected(event:ContactsModelEvent):void
		{
			view.selected = model.selected;
		}
		
		protected function handleContactEditing(event:ContactsModelEvent):void
		{
			view.editing = model.editing;
		}
	}
}