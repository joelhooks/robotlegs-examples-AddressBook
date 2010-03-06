package org.robotlegs.examples.addressbook
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.examples.addressbook.controller.setup.StartupCommand;
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