package org.robotlegs.examples.addressbook.view
{
	import org.robotlegs.examples.addressbook.events.ContactEvent;
	import org.robotlegs.examples.addressbook.model.ContactsModel;
	import org.robotlegs.examples.addressbook.model.events.ContactsModelEvent;
	import org.robotlegs.examples.addressbook.model.vo.Contact;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class EditContactViewMediator extends Mediator
	{
		[Inject]
		public var view:EditContactView;
		
		[Inject]
		public var model:ContactsModel;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, ContactsModelEvent.EDITING, handleContactEditing);
			eventMap.mapListener(view, ContactEvent.CANCEL_EDIT, dispatch);
			eventMap.mapListener(view, ContactEvent.CANCEL_CREATE, dispatch);
			eventMap.mapListener(view, ContactEvent.UPDATE, dispatch);
		}
		
		protected function handleContactEditing(event:ContactsModelEvent):void
		{
			var contact:Contact = model.editing;
			view.clearForm();
			view.contact = contact;
			view.focusOnName();
		}
	}
}