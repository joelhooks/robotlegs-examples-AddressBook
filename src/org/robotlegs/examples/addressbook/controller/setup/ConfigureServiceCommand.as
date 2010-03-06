package org.robotlegs.examples.addressbook.controller.setup
{
	import com.probertson.data.SQLRunner;
	
	import flash.filesystem.File;
	
	import org.robotlegs.examples.addressbook.controller.LoadContactsCommand;
	import org.robotlegs.examples.addressbook.events.ApplicationConfigurationEvent;
	import org.robotlegs.examples.addressbook.service.CreateDatabaseService;
	import org.robotlegs.examples.addressbook.service.IContactService;
	import org.robotlegs.examples.addressbook.service.IDatabaseService;
	import org.robotlegs.examples.addressbook.service.SQLContactService;
	import org.robotlegs.examples.addressbook.service.events.ContactServiceEvent;
	import org.robotlegs.mvcs.Command;
	
	public class ConfigureServiceCommand extends Command
	{
		private static const DB_FILE_NAME:String = "AddressBook.db";
		
		override public function execute():void
		{
			var dbFile:File = File.applicationStorageDirectory.resolvePath(DB_FILE_NAME);
			var sqlRunner:SQLRunner = new SQLRunner(dbFile);
			
			injector.mapValue(SQLRunner, sqlRunner);
			
			injector.mapSingletonOf(IDatabaseService, CreateDatabaseService);
			injector.mapSingletonOf(IContactService, SQLContactService);
			commandMap.mapEvent(ContactServiceEvent.LOAD, LoadContactsCommand, ContactServiceEvent);
			
			if (!dbFile.exists)
			{
				dispatch(new ApplicationConfigurationEvent(ApplicationConfigurationEvent.CREATE_DATABASE));
			}
		}
	}
}