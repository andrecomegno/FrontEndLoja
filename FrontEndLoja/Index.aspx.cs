using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data;
using MySql.Data.MySqlClient;
using FrontEndLoja.script;

namespace FrontEndLoja
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductsList();
        }

        protected void ProductsList()
        {
            database database = new database();
            database.openConnection();

            MySqlCommand cmd = new MySqlCommand("select * from produtos", database.getConnection());
            MySqlDataAdapter adapter = new MySqlDataAdapter();
            adapter.SelectCommand = cmd;
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);

            DataList1.DataSource = dataSet;
            DataList1.DataBind();

            database.closeConnection();
        }

        protected void btsearch_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                database database = new database();
                database.openConnection();

                MySqlCommand cmd = new MySqlCommand("select id, nome, preco, imagens, url from databasempb.produtos where nome like '%' @nome '%' ", database.getConnection());
                cmd.Parameters.AddWithValue("@nome", txtsearch.Text);

                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    DataList1.DataSource = dt;
                    DataList1.DataBind();
                    txtsearch.Text = "";

                    if (DataList1.Items.Count == 0)
                    {
                        error.Text = "Não foi encontrado Produtos relacionados";
                    }
                    else
                    {
                        error.Text = "";
                    }
                }

                database.closeConnection();

            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "AVISO !", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}