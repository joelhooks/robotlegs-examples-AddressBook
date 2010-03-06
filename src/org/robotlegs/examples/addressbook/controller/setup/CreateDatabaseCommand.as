package org.robotlegs.examples.addressbook.controller.setup
{
	import org.robotlegs.examples.addressbook.service.IDatabaseService;
	import org.robotlegs.mvcs.Command;
	
	public class CreateDatabaseCommand extends Command
	{
		[Inject]
		public var databaseService:IDatabaseService;
		
		override public function execute():void
		{
			databaseService.createDatabaseStructure();
			
			// configuring the database file location and related commands
			// this doesn't really belong in this command
//			var dbFile:File = File.applicationStorageDirectory.resolvePath(DB_FILE_NAME);
//			var sqlRunner:SQLRunner = new SQLRunner(dbFile);
//			
//			injector.mapValue(SQLRunner, sqlRunner);
//			
//			injector.mapSingletonOf(IDatabaseService, CreateDatabaseService);
//			injector.mapSingletonOf(IContactService, SQLContactService);
//			commandMap.mapEvent(ContactServiceEvent.LOAD, LoadContactsCommand, ContactServiceEvent);
//			
//			
			// this is the part that actually belongs in this command
//			if (!dbFile.exists)
//			{
//				
//			}
		}
	}
}