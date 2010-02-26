package org.robotlegs.examples.addressbook.controller
{
	import org.robotlegs.examples.addressbook.events.ContactEvent;
	import org.robotlegs.examples.addressbook.service.IContactService;
	
	import org.robotlegs.mvcs.Command;
	
	public class DeleteContactCommand extends Command
	{
		[Inject]
		public var event:ContactEvent;
		
		[Inject]
		public var service:IContactService;
		
		override public function execute():void
		{
			service.remove(event.contact);
		}
	}
}