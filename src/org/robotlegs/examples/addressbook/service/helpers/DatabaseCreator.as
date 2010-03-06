package org.robotlegs.examples.addressbook.service.helpers
{
    import com.probertson.data.QueuedStatement;
    import com.probertson.data.SQLRunner;
    
    import flash.data.SQLResult;
    import flash.errors.SQLError;
    import flash.events.IEventDispatcher;
    import flash.events.SQLErrorEvent;
    
    import org.robotlegs.examples.addressbook.events.ApplicationConfigurationEvent;
    import org.robotlegs.mvcs.Actor;

    public class DatabaseCreator extends Actor
    {
        [Inject]
        public var sqlRunner:SQLRunner;
        
        public function createDatabaseStructure():void
        {
            var stmts:Vector.<QueuedStatement> = new Vector.<QueuedStatement>();
            stmts[stmts.length] = new QueuedStatement(CREATE_CONTACTS_SQL);
            stmts[stmts.length] = new QueuedStatement(POPULATE_CONTACTS_SQL);
            
            sqlRunner.executeModify(stmts, executeBatch_complete, executeBatch_error, null);
        }
        
        private function executeBatch_complete(results:Vector.<SQLResult>):void
        {
            dispatch(new ApplicationConfigurationEvent(ApplicationConfigurationEvent.CONFIGURE_MODEL));
        }
        
        
        private function executeBatch_error(error:SQLError):void
        {
            dispatch(new SQLErrorEvent(SQLErrorEvent.ERROR, false, false, error));
        }
        
        // ------- SQL statements -------
        
        [Embed(source="sql/create/CreateTableContacts.sql", mimeType="application/octet-stream")]
        private static const CreateContactsStatementText:Class;
        private static const CREATE_CONTACTS_SQL:String = new CreateContactsStatementText();
        
        [Embed(source="sql/create/PopulateContacts.sql", mimeType="application/octet-stream")]
        private static const PopulateContactsStatementText:Class;
        private static const POPULATE_CONTACTS_SQL:String = new PopulateContactsStatementText();
    }
}