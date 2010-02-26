package org.robotlegs.examples.addressbook
{
	import org.robotlegs.examples.addressbook.controller.*;
	import org.robotlegs.examples.addressbook.events.ContactEvent;
	import org.robotlegs.examples.addressbook.model.ContactsModel;
	import org.robotlegs.examples.addressbook.service.*;
	import org.robotlegs.examples.addressbook.service.events.ContactServiceEvent;
	import org.robotlegs.examples.addressbook.view.*;
	
	import org.robotlegs.mvcs.Context;

	public class AddressBookContext extends Context
	{
		override public function startup():void
		{
			injector.mapSingleton(ContactsModel);
			injector.mapSingletonOf(IContactService, XMLContactService);
			
			mediatorMap.mapView(ContactsView, ContactsViewMediator);
			mediatorMap.mapView(EditContactView, EditContactViewMediator);
			mediatorMap.mapView(ContactsToolbarView, ContactsToolbarViewMediator);
			
			commandMap.mapEvent(ContactServiceEvent.LOAD, LoadContactsCommand, ContactServiceEvent);
			commandMap.mapEvent(ContactEvent.UPDATE, SaveContactCommand, ContactEvent);
			commandMap.mapEvent(ContactEvent.CREATE, CreateContactCommand);
			commandMap.mapEvent(ContactEvent.CANCEL_CREATE, CreateContactCancelCommand);
			commandMap.mapEvent(ContactEvent.DELETE, DeleteContactCommand);
			commandMap.mapEvent(ContactEvent.EDIT, EditContactCommand);
			commandMap.mapEvent(ContactEvent.CANCEL_EDIT, EditContactCancelCommand);
			commandMap.mapEvent(ContactEvent.SELECT, SelectContactCommand);
		}
	}
}