package org.robotlegs.examples.addressbook.model.vo
{
    import flash.utils.ByteArray;

	[Bindable]
	public class Contact
	{
		public var contactId:int;
        public var firstName:String;
        public var lastName:String;
        public var address:String;
        public var city:String;
        public var state:String;
        public var zip:String;
        public var phone:String;
        public var email:String;
        public var pic:ByteArray;
        
        public function update(contact:Contact):void
        {
            firstName = contact.firstName;
            lastName = contact.lastName;
            address = contact.address;
            city = contact.city;
            state = contact.state;
            zip = contact.zip;
            phone = contact.phone;
            email = contact.email;
            pic = contact.pic;
        }
	}
}