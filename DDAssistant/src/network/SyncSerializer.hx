package network;
import tjson.TJSON;
import models.*;


class SyncSerializer
{
	public static function encode(o:Dynamic, fieldMap:Dynamic = null):String
	{
		if (fieldMap == null)
			fieldMap = { };
		var encodable = createEncodable(o, fieldMap);
		return TJSON.encode(encodable, "simple");
	}
	
	
	public static function decode<T>(s:String, explicitType:String) : T 
	{
		var o = TJSON.parse(s);
		var inst;
		var typeClass:Class<Dynamic> = Type.resolveClass(explicitType);
#if !flash
		if (Type.getClassName(typeClass) == "Array")
			inst = new Array<Dynamic>();
		else
#end
			inst = Type.createInstance(typeClass, [] );
		SyncSerializer.populate(inst, o);
		return cast inst;
	}
	
	
	
	private static function createEncodable(objectToEncode:Dynamic, fieldMap:Dynamic):Dynamic
	{
		var type = Type.getClass(objectToEncode);
		var typeName:String = null;
		if (type != null)
			typeName = Type.getClassName(type);
		
		if (typeName == "Array")
		{
			var encodableArray:Array<Dynamic> = new Array();
			var objectArray:Array<Dynamic> = cast objectToEncode;
			
			for (i in 0...objectArray.length)
			{
				var value = objectArray[i];
				
				if (isEncodable(value))
				{
					var valueTypeString:String = Type.getClassName(Type.getClass(value));
					var isValueObject:Bool = (Reflect.isObject(value) && valueTypeString != "String") || (valueTypeString == "Array");
					
					if (isValueObject)
					{
						var encodableValue = createEncodable(value, fieldMap);
						encodableArray.push(encodableValue);
					}
					else
					{
						encodableArray.push(value);
					}
				}
			}
			
			return encodableArray;
		}
		else
		{
			var encodable:Dynamic = { };
			if (typeName != null)
				Reflect.setField(encodable, "_explicitType", typeName);
			
			var fields:Array<String> = SyncSerializer.getFields(objectToEncode, fieldMap);
			for (field in fields)
			{
				var value = Reflect.field(objectToEncode, field);
				
				if (isEncodable(value))
				{
					var valueTypeString:String = Type.getClassName(Type.getClass(value));
					var isValueObject:Bool = (Reflect.isObject(value) && valueTypeString != "String") || (valueTypeString == "Array");
					if (isValueObject)
					{
						var encodableValue = createEncodable(value, fieldMap);
						Reflect.setField(encodable, field, encodableValue);
					}
					else
					{
						Reflect.setField(encodable, field, value);
					}
				}
			}
			
			return encodable;
		}
	}

	public static function populate(inst:Dynamic, data:Dynamic):Void
	{
#if !flash
		var dataTypeString:String = Type.getClassName(Type.getClass(data));
		
		if (dataTypeString == "Array")
		{
			var dataArray:Array<Dynamic> = cast data;
			var instArray:Array<Dynamic> = cast inst;
			
			for (i in 0...dataArray.length)
			{
				var value = dataArray[i];
				var valueTypeString:String = Type.getClassName(Type.getClass(value));
				var isValueObject:Bool = (Reflect.isObject(value) && valueTypeString != "String") || (valueTypeString == "Array");
				var valueExplicitType:String = null;
				
				if (isValueObject)
				{
					valueExplicitType = Reflect.field(value, "_explicitType");
					if (valueExplicitType == null && valueTypeString == "Array")
						valueExplicitType = "Array";
				}
				
				if (valueExplicitType != null)
				{
					if (valueTypeString == "Array")
					{
						var fieldInst = new Array<Dynamic>();
						populate(fieldInst, value);
						instArray.push(fieldInst);
					}
					else
					{
						var fieldInst = Type.createEmptyInstance(Type.resolveClass(valueExplicitType));
						populate(fieldInst, value);
						instArray.push(fieldInst);
					}
				}
				else
				{
					instArray.push(value);
				}
			}
		}
		else
#end
		{
			for (field in Reflect.fields(data)) 
			{
				if (field == "_explicitType")
					continue;
				
				var value = Reflect.field(data, field);
				var valueTypeString:String = Type.getClassName(Type.getClass(value));
				var isValueObject:Bool = (Reflect.isObject(value) && valueTypeString != "String") || (valueTypeString == "Array");
				var valueExplicitType:String = null;
				
				if (isValueObject)
				{
					valueExplicitType = Reflect.field(value, "_explicitType");
					if (valueExplicitType == null && valueTypeString == "Array")
						valueExplicitType = "Array";
				}
				
				if (valueExplicitType != null)
				{
#if !flash
					if (valueTypeString == "Array")
					{
						var fieldInst = new Array<Dynamic>();
						populate(fieldInst, value);
						Reflect.setField(inst, field, fieldInst);
					}
					else
#end
					{
						var fieldInst = Type.createEmptyInstance(Type.resolveClass(valueExplicitType));
						populate(fieldInst, value);
						Reflect.setField(inst, field, fieldInst);
					}
				}
				else
				{
					Reflect.setField(inst, field, value);
				}
			}
		}
	}
	
	private static function isEncodable(obj:Dynamic):Bool
	{
		return !Reflect.isFunction(obj) && !Std.is(obj, Enum);
	}
	
	private static function getFields(obj:Dynamic, fieldMap:Dynamic):Array<String>
	{
		var type = Type.getClass(obj);
		var typeName:String = null;
		if (type != null)
			typeName = Type.getClassName(Type.getClass(obj));
		
		if (typeName != null && Reflect.hasField(fieldMap, typeName))
		{
			return Reflect.field(fieldMap, typeName);
		}
		else if (isAnonymous(obj))
		{
			return Reflect.fields(obj);
		}
		else if (type != null)
		{
			return Type.getInstanceFields(type);
		}
		else
		{
			throw "Could not get fields for object";
			return null;
		}
	}
	
	private static function isAnonymous(obj:Dynamic):Bool
	{
		return Type.typeof(obj) == TObject && !Std.is(obj, Class) && !Std.is(obj, Enum);
	}
}