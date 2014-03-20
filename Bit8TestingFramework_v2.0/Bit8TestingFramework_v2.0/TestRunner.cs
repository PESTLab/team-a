using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using NUnit.Mocks;
using NUnit.Core;
using NUnit.ConsoleRunner;
using NUnit.Framework.Constraints;
using System.IO;
using NUnit.Util;

namespace Bit8TestingFramework_v2
{
    public class TestRunner
    {
        private String path;

        public TestRunner(String path)
        {
            this.path = path;
            TestResult tempTr = runTest();
            XmlResultWriter xmlw = new XmlResultWriter(Directory.GetCurrentDirectory() + @"\BackupResults\testResult_" + this.nextFileName());
            xmlw.SaveTestResult(tempTr);
            //call class to xml parsing
        }

        //used to run tests
        private TestResult runTest()
        {
            CoreExtensions.Host.InitializeService();
            TestPackage testPackage = new TestPackage(this.path);
            RemoteTestRunner rtr = new RemoteTestRunner();
            rtr.Load(testPackage);
            TestResult tr = rtr.Run(new NullListener(), TestFilter.Empty, false, LoggingThreshold.Error);
            XmlResultWriter xmlw = new XmlResultWriter(Directory.GetCurrentDirectory() + @"\TempResults\testResult.xml");
            xmlw.SaveTestResult(tr);
            return tr;
        }

        private string nextFileName()
        {
            string[] temp = Directory.GetFiles(Directory.GetCurrentDirectory() + @"\TempResults");
            string last = temp[temp.Length - 1];
            string bufferInteger = "";
            for (int i = 0; i < last.Length; i++)
            {
                if (last[i] == '_')
                {
                    bufferInteger += last[i];
                    continue;
                }
                else continue;
            }
            return bufferInteger;
        }
    }
}