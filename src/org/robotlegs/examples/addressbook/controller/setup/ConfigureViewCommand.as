package org.robotlegs.examples.addressbook.controller.setup
{
    import org.robotlegs.examples.addressbook.service.events.ContactServiceEvent;
    import org.robotlegs.examples.addressbook.view.*;
    import org.robotlegs.mvcs.Command;
    
    public class ConfigureViewCommand extends Command
    {
        override public function execute():void
        {
            mediatorMap.mapView(RobotlegsAddressBook, ApplicationMediator);
            mediatorMap.mapView(ContactsView, ContactsViewMediator);
            mediatorMap.mapView(ContactsToolbarView, ContactsToolbarViewMediator);
            mediatorMap.mapView(ContactsTabNavigator, ContactsTabNavigatorMediator);
            mediatorMap.mapView(ContactForm, ContactFormMediator); 
            
            //dispatch(new ContactServiceEvent(ContactServiceEvent.LOAD));
        }
    }
}