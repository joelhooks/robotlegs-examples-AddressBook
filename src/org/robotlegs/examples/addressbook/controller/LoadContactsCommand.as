package org.robotlegs.examples.addressbook.controller
{
	import org.robotlegs.examples.addressbook.service.IContactService;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadContactsCommand extends Command
	{
		[Inject]
		public var service:IContactService;
		
		override public function execute():void
		{
			service.load();
		}
	}
}