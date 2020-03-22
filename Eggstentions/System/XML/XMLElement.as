package System.XML
{
	public class XMLElement
	{
		// \====================/
		// | Private Properties |
		// /====================\
		
		private var sProperty:String;
		private var sIncludeAttributes:Vector.<XMLAttribute>;
		private var sExcludeAttributes:Vector.<XMLAttribute>;
		
		
		
		// \=============/
		// | Constructor |
		// /=============\
		
		public function XMLElement(asProperty:String = "", asIncludeAttributes:Vector.<XMLAttribute> = null, asExcludeAttributes:Vector.<XMLAttribute> = null)
		{
			sProperty = asProperty;
			sIncludeAttributes = asIncludeAttributes;
			sExcludeAttributes = asExcludeAttributes;
		}
		
		
		
		// \=========/
		// | Getters |
		// /=========\
		
		public function get property() : String
		{
			return sProperty;
		}
		
		public function get includeAttributes() : Vector.<XMLAttribute>
		{
			return sIncludeAttributes;
		}
		
		public function get excludeAttributes() : Vector.<XMLAttribute>
		{
			return sExcludeAttributes;
		}
	}
}

/*
	public function XMLElement(asProperty:String = "", asIncludeAttributes:Vector.<XMLAttribute> = null, asExcludeAttributes:Vector.<XMLAttribute> = null)
		asProperty: The optional property name the element must have
			Default: Do not filter by property name
			Specified: The element must have the specified property name
		asIncludeAttributes: The optional list of attributes the element must have
			Default: Do not filter by attributes the element must have
			Not Specified: The element must have attributes
			Specified: The element must have the specified attributes
		asExcludeAttributes: The optional list of attributes the element must not have
			Default: Do not filter by attributes the element must not have
			Not Specified: The element must not have attributes
			Specified: The element must not have the specified attributes
*/
