<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InmuebleAdmin.aspx.cs" Inherits="TPCuatrimestral_EquipoA.InmuebleAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Gestion de Inmuebles</h1>
        <div>
            /*aca quierocargr imagenes*/
          <div class="col-8">
              <img src="img/cocina.png" class="d-block w-50" alt="...">
          </div>
        </div>
        <div class="col-8">
            <div class="custom-border">
                <div class="row">
                    <div class="col-6">
                        <asp:TextBox ID="tipoPropiedad" runat="server" class="form-control" placeholder="Tipo de Propiedad" />
                        <asp:TextBox ID="txtDireccion" runat="server" class="form-control" placeholder="Dirección" />
                        <asp:TextBox ID="txtLocalidad" runat="server" class="form-control" placeholder="Localidad" />
                        <asp:TextBox ID="txtPrecio" runat="server" class="form-control" placeholder="Precio" />
                        <asp:TextBox ID="txtDescripcion" runat="server" class="form-control" placeholder="Descripción" />
                        <asp:TextBox ID="MetrosCuadrados" runat="server" class="form-control" placeholder="Metros Cuadrados" />
                        <asp:TextBox ID="MetrosCubiertos" runat="server" class="form-control" placeholder="Metros Cubiertos" />
                        <asp:TextBox ID="CantAmbientes" runat="server" class="form-control" placeholder="Cantidad de Ambientes" />
                        <asp:TextBox ID="CAntBaños" runat="server" class="form-control" placeholder="Cantidad de Baños" />
                        <asp:DropDownList ID="ddlTipoOperacion" runat="server" class="form-control">
                            <asp:ListItem Text="Venta" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Alquiler" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="btnAceptar" runat="server" OnClick="btnAceptar_Click" Text="Aceptar" class="btn btn-secondary" />
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
