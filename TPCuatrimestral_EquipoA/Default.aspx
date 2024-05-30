<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPCuatrimestral_EquipoA.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .seccion-busqueda {
            background-image: url('img/familia1.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            padding: 150px 0;
        }

        .jumbotron {
            background-color: rgba(0, 0, 0, 0.5); /* Fondo semitransparente */
            color: white;
            padding: 30px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
            width: 100%;
        }

            .form-group label {
                margin-bottom: 5px;
                font-size: 1.5em;
            }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 1.5em;
        }

        .btn-verde {
            background-color: #006744;
            color: white;
            font-size:2em;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            transition: font-weight 0.3s ease;
        }

            .btn-verde:hover {
                font-weight: bold;
            }

        .display-4 {
            text-align: center;
        }
    </style>

    <div class="seccion-busqueda">
        <div class="jumbotron">
            <h1 class="display-4">Mucho más que mudarte</h1>
            <div class="form-group">
                <!-- Buscar por DDL OPERACION -->
                <div class="form-group">
                    <label for="ddlOperacion" class="sr-only">Tipo operación </label>
                    <asp:Label ID="lblOperacion" runat="server" Text="Tipo operación:" />

                    <asp:DropDownList ID="ddlOperacion" runat="server" CssClass="form-control" />
                </div>
                <!-- Buscar por nombre LOCALIDADES -->
                <div class="form-group">
                    <label for="inputLocalidad" class="sr-only">Dónde querés mudarte?</label>
                    <asp:Label ID="lblLocalidad" runat="server" Text="Ubicación:" />
                    <input type="text" class="form-control" id="inputLocalidad" placeholder="Dónde querés mudarte?">
                </div>
                <!-- Buscar por DDL PROPIEDADES -->
                <div class="form-group">
                    <label for="ddlTipoPropiedad" class="sr-only">Tipo de propiedad</label>
                    <asp:Label ID="lblPropiedad" runat="server" Text="Tipo de propiedad:" />
                    <asp:DropDownList ID="ddlTipoPropiedad" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-verde mt-2">BUSCAR</button>
            </div>
        </div>
    </div>








    <!--  <div>
        MasterPage sin contenido
    </div> -->
</asp:Content>
