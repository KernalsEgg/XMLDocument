package System.XML
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.xml.*;
	
	public class XMLDocument
	{
		// \====================/
		// | Private Properties |
		// /====================\
		
		private var XMLPath:String;
		private var XMLRequest:URLRequest;
		private var XMLLoader:URLLoader;
		private var XMLData:XMLList;
		
		
		
		// \=============/
		// | Constructor |
		// /=============\
		
		public function XMLDocument(asXMLPath:String)
		{
			XMLPath = asXMLPath;
			XMLRequest = new URLRequest(XMLPath);
			XMLLoader = new URLLoader(XMLRequest);
			XMLLoader.addEventListener(Event.COMPLETE, OnLoaderComplete);
		}
		
		
		
		// \========/
		// | Events |
		// /========\
		
		private function OnLoaderComplete(e:Event) : void
		{
			XMLData = new XMLList(XMLLoader.data);
		}
		
		
		
		// \=========/
		// | Methods |
		// /=========\
		
		public function GetValue(elements:Vector.<XMLElement>) : String
		{
			// \-----------/
			// | Variables |
			// /-----------\
			
			var data:XMLList;
			
			var element:XMLElement;
			
			// \------------/
			// | Operations |
			// /------------\
			
			data = XMLData;
			
			for each (element in elements)
			{
				data = GetData(data, element);
			}
			
			return data.toString();
		}
		
		private function GetData(data:XMLList, element:XMLElement) : XMLList
		{
			// \-----------/
			// | Variables |
			// /-----------\
			
			var entry:XML;
			
			var attribute:XMLAttribute;
			
			var list:XMLList;
			
			// \------------/
			// | Operations |
			// /------------\
			
			list = new XMLList();
			
			// If data for the property exists
			if (data.hasOwnProperty(element.property))
			{
				// Then get the relevant data
				data = data.elements(element.property);
				
				// Check each data entry
				entries: for each (entry in data)
				{
					// Check each attribute that must match
					for each (attribute in element.includeAttributes)
					{
						// If the attributes name and value has been specified, then both must match
						if (attribute.name && attribute.value)
						{
							if (!HasAttributeNameValue(entry, attribute))
							{
								continue entries;
							}
						}
						// Else if only the attributes name has been specified, then it must match
						else if (attribute.name)
						{
							if (!HasAttributeName(entry, attribute))
							{
								continue entries;
							}
						}
						// Else if only the attributes value has been specified, then it must match
						else if (attribute.value)
						{
							if (!HasAttributeValue(entry, attribute))
							{
								continue entries;
							}
						}
						// Else if no attribute name or value has been specified, then the entry must have attributes
						else
						{
							if (!HasAttributes(entry))
							{
								continue entries;
							}
						}
					}
					
					// Check each attribute that must not match
					for each (attribute in element.excludeAttributes)
					{
						// If the attributes name and value has been specified, then both must not match
						if (attribute.name && attribute.value)
						{
							if (HasAttributeNameValue(entry, attribute))
							{
								continue entries;
							}
						}
						// Else if only the attributes name has been specified, then it must not match
						else if (attribute.name)
						{
							if (HasAttributeName(entry, attribute))
							{
								continue entries;
							}
						}
						// Else if only the attributes value has been specified, then it must not match
						else if (attribute.value)
						{
							if (HasAttributeValue(entry, attribute))
							{
								continue entries;
							}
						}
						// Else if no attribute name or value has been specified, then the entry must not have attributes
						else
						{
							if (HasAttributes(entry))
							{
								continue entries;
							}
						}
					}
					
					// Store the matching data entry
					list += entry;
				}
			}
			
			// Return the list of matching data entries
			return list;
		}
		
		private static function HasAttributeNameValue(element:XML, attribute:XMLAttribute) : Boolean
		{
			return element.attribute(attribute.name).toXMLString().indexOf(attribute.value) >= 0;
		}
		
		private static function HasAttributeName(element:XML, attribute:XMLAttribute) : Boolean
		{
			return element.attribute(attribute.name).length();
		}
		
		private static function HasAttributeValue(element:XML, attribute:XMLAttribute) : Boolean
		{
			return element.attributes().toXMLString().indexOf(attribute.value) >= 0;
		}
		
		private static function HasAttributes(element:XML) : Boolean
		{
			return element.attributes().length();
		}
	}
}

/*
	public function GetValue(elements:Vector.<XMLElement>) : String
		elements: The list of child elements in order
	
	If filtered down to simple content then GetValue returns the elements value, else if filtered down to complex content then GetValue returns the elements
*/
