using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConexaoBanco
{
    public class ConexaoMysql
    {
        MySqlConnection connection = new MySqlConnection();

        public MySqlConnection OpenConnection()
        {
            string tagConexao = System.Configuration.ConfigurationSettings.AppSettings["conexaoAtual"];

            connection.ConnectionString = tagConexao;
            connection.Open();
            return connection;
        }

        public void Update(string sql)
        {

            MySqlCommand comand = new MySqlCommand();
            comand.CommandText = sql;
            comand.Connection = OpenConnection();
            comand.ExecuteNonQuery();
            connection.Close();
            connection.Dispose();

        }

        public void UpdateTransactionally(string sql, MySqlConnection con)
        {

            MySqlCommand comand = new MySqlCommand();
            comand.Connection = con;
            comand.CommandText = sql;
            comand.ExecuteNonQuery();
        }

        public DataTable Query(string sql)
        {
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(sql, OpenConnection());

            while (connection.State != ConnectionState.Open)
            {
                OpenConnection();
            }
            if (connection.State == ConnectionState.Open)
            {
                da.Fill(dt);
                connection.Close();
                connection.Dispose();
            }

            return dt;
        }

        public DataTable QueryTransactionally(string sql, MySqlConnection con)
        {
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(sql, con);
            da.Fill(dt);


            return dt;
        }

        public MySqlTransaction StartTransaction(MySqlConnection con)
        {
            MySqlTransaction trans = con.BeginTransaction();

            return trans;
        }

        public void ConfirmTransaction(MySqlTransaction currentTransaction)
        {
            currentTransaction.Commit();
            connection.Close();
        }

        public void CancelTransaction(MySqlTransaction currentTransaction)
        {
            currentTransaction.Rollback();
            currentTransaction.Dispose();
            connection.Close();
        }

    }
}
