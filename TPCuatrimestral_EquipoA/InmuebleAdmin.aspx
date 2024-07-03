<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InmuebleAdmin.aspx.cs" Inherits="TPCuatrimestral_EquipoA.InmuebleAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .gestion {
            text-align: center;
            font-family: "Roboto", sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0 auto;
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
            grid-template-columns: repeat(4, 1fr);
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

        .imagenes {
            width: 100%;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            grid-gap: 10px;
            /*margin-left: 50px;*/
        }

        .imagenes img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 1rem;
            width: 100%;
        }

        .form-group label {
            margin-bottom: 0.5rem;
        }

        .form-group input,
        .form-group select {
            width: 100%;
        }
    </style>
    <div class="gestion">
        <h1>Gestión de Inmuebles</h1>
        <div class="col-8">
            <div class="imagenes">
                <%if (!esNuevo)
                    {
                        List<dominio.Imagen> imagenes = imagenesNegocio.listar();
                        foreach (dominio.Imagen imagen in imagenes)
                        {
                            if (imagen.IDInmueble == IDInmueble)
                            {%>

                <img src="<%=imagen.URLImagen.ToString()%>" />
                <%}
                        }
                    }
                %>
            </div>
        </div>
        <div class="col-8">
            <div class="mb-3" style="width: 40%;">
                <h3>Imágenes de inmueble</h3>
                <asp:FileUpload ID="txtImagen" runat="server" AllowMultiple="true" />
            </div>
        </div>
        <div class="col-8">
            <div class="custom-border">
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <asp:Label Text="Tipo de propiedad" runat="server" />
                            <asp:DropDownList ID="ddlTipoPropiedad" runat="server" class="form-control">
                                <asp:ListItem Text="Casa" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Departamento" Value="2"></asp:ListItem>
                                <asp:ListItem Text="PH" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Terreno" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Oficina" Value="5"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Direccion" runat="server" />
                            <asp:TextBox ID="txtDireccion" runat="server" class="form-control" placeholder="Dirección" />
                            <asp:RequiredFieldValidator ID="rfvdireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Campo requerido" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Solo letras y números" ValidationExpression="^[a-zA-Z0-9\s]+$" CssClass="text-danger" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Localidad" runat="server" />
                            <asp:TextBox ID="txtLocalidad" runat="server" class="form-control" placeholder="Localidad" />
                            <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="txtLocalidad" ErrorMessage="Campo requerido" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revLocalidad" runat="server" ControlToValidate="txtLocalidad" ErrorMessage="Solo letras" ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Precio" runat="server" />
                            <asp:TextBox ID="txtPrecio" runat="server" class="form-control" placeholder="Precio" />
                            <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio" ErrorMessage="Campo requerido" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revPrecio" runat="server" ControlToValidate="txtPrecio" ErrorMessage="Solo números" ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Descripción" runat="server" />
                            <asp:TextBox ID="txtDescripcion" runat="server" class="form-control" placeholder="Descripción" />
                            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Campo requerido" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Solo letras y números" ValidationExpression="^[a-zA-Z0-9\s]+$" CssClass="text-danger" Display="Dynamic" />
                                </div>
                        <div class="form-group">
                            <asp:Label Text="Metros cuadrados totales" runat="server" />
                            <asp:TextBox ID="MetrosCuadrados" runat="server" class="form-control" placeholder="Metros Cuadrados" />
                            <asp:RequiredFieldValidator ID="rfvMetrosCuadrados" runat="server" ControlToValidate="MetrosCuadrados" ErrorMessage="Campo requerido" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revMetrosCuadrados" runat="server" ControlToValidate="MetrosCuadrados" ErrorMessage="Solo números" ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Metros cubiertos" runat="server" />
                            <asp:TextBox ID="MetrosCubiertos" runat="server" class="form-control" placeholder="Metros Cubiertos" />
                            <asp:RequiredFieldValidator ID="rfvMetrosCubiertos" runat="server" ControlToValidate="MetrosCubiertos" ErrorMessage="Campo requerido" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revMetrosCubiertos" runat="server" ControlToValidate="MetrosCubiertos" ErrorMessage="Solo números" ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Cantidad de ambientes" runat="server" />
                            <asp:TextBox ID="CantAmbientes" runat="server" class="form-control" placeholder="Cantidad de Ambientes" />
                            <asp:RequiredFieldValidator ID="rfvCantAmbientes" runat="server" ControlToValidate="CantAmbientes" ErrorMessage="Campo requerido" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revCantAmbientes" runat="server" ControlToValidate="CantAmbientes" ErrorMessage="Solo números" ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />

                        </div>
                        <div class="form-group">
                            <asp:Label Text="Cantidad de baños" runat="server" />
                            <asp:TextBox ID="CantBaños" runat="server" class="form-control" placeholder="Cantidad de Baños" />
                            <asp:RequiredFieldValidator ID="rfvCantBaños" runat="server" ControlToValidate="CantBaños" ErrorMessage="Campo requerido" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revCantBaños" runat="server" ControlToValidate="CantBaños" ErrorMessage="Solo números" ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Tipo de operacion" runat="server" />
                            <asp:DropDownList ID="ddlTipoOperacion" runat="server" class="form-control">
                                <asp:ListItem Text="Venta" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Alquiler" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnAceptar" runat="server" OnClick="btnAceptar_Click" Text="Aceptar" class="btn btn-secondary" />
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" CssClass="btn btn-secondary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
