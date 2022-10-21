using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace Modelo
{
   
    public class Emplead{
        ConexionBD conectar;
        private DataTable drop_puesto(){
            DataTable tabla = new DataTable();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("select id_puesto as id,puesto from puestos;");
            MySqlDataAdapter query = new MySqlDataAdapter(consulta, conectar.conectar);
            query.Fill(tabla);
            conectar.CerrarConexion();
            return tabla;
        }

        

        public void drop_puesto(DropDownList drop){
            drop.ClearSelection();
            drop.Items.Clear();
            drop.AppendDataBoundItems = true;
            drop.Items.Add("<< Elige Puesto >>");
            drop.Items[0].Value = "0";
            drop.DataSource = drop_puesto();
            drop.DataTextField = "puesto";
            drop.DataValueField = "id";
            drop.DataBind();
        }

        private DataTable grid_empleados(){
            DataTable tabla = new DataTable();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("SELECT e.idEmpleado as id,e.Nombre,e.Apellido,e.Direccion,e.Telefono,p.puesto,e.idPuesto,e.DPI,e.FechaNacimiento,e.FechaIngresoRegistro FROM empleados as e inner join puestos as p on e.idPuesto = p.idPuesto;");
            MySqlDataAdapter query = new MySqlDataAdapter(consulta, conectar.conectar);
            query.Fill(tabla);
            conectar.CerrarConexion();
            return tabla;
        }

        public void grid_empleados(GridView grid)
        {
            grid.DataSource = grid_empleados();
            grid.DataBind();
        }

        public int crear(string nombre, string apellido, string direccion, string telefono, int idpuesto, string dpi, string fechana, string fechain)
        {
            int no = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("INSERT INTO empleados(Nombre,Apellido,Direccion,Telefono,idPuesto,DPI,FechaNacimiento,FechaIngresoRegistro) VALUES ('{0}','{1}','{2}','{3}',{4},'{5}','{6}','{7}');", nombre,apellido,direccion,telefono,idpuesto,dpi,fechana,fechain);
            MySqlCommand query = new MySqlCommand(consulta,conectar.conectar);
            query.Connection = conectar.conectar;
            query.ExecuteNonQuery();
            no = query.ExecuteNonQuery();
            conectar.CerrarConexion();
            return no;
        }

        public int actualizar(int id, string nombre, string apellido, string direccion, string telefono, int idpuesto, string dpi, string fechana, string fechain)
        {
            int no = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("update empleados set Nombre='{0}',Apellido='{1}',Direccion='{2}',Telefono='{3},idPuesto={4},DPI='{5}',FechaNacimiento='{6}',FechaIngresoRegistro='{7}' where idempleados ={7};", nombre,apellido,direccion,telefono,idpuesto,dpi,fechana,fechain, id);
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            query.ExecuteNonQuery();
            no = query.ExecuteNonQuery();
            conectar.CerrarConexion();
            return no;
        }

        public int borrar(int id)
        {
            int no = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("delete from empleados where idEmpleado ={0};", id);
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            query.ExecuteNonQuery();
            no = query.ExecuteNonQuery();
            conectar.CerrarConexion();
            return no;
        }

    }
}
