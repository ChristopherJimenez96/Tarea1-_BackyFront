using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pr_web2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Emplead empleado;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                empleado = new Emplead();
                empleado.drop_puesto(drop_puesto);
                empleado.grid_empleados(grid_empleados);
            }

        }

        protected void btn_crear_Click(object sender, EventArgs e)
        {
            empleado = new Emplead();
            if (empleado.crear(txt_nombre.Text,txt_apellido.Text,txt_direccion.Text,txt_telefono.Text, Convert.ToInt32(drop_puesto.SelectedValue),txt_dpi.Text,txt_fn.Text,txt_fi.Text) > 0){
                lbl_mensaje.Text = "ingreso Exitoso...";
                empleado.grid_empleados(grid_empleados);
            }
            
        }

        protected void grid_empleados_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_nombre.Text = grid_empleados.SelectedRow.Cells[2].Text;
            txt_apellido.Text = grid_empleados.SelectedRow.Cells[3].Text;
            txt_direccion.Text = grid_empleados.SelectedRow.Cells[4].Text;
            txt_telefono.Text = grid_empleados.SelectedRow.Cells[5].Text;
            int indice = grid_empleados.SelectedRow.RowIndex;
            drop_puesto.SelectedValue = grid_empleados.DataKeys[indice].Values["idPuesto"].ToString();
            txt_dpi.Text = grid_empleados.SelectedRow.Cells[7].Text;
            DateTime fecha = Convert.ToDateTime(grid_empleados.SelectedRow.Cells[8].Text);
            txt_fn.Text = fecha.ToString("yyyy-MM-dd");
            DateTime fecha2 = Convert.ToDateTime(grid_empleados.SelectedRow.Cells[9].Text);
            txt_fi.Text = fecha2.ToString("yyyy-MM-dd");

            btn_actualizar.Visible = true;
        }

        protected void grid_empleados_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            empleado = new Emplead();
            if (empleado.borrar(Convert.ToInt32(e.Keys["id"])) > 0)
            {
                lbl_mensaje.Text = "Borrado Exitoso...";
                empleado.grid_empleados(grid_empleados);
            }
        }

        protected void btn_actualizar_Click(object sender, EventArgs e)
        {
            empleado = new Emplead();
            if (empleado.actualizar(Convert.ToInt32(grid_empleados.SelectedValue) , txt_nombre.Text, txt_apellido.Text, txt_direccion.Text, txt_telefono.Text, Convert.ToInt32(drop_puesto.SelectedValue),txt_dpi.Text, txt_fn.Text, txt_fi.Text ) > 0)
            {
                lbl_mensaje.Text = "Modificacion Exitosa...";
                empleado.grid_empleados(grid_empleados);
            }
        }
    }
}