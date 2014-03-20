using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bit8TestingFramework_v2._0
{
    class TestCaseModel
    {
        public string testName;
        public string description;
        public Int32 caseNumber;
        public DateTime dateTime;
        public string osVersion;
        public string platform;
        public string machineName;
        public string machineUser;
        public int asserts;
        public bool executed;
        public string result;
        public bool success;
        public string message;
        public string stackTrace;
        public double runningTime;
        public string codeCoverageType;
        public float codeCoveragePercentage;

        public TestCaseModel() 
        {
            this.testName = "";
            this.description = "";
            this.caseNumber = 0;
            this.dateTime = DateTime.Now;
            this.osVersion = "";
            this.platform = "";
            this.machineName = "";
            this.machineUser = "";
            this.asserts = 0;
            this.executed = false;
            this.result = "";
            this.success = false;
            this.message = "";
            this.stackTrace = "";
            this.runningTime = 0;
            this.codeCoverageType = "";
            this.codeCoveragePercentage = 0;
        }
    }
}
