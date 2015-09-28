package ddassistant.sync;

import ddassistant.sync.TestClass;

/**
 * Syncable class
 * @author dunkean
 */

#if !macro
@:autoBuild(ddassistant.sync.SyncableMacro.buildSyncableMacro()) 
#end
interface Syncable
{
	
}
