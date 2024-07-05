<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="TPCuatrimestral_EquipoA.Administracion" %>

<script runat="server">
    void InmueblesGridView_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        // Guarda el índice de la fila
        int index = Convert.ToInt32(e.CommandArgument);
        // Guarda el ID de Propiedad de la fila seleccionada
        GridViewRow selectedRow = InmueblesGridView.Rows[index];
        TableCell ID = selectedRow.Cells[0];
        int IDPropiedad = int.Parse(ID.Text);

        if (e.CommandName == "Ocultar")
        {
            inmuebleNegocio.ocultar(IDPropiedad);
            Response.Redirect(Request.RawUrl);
        }
        else if (e.CommandName == "Modificar")
        {
            Response.Redirect($"InmuebleAdmin.aspx?ID={IDPropiedad}");
        }
        else if (e.CommandName == "Publicar")
        {
            Response.Redirect("InmuebleAdmin.aspx");
        }
        else if (e.CommandName == "Visualizar")
        {
            inmuebleNegocio.desocultar(IDPropiedad);
            Response.Redirect("Administracion.aspx?h=1");
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .admin {
            text-align: center;
            font-family: "Roboto", sans-serif;
        }

        .btn-verde {
            background-color: #4c6444;
            color: white;
            font-size: 25px;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            transition: all 0.3s;
            width: 100%;
        }

        .btn-verde:hover {
            transform: scale(1.01);
            color: white;
        }

        .grid-container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }

        .grid-container table {
            width: 100%;
            border-collapse: collapse;
        }

        .grid-container table th {
            background-color: #4c6444;
            color: white;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .grid-container table td {
            padding: 10px;
            border: 1px solid #ddd;
        }

    </style>

    <div class="admin">
        <h1>Administración</h1>
    </div>
    <div>
        <asp:Button ID="btnPublicar" runat="server" CssClass="btn btn-verde mt-2" OnClick="btnPublicar_Click" Text="Publicar Nuevo Inmueble" />
        <asp:Button ID="btnOcultos" runat="server" CssClass="btn btn-secondary mt-2" OnClick="btnOcultos_Click" Text="Mostrar publicaciones inactivas" />
        <asp:Button ID="btnVisibles" runat="server" CssClass="btn btn-secondary mt-2" OnClick="btnVisibles_Click" Text="Mostras publicaciones activas" />
    </div>
    <br />

    <div class="grid-container">
        <asp:GridView ID="InmueblesGridView"
            AutoGenerateColumns="False"
            AllowPaging="False"
            OnRowCommand="InmueblesGridView_RowCommand"
            runat="server">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID de Propiedad" ReadOnly="True" />
                <asp:BoundField DataField="UBICACION.DIRECCION" HeaderText="Dirección" />
                <asp:BoundField DataField="UBICACION.LOCALIDAD" HeaderText="Localidad" />
                <asp:BoundField DataField="DISPONIBILIDAD" HeaderText="Disponibilidad" />
                <asp:ButtonField ButtonType="Button" Text="Modificar" CommandName="Modificar" />
                <asp:ButtonField ButtonType="Button" Text="Ocultar" CommandName="Ocultar" />
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
