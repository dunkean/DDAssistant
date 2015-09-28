package ddassistant.sync;

import haxe.macro.Expr;
import haxe.macro.Context;
import ddassistant.sync.TestClass;
import ddassistant.models.Player;

/**
 * Add static notifications to syncable class
 * @author dunkean
 * @version 0.1
 */
class SyncableMacro
{
	#if macro
 
    macro static public function buildSyncableMacro():Array<Field> {
        var fields = Context.getBuildFields();
        var res = [];

        for (o in fields) {
            if (isSyncable(o)) buildField(o, res)
            else res.push(o);
        }

        return res;
    }

    private static function isSyncable(field:Field):Bool {
        for (o in field.meta) {
            if (o.name == ":unsyncable") return false;
        }

        return true;
    }

    private static function buildField(field:Field, res:Array<Field>):Void {
        switch (field.kind) {
            case FVar(type, expr):
                res.push(field);

                var setterAccess = [Access.APublic];
                var fieldName = field.name;

                field.kind = FProp("default", "set", type, expr);

                var setter = macro function foo(value:$type) {
					Player.sync(this.uuid, '$fieldName', this.$fieldName, value);
					this.$fieldName = value;
                    return value;
                };

                res.push({
                name: 'set_$fieldName',
                kind: FFun(switch (setter.expr) { case EFunction (_, func): func; case _: throw false; }),
                pos: field.pos,
                access: setterAccess
                });

            case _:
                res.push(field);
        }
    }
    #end
	 
	
}


//public static function build():Array<Field> {
        //var fields = Context.getBuildFields();
		//
		//var tmp: Array<Field> = [];
		//for (field in fields)
			//tmp.push(field);
		//
		//for (field in tmp) {
			//var setterBody = macro {
				//$(field.name) = v;
				//TestClass.sync( $(field.name), v );
				//return $(field.name);
			//};
				//fields.push({
					//pos: Context.currentPos(),
					//name: "set_" + macro { $(field.name);  },
					//meta: [],
					//kind: FieldType.FFun({
						//ret: macro :String,
						//params: [],
						//expr: setterBody,
						//args: [{
							//value: null,
							//type: macro :String,
							//opt: false,
							//name: "v"
						//}]
					//}),
					//doc: "",
					//access: []
				//});
		//}
		//
        //
        //return fields;
    //}

//
//package macros;
//
//import haxe.macro.Context;
//import haxe.macro.Expr;
//
//using haxe.macro.Tools;
//using Lambda;
//
//class SetterMacro {
    //#if macro
    //macro static public function buildIBindable():Array<Field> {
        //var fields = Context.getBuildFields();
        //var res = [];
//
        //for (o in fields) {
            //if (hasBindableMeta(o)) buildField(o, res)
            //else res.push(o);
        //}
//
    //return res;
//}
//
    //private static function hasBindableMeta(field:Field):Bool {
        //for (o in field.meta) {
            //if (o.name == ":bindable") return true;
        //}
//
        //return false;
    //}
//
    //private static function buildField(field:Field, res:Array<Field>):Void {
        //switch (field.kind) {
            //case FVar(type, expr):
                //res.push(field);
//
                //var setterAccess = [Access.APublic];
                //var fieldName = field.name;
//
                //field.kind = FProp("default", "set", type, expr);
//
                //var setter = macro function foo(value:$type) {
                    //this.$fieldName = value;
                    //return value;
                //};
//
                //res.push({
                //name: 'set_$fieldName',
                //kind: FFun(switch (setter.expr) { case EFunction (_, func): func; case _: throw false; }),
                //pos: field.pos,
                //access: setterAccess
                //});
//
            //case _:
                //res.push(field);
        //}
    //}