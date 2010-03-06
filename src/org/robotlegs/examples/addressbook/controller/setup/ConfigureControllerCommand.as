package org.robotlegs.examples.addressbook.controller.setup
{
    import org.robotlegs.examples.addressbook.controller.*;
    import org.robotlegs.examples.addressbook.events.ApplicationConfigurationEvent;
    import org.robotlegs.examples.addressbook.events.ContactEvent;
    import org.robotlegs.examples.addressbook.service.events.ContactServiceEvent;
    import org.robotlegs.examples.addressbook.view.events.ContactTabNavigatorEvent;
    import org.robotlegs.mvcs.Command;
    
    public class ConfigureControllerCommand extends Command
    {
        override public function execute():void
        {
            commandMap.mapEvent(ContactEvent.UPDATE, SaveContactCommand, ContactEvent);
            commandMap.mapEvent(ContactEvent.CREATE, CreateContactCommand, ContactEvent);
            commandMap.mapEvent(ContactEvent.CANCEL_CREATE, CreateContactCancelCommand, ContactEvent);
            commandMap.mapEvent(ContactEvent.DELETE, DeleteContactCommand, ContactEvent);
            commandMap.mapEvent(ContactEvent.SELECT, SelectContactCommand, ContactEvent);
            commandMap.mapEvent(ContactServiceEvent.LOAD, LoadContactsCommand, ContactServiceEvent);
            commandMap.mapEvent(ContactTabNavigatorEvent.ALL_TABS_CLOSED, AllTabsClosedCommand); 
            
            dispatch(new ApplicationConfigurationEvent(ApplicationConfigurationEvent.CONFIGURE_SERVICE));
        }
    }
}