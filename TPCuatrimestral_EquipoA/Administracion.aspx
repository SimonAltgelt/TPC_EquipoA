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
            negocio.InmuebleNegocio inmuebleNegocio = new negocio.InmuebleNegocio();
            inmuebleNegocio.ocultar(IDPropiedad);
        }
        else if (e.CommandName == "Modificar")
        {
            //Llevame a la nueva página con los datos precargados
            Response.Redirect($"InmuebleAdmin.aspx?ID={IDPropiedad}");
        } else if (e.CommandName == "Publicar")
        {
            //Llevame a la nueva página
            Response.Redirect("InmuebleAdmin.aspx");
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="resultados">
        <h1>Administración</h1>

    </div>
    <div>
        <asp:Button ID="btnPublicar" runat="server" OnClick="btnPublicar_Click" Text="Publicar Nuevo Inmueble" />
    </div>

    <asp:gridview id="InmueblesGridView" 
          autogeneratecolumns="False"
          allowpaging="True" 
          OnRowCommand ="InmueblesGridView_RowCommand"
          runat="server">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID de Propiedad" ReadOnly="True"/>
                <asp:BoundField DataField="UBICACION.DIRECCION" HeaderText="Dirección" />
                <asp:BoundField DataField="UBICACION.LOCALIDAD" HeaderText="Localidad" />
                <asp:BoundField DataField="DISPONIBILIDAD" HeaderText="Disponibilidad" />
                <asp:ButtonField ButtonType="Button" Text="Modificar" CommandName="Modificar" />
                
                <asp:ButtonField ButtonType="Button" Text="Ocultar" CommandName="Ocultar" />

            </Columns>
       
    </asp:gridview>

</asp:Content>
