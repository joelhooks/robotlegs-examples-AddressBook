package org.robotlegs.examples.addressbook.service
{
	import com.probertson.data.QueuedStatement;
	import com.probertson.data.SQLRunner;
	
	import flash.data.SQLResult;
	import flash.errors.SQLError;
	import flash.events.SQLErrorEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.examples.addressbook.model.ContactsModel;
	import org.robotlegs.examples.addressbook.model.vo.Contact;
	import org.robotlegs.examples.addressbook.service.events.ContactServiceEvent;
	import org.robotlegs.mvcs.Actor;
	
	public class SQLContactService extends Actor implements IContactService
	{
		[Inject]
		public var model:ContactsModel;
		
		[Inject]
		public var sqlRunner:SQLRunner;
        
        protected var newContact:Contact;
		
		public function load():void
		{
			sqlRunner.execute(LOAD_CONTACTS_SQL, null, load_result, Contact);
		}
		
		private function load_result(result:SQLResult):void
		{
			model.list = new ArrayCollection(result.data);
			dispatch(new ContactServiceEvent(ContactServiceEvent.LOADED));
		}
		
		
		public function save(contact:Contact):void
		{
			if(!model.list.contains(contact))
			{
				addNew(contact);
			}
			else
			{
				update(contact);
			}
		}
		
		private function addNew(contact:Contact):void
		{
			var params:Object = new Object();
			params["firstName"] = contact.firstName;
			params["lastName"] = contact.lastName;
			params["address"] = contact.address;
			params["city"] = contact.city;
			params["state"] = contact.state;
			params["zip"] = contact.zip;
			params["phone"] = contact.phone;
			params["email"] = contact.email;
			
            newContact = contact;
			
			sqlRunner.executeModify(Vector.<QueuedStatement>([new QueuedStatement(ADD_CONTACT_SQL, params)]), addNew_result, database_error);
		}
		
		private function addNew_result(results:Vector.<SQLResult>):void
		{
			var result:SQLResult = results[0];
			if (result.rowsAffected > 0)
			{
				var contactId:Number = result.lastInsertRowID;
				loadNewContact(contactId);
			}
			else
			{
				dispatch(new ContactServiceEvent(ContactServiceEvent.SAVED));
			}
		}
		
		private function loadNewContact(contactId:int):void
		{
			sqlRunner.execute(LOAD_CONTACT_SQL, {contactId:contactId}, loadNewContact_result, Contact);
		}
		
		private function loadNewContact_result(result:SQLResult):void
		{
			if (result.data != null && result.data.length > 0)
			{
				var contact:Contact = result.data[0];
                newContact.update(contact)
				model.list.addItem(newContact);
				model.selected = newContact;
                newContact = null;
			}
			dispatch(new ContactServiceEvent(ContactServiceEvent.SAVED));
		}
		
		private function update(contact:Contact):void
		{
			var params:Object = new Object();
			params["contactId"] = contact.contactId;
			params["firstName"] = contact.firstName;
			params["lastName"] = contact.lastName;
			params["address"] = contact.address;
			params["city"] = contact.city;
			params["state"] = contact.state;
			params["zip"] = contact.zip;
			params["phone"] = contact.phone;
			params["email"] = contact.email;
			
			sqlRunner.executeModify(Vector.<QueuedStatement>([new QueuedStatement(UPDATE_CONTACT_SQL, params)]), update_result, database_error);
		}
		
		private function update_result(results:Vector.<SQLResult>):void
		{
			dispatch(new ContactServiceEvent(ContactServiceEvent.SAVED));
		}
		
		
		public function remove(contact:Contact):void
		{
			model.remove(contact);
			sqlRunner.executeModify(Vector.<QueuedStatement>([new QueuedStatement(DELETE_CONTACT_SQL, {contactId:contact.contactId})]), remove_result, database_error);
		}
		
		private function remove_result(results:Vector.<SQLResult>):void
		{
			
		}
		
		
		
		
		private function database_error(error:SQLError):void
		{
			dispatch(new SQLErrorEvent(SQLErrorEvent.ERROR, false, false, error));
		}
		
		
		// ------- SQL statements -------
		
		[Embed(source="sql/LoadContacts.sql", mimeType="application/octet-stream")]
		private static const LoadContactsStatementText:Class;
		private static const LOAD_CONTACTS_SQL:String = new LoadContactsStatementText();
		
		[Embed(source="sql/LoadContact.sql", mimeType="application/octet-stream")]
		private static const LoadContactStatementText:Class;
		private static const LOAD_CONTACT_SQL:String = new LoadContactStatementText();
		
		[Embed(source="sql/AddContact.sql", mimeType="application/octet-stream")]
		private static const AddContactStatementText:Class;
		private static const ADD_CONTACT_SQL:String = new AddContactStatementText();
		
		[Embed(source="sql/UpdateContact.sql", mimeType="application/octet-stream")]
		private static const UpdateContactStatementText:Class;
		private static const UPDATE_CONTACT_SQL:String = new UpdateContactStatementText();
		
		[Embed(source="sql/DeleteContact.sql", mimeType="application/octet-stream")]
		private static const DeleteContactStatementText:Class;
		private static const DELETE_CONTACT_SQL:String = new DeleteContactStatementText();
	}
}