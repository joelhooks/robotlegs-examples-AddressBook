package org.robotlegs.examples.addressbook
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.examples.addressbook.controller.*;
	import org.robotlegs.examples.addressbook.controller.setup.ConfigureDatabaseCommand;
	import org.robotlegs.examples.addressbook.controller.setup.ConfigureServiceCommand;
	import org.robotlegs.examples.addressbook.controller.setup.StartupCommand;
	import org.robotlegs.examples.addressbook.events.ApplicationConfigurationEvent;
	import org.robotlegs.examples.addressbook.events.ContactEvent;
	import org.robotlegs.examples.addressbook.model.ContactsModel;
	import org.robotlegs.examples.addressbook.service.*;
	import org.robotlegs.examples.addressbook.view.*;
	import org.robotlegs.examples.addressbook.view.events.ContactTabNavigatorEvent;
	import org.robotlegs.mvcs.Context;

	public class AddressBookContext extends Context
	{
		override public function startup():void
		{
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand, ContextEvent, true);
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}