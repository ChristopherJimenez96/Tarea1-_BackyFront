using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MySql.Data.MySqlClient;


namespace Modelo
{
    public class ConexionBD
    {
        private string cadena = "server=localhost; database=dbempleado; user=usr_empresa; password=Empres@123";
        public MySqlConnection conectar = new MySqlConnection();

        public void AbrirConexion(){
            try
            {
                conectar.ConnectionString = cadena;
                conectar.Open();
                //System.Diagnostics.Debug.WriteLine("Conexion Exitosa");
            }
            catch (Exception ex){
                //System.Diagnostics.Debug.WriteLine(ex.Message);
                Console.WriteLine(ex.Message);
            }
        }

        public void CerrarConexion()
        {
            try
            {
                if(conectar.State == ConnectionState.Open)
                {
                    conectar.Close();
                    //System.Diagnostics.Debug.WriteLine("Cerrar conexion");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
