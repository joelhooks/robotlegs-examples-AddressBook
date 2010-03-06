package org.robotlegs.examples.addressbook.controller.setup
{
	import org.robotlegs.examples.addressbook.events.ApplicationConfigurationEvent;
	import org.robotlegs.examples.addressbook.events.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	public class StartupCommand extends Command
	{
		[Inject]
		public var event:ContextEvent;
		
		public function StartupCommand()
		{
			super();
		}
		
		
		override public function execute():void
		{
			dispatch(new ApplicationConfigurationEvent(ApplicationConfigurationEvent.CONFIGURE_SERVICES));
		}
	}
}