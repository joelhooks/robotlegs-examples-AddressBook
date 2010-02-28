package org.robotlegs.examples.addressbook.controller
{
    import org.robotlegs.examples.addressbook.model.ContactsModel;
    import org.robotlegs.mvcs.Command;
    
    public class AllTabsClosedCommand extends Command
    {
        [Inject]
        public var model:ContactsModel;
        
        override public function execute():void
        {
            model.selected = null;
        }
    }
}