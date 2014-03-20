using System;
using System.IO;
using System.Xml;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Bit8TestingFramework_v2._0
{
    class XMLParser
    {
        XmlTextReader reader = null;
        TestCaseModel tcm = new TestCaseModel();

        // [CONSTRUCTOR]..Load the reader with the XML file.
        public XMLParser()
        {
            reader = new XmlTextReader(@"C:\Users\USER\Documents\GitHub\team-a\Bit8TestingFramework_v2.0\Bit8TestingFramework_v2.0\TempResults\testResult.xml");
        }
        
        // [METHOD]..Read the attributes from the XML file.
        public void readAttr(XmlTextReader readerIn)
        {
            while (readerIn.Read())
            {
                switch (readerIn.NodeType)
                {
                    case XmlNodeType.Element: // The node is an Element.
                        if (readerIn.Name == "test-results" || readerIn.Name == "environment" || readerIn.Name == "culture-info" || readerIn.Name == "test-suite")
                            break;
                        while (readerIn.MoveToNextAttribute()) // Read attributes.
                            Console.WriteLine(" " + readerIn.Name + "= " + readerIn.Value);
                        break;
                    case XmlNodeType.Text: //Display the text in each element.
                        Console.WriteLine(readerIn.Value);
                        break;
                }
            }
        }
    }
}
