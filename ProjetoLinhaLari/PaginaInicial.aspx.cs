using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoLinhaLari
{
    public partial class PaginaInicial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarProdutos();
        }

        public class listaProdutos
        {
            public listaProdutos(string nomeProduto, string descricao, string urlAnexo, string dataAnexado)
            {
                NomeProduto = nomeProduto;
                Descricao = descricao;
                UrlAnexo = urlAnexo;
                DataAnexado = dataAnexado;
            }

            public string NomeProduto { get; set; }
            public string Descricao { get; set; }
            public string UrlAnexo { get; set; }
            public string DataAnexado { get; set; }
        }

        protected void CarregarProdutos()
        {
            DataTable dtProdutos = new Produto().BuscarTodosProdutos();
            List<listaProdutos> listaProd = new List<listaProdutos>();

            if (dtProdutos.Rows.Count > 0)
            {
                foreach (DataRow prod in dtProdutos.Rows)
                {
                    string nomeProd = prod["nomeProduto"].ToString();
                    string descProd = prod["descProduto"].ToString();
                    string url = "~/Assets/img/" + prod["urlAnexado"].ToString();
                    DateTime dataAnexo = Convert.ToDateTime(prod["dataPostado"].ToString());

                    listaProd.Add(new listaProdutos(nomeProd, descProd, url, dataAnexo.ToString("dd/MM/yyyy")));
                }
                Repeater.DataSource = listaProd;
                Repeater.DataBind();
            }
        }

        protected void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}