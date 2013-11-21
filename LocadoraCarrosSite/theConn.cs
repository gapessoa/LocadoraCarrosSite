using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace LocadoraCarrosSite
{
    public class theConn
    {
        private string connString;
        private MySqlConnection MyCon;
        private MySqlCommand cmd;
        private MySqlDataReader readData;
        private List<IDictionary<string,object>> rows;


        public theConn()
        {
            this.connString = ConfigurationManager.ConnectionStrings["locadoraConnectionString"].ConnectionString;

            this.MyCon = new MySqlConnection(connString);
            this.MyCon.Open();
        }

        public void Cmd(string command)
        {
            this.cmd = new MySqlCommand(command, this.MyCon);

            this.execute(this.cmd);
        }

        public IList<IDictionary<string,object>> Select(string commmand)
        {

            this.cmd = new MySqlCommand(commmand, this.MyCon);
            this.readData = this.cmd.ExecuteReader();

            return DataReaderExtensions.ListRecordsAsDictionaries(this.readData);
        }


        private void execute(MySqlCommand command)
        {
            command.ExecuteNonQuery();

            this.MyCon.Close();
        }


    }
}