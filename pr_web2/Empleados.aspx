<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="pr_web2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1> Formulario Empleados</h1>
    <asp:Label ID="lbl_nombre" runat="server" Text="Nombre" CssClass="badge" Font-Size="Small"></asp:Label>
    <asp:TextBox ID="txt_nombre" runat="server" CssClass="form-control" placeholder="Eje: Nombre1 Nombre2"></asp:TextBox>
    <asp:Label ID="lbl_apellido" runat="server" Text="Apellido" CssClass="badge" Font-Size="Small"></asp:Label>
    <asp:TextBox ID="txt_apellido" runat="server" CssClass="form-control" placeholder="Eje: Apellido1 Apellido2"></asp:TextBox>
    <asp:Label ID="lbl_direccion" runat="server" Text="Direccion" CssClass="badge" Font-Size="Small"></asp:Label>
    <asp:TextBox ID="txt_direccion" runat="server" CssClass="form-control" placeholder="Eje: #casa calle avenida lugar"></asp:TextBox>
    <asp:Label ID="lbl_telefono" runat="server" Text="Telefono" CssClass="badge" Font-Size="Small"></asp:Label>
    <asp:TextBox ID="txt_telefono" runat="server" CssClass="form-control" placeholder="Eje: 00000000" TextMode="Number"></asp:TextBox>
    <asp:Label ID="lbl_puesto" runat="server" Text="Puesto" CssClass="badge" Font-Size="Small"></asp:Label>
    <asp:DropDownList ID="drop_puesto" runat="server" CssClass="form-control"></asp:DropDownList>
    <asp:Label ID="lbl_dpi" runat="server" Text="DPI" CssClass="badge" Font-Size="Small"></asp:Label>
    <asp:TextBox ID="txt_dpi" runat="server" CssClass="form-control" placeholder="Eje: 5555000005555"></asp:TextBox>
    <asp:Label ID="lbl_fn" runat="server" Text="Fecha Nacimiento" CssClass="badge" Font-Size="Small"></asp:Label>
    <asp:TextBox ID="txt_fn" runat="server" CssClass="form-control" placeholder="Eje: yyy-mm-dd" TextMode="Date"></asp:TextBox>
    <asp:Label ID="lbl_fi" runat="server" Text="Fecha Ingreso" CssClass="badge" Font-Size="Small"></asp:Label>
    <asp:TextBox ID="txt_fi" runat="server" CssClass="form-control" placeholder="Eje: yyy-mm-dd" TextMode="Date"></asp:TextBox>
    <asp:Button ID="btn_crear" runat="server" Text="Crear" CssClass="btn btn-primary" OnClick="btn_crear_Click" />
    <asp:Button ID="btn_actualizar" runat="server" Text="Actualizar" CssClass="btn btn-success" OnClick="btn_actualizar_Click" />
    <asp:Label ID="lbl_mensaje" runat="server" CssClass="badge" Font-Size="Small"></asp:Label>
    <asp:GridView ID="grid_empleados" runat="server" AutoGenerateColumns="False" CssClass="table-condensed" DataKeyNames="id,id_puesto" OnRowDeleting="grid_empleados_RowDeleting" OnSelectedIndexChanged="grid_empleados_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="btn_select" runat="server" CausesValidation="False" CommandName="Select" Text="ver" CssClass="btn btn-info" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="btn_borrar" runat="server" CausesValidation="False" CommandName="Delete" Text="Borrar" CssClass="btn btn-danger" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="apellido" HeaderText="Apellido" />
            <asp:BoundField DataField="direccion" HeaderText="Direccion" />
            <asp:BoundField DataField="telefono" HeaderText="Telefono" DataFormatString="{0:c}" />
            <asp:BoundField DataField="puesto" HeaderText="Puesto" />
            <asp:BoundField DataField="dpi" HeaderText="DPI" />
            <asp:BoundField DataField="fecha_nacimiento" HeaderText="Nacimiento" DataFormatString="{0:d}" />
            <asp:BoundField DataField="fecha_ingreso" HeaderText="Ingreso" DataFormatString="{0:d}" />
        </Columns>
    </asp:GridView>
</asp:Content>
