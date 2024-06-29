<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InmuebleAdmin.aspx.cs" Inherits="TPCuatrimestral_EquipoA.InmuebleAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .gestion {
            text-align: center;
            font-family: "Roboto", sans-serif;
        }

        .col-8 {
            width: 80%;
            margin: 0 auto;
        }

        .d-block {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .img-grid {
            display: grid;
            grid-template-columns: repeat(4,1fr);
            grid-gap: 5px;
        }

        .img-grid img {
            width: 100%;
            height: auto;
        }

        .btn-verde {
            background-color: #4c6444;
            color: white;
            font-family: "Roboto", sans-serif;
            font-size: 16px;
            font-style: normal;
            border: none;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            transition: all 0.3s;
            width: 100%;
        }

    </style>
    <div class="gestion">
        <h1>Gestión de Inmuebles</h1>
        <div>
            <div class="col-8">
                <div class="img-grid">
                    <img src="img/cocina.png" class="d-block w-50" alt="...">
                </div>
            </div>
        </div>
        <div class="col-8">
            <div class="mb-3" style="width: 40%;">
              <label class="form-label">Imágenes de inmueble</label>
              <input type="file" id="txtImagen" class="form-control">
              <asp:Button ID="subirImagenes" runat="server" CssClass="btn btn-verde" Text="Subir" OnClick="subirImagenes_Click"/>
            </div>
        </div>
        <div class="col-8">
            <div class="custom-border">
                <div class="row">
                    <div class="col-6">
                        <asp:DropDownList ID="ddlTipoPropiedad" runat="server" class="form-control">
                            <asp:ListItem Text="Casa" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Departamento" Value="2"></asp:ListItem>
                            <asp:ListItem Text="PH" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Terreno" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Oficina" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtDireccion" runat="server" REQUIRED class="form-control" placeholder="Dirección" />
                        <asp:TextBox ID="txtLocalidad" runat="server" REQUIRED class="form-control" placeholder="Localidad" />
                        <asp:TextBox ID="txtPrecio" runat="server" REQUIRED class="form-control" placeholder="Precio" />
                        <asp:TextBox ID="txtDescripcion" runat="server" REQUIRED class="form-control" placeholder="Descripción" />
                        <asp:TextBox ID="MetrosCuadrados" runat="server" REQUIRED class="form-control" placeholder="Metros Cuadrados" />
                        <asp:TextBox ID="MetrosCubiertos" runat="server" REQUIRED class="form-control" placeholder="Metros Cubiertos" />
                        <asp:TextBox ID="CantAmbientes" runat="server" REQUIRED class="form-control" placeholder="Cantidad de Ambientes" />
                        <asp:TextBox ID="CantBaños" runat="server" REQUIRED class="form-control" placeholder="Cantidad de Baños" />
                        <asp:DropDownList ID="ddlTipoOperacion" runat="server" class="form-control">
                            <asp:ListItem Text="Venta" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Alquiler" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="btnAceptar" runat="server" OnClick="btnAceptar_Click" Text="Aceptar" class="btn btn-secondary" />
                        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" CssClass="btn btn-secondary" />
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
