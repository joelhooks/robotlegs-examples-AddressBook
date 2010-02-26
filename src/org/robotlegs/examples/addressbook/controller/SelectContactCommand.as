package org.robotlegs.examples.addressbook.controller
{
	import org.robotlegs.examples.addressbook.events.ContactEvent;
	import org.robotlegs.examples.addressbook.model.ContactsModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class SelectContactCommand extends Command
	{
		[Inject]
		public var event:ContactEvent;
		
		[Inject]
		public var model:ContactsModel;
		
		override public function execute():void
		{
			model.selected = event.contact;
		}
	}
}