package org.robotlegs.examples.addressbook
{
	import org.robotlegs.examples.addressbook.controller.*;
	import org.robotlegs.examples.addressbook.controller.setup.ConfigureServiceCommand;
	import org.robotlegs.examples.addressbook.controller.setup.CreateDatabaseCommand;
	import org.robotlegs.examples.addressbook.controller.setup.StartupCommand;
	import org.robotlegs.examples.addressbook.events.ApplicationConfigurationEvent;
	import org.robotlegs.examples.addressbook.events.ContactEvent;
	import org.robotlegs.examples.addressbook.events.ContextEvent;
	import org.robotlegs.examples.addressbook.model.ContactsModel;
	import org.robotlegs.examples.addressbook.service.*;
	import org.robotlegs.examples.addressbook.view.*;
	import org.robotlegs.examples.addressbook.view.events.ContactTabNavigatorEvent;
	import org.robotlegs.mvcs.Context;

	public class AddressBookContext extends Context
	{
		override public function startup():void
		{
			injector.mapSingleton(ContactsModel);
//			injector.mapSingletonOf(IContactService, XMLContactService);
//			injector.mapSingletonOf(IContactService, SQLContactService);
			
            mediatorMap.mapView(RobotlegsAddressBook, ApplicationMediator);
			mediatorMap.mapView(ContactsView, ContactsViewMediator);
			mediatorMap.mapView(ContactsToolbarView, ContactsToolbarViewMediator);
            mediatorMap.mapView(ContactsTabNavigator, ContactsTabNavigatorMediator);
            mediatorMap.mapView(ContactForm, ContactFormMediator);
			
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand, ContextEvent, true);
			commandMap.mapEvent(ApplicationConfigurationEvent.CONFIGURE_SERVICES, ConfigureServiceCommand, ApplicationConfigurationEvent, true);
			commandMap.mapEvent(ApplicationConfigurationEvent.CREATE_DATABASE, CreateDatabaseCommand, ApplicationConfigurationEvent, true);
//			commandMap.mapEvent(ContactServiceEvent.LOAD, LoadContactsCommand, ContactServiceEvent);
			commandMap.mapEvent(ContactEvent.UPDATE, SaveContactCommand, ContactEvent);
			commandMap.mapEvent(ContactEvent.CREATE, CreateContactCommand);
			commandMap.mapEvent(ContactEvent.CANCEL_CREATE, CreateContactCancelCommand);
			commandMap.mapEvent(ContactEvent.DELETE, DeleteContactCommand);
			commandMap.mapEvent(ContactEvent.SELECT, SelectContactCommand);
            commandMap.mapEvent(ContactTabNavigatorEvent.ALL_TABS_CLOSED, AllTabsClosedCommand);
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}