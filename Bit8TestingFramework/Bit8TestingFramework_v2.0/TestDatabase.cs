using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace Bit8TestingFramework
{
    class TestDatabase
    {
        public static void SaveTest(TestCaseModel newTest) 
        {
            MySqlConnection con = TestDatabase.InitializeConnection();
            con.Open();

        }
        
        private static MySqlConnection InitializeConnection() 
        {
            string server = "localhost";
            string database = "testingframeworkdb";
            string uid = "root";
            string password = "jamie1234";
            string connectionString = "SERVER=" + server + ";" + "DATABASE=" +
            database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";";
            MySqlConnection mysqlcon = new MySqlConnection(connectionString);
            return mysqlcon;
        }
    }
}
