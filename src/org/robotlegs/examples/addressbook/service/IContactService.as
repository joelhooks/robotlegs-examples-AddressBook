package org.robotlegs.examples.addressbook.service
{
	import org.robotlegs.examples.addressbook.model.vo.Contact;

	public interface IContactService
	{
		function load():void;
		function save(contact:Contact):void;
		function remove(contact:Contact):void;
	}
}