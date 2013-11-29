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
        private Dictionary<string, string> insertItens = new Dictionary<string,string>();


        public theConn()
        {
            this.connString = ConfigurationManager.ConnectionStrings["locadoraConnectionString"].ConnectionString;
            try
            {
                this.MyCon = new MySqlConnection(connString);
                this.MyCon.Open();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(e.ToString());
            }
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

        public void InsertItem(string key, string value)
        {
            this.insertItens.Add(key, value);
        }

        public void Insert(string table)
        {
            string keys = " (";
            string values = " (";
            int i = this.insertItens.Count - 1;

            foreach (KeyValuePair<string, string> item in this.insertItens)
            {
                if (i == 0)
                {
                    keys += item.Key + ")";
                    values += "'" + item.Value + "')";
                }
                else
                {
                    keys += item.Key + ",";
                    values += "'" + item.Value + "',";
                }
                i--;
            }

            var command = "INSERT INTO " + table + keys + " VALUES " + values;
            this.Cmd(command);
        }

        public void Update(string table, string where)
        {
            string keys_values = "";
            int i = this.insertItens.Count - 1;

            foreach (KeyValuePair<string, string> item in this.insertItens)
            {
                if (i == 0)
                {
                    keys_values += item.Key + " = '" + item.Value;
                }
                else
                {
                    keys_values += item.Key + " = '" + item.Value + "',"; 
                }
                i--;
            }

            if (where.Length > 0)
                where = " WHERE " + where;

            var command = "UPDATE " + table + " SET " + keys_values + where;
        }

        private void execute(MySqlCommand command)
        {
            try
            {
                command.ExecuteNonQuery();

                this.MyCon.Close();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(e.ToString());
            }
        }

    }
}