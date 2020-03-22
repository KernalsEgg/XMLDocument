package System.XML
{
	public class XMLAttribute
	{
		// \====================/
		// | Private Properties |
		// /====================\
		
		private var sName:String;
		private var sValue:String;
		
		
		
		// \=============/
		// | Constructor |
		// /=============\
		
		public function XMLAttribute(asName:String = "", asValue:String = "")
		{
			sName = asName;
			sValue = asValue;
		}
		
		
		
		// \=========/
		// | Getters |
		// /=========\
		
		public function get name() : String
		{
			return sName;
		}
		
		public function get value() : String
		{
			return sValue;
		}
	}
}

/*
	public function XMLAttribute(asName:String = "", asValue:String = "")
		asName: The optional attribute name the element must have
			Default: Do not filter by attribute name
			Specified: The element must have the specified attribute name*
		asValue: The optional attribute value the element must have
			Default: Do not filter by attribute value
			Specified: The element must have the specified attribute value*
	
	*If asName and asValue are both specified then the specified attribute name must have the specified attribute value
*/
