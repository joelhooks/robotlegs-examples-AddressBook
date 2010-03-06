package org.robotlegs.examples.addressbook.controller.setup
{
	import org.robotlegs.examples.addressbook.service.helpers.DatabaseCreator;
	import org.robotlegs.mvcs.Command;
	
	public class ConfigureDatabaseCommand extends Command
	{
		override public function execute():void
		{
            var creator:DatabaseCreator = injector.instantiate(DatabaseCreator);
            creator.createDatabaseStructure();
		}
	}
}