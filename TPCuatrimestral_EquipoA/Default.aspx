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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .jumbotron {
            background-color: rgba(0, 0, 0, 0.55); /* Fondo semitransparente */
            color: white;
            padding: 30px;
            border-radius: 10px
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
            width: 80%;
        }

            .form-group label {
                margin-bottom: 5px;
                font-size: 18px;
            }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 18px;
        }

        .btn-verde {
            background-color: #006744;
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

        .display-4 {
            text-align: center;
        }
    </style>

    <div class="seccion-busqueda">
        <div class="jumbotron">
            <h1 class="display-4">Encontrá la propiedad que soñás</h1>
            <div class="form-container">
                <!-- Buscar por DDL disponibilidad -->
                <div class="form-group">
                    <label for="ddlDisponibilidad" class="sr-only">Tipo de operación </label>
                    <asp:Label ID="lbldisponibilidad" runat="server" Text="Tipo operación:" />
                    <asp:DropDownList ID="ddlDisponibilidad" runat="server" CssClass="form-control" />
                </div>
                <!-- Buscar por nombre LOCALIDADES -->
                <div class="form-group">
                    <label for="inputLocalidad" class="sr-only">Dónde querés mudarte?</label>
                    <asp:Label ID="lblLocalidad" runat="server" Text="Ubicación:" />
                    <asp:TextBox ID="inputLocalidad" runat="server" CssClass="form-control" placeholder="¿Dónde querés mudarte?" />
                </div>

                <!-- Buscar por DDL PROPIEDADES -->
                <div class="form-group">
                    <label for="ddlTipoPropiedad" class="sr-only">Tipo de propiedad</label>
                    <asp:Label ID="lblPropiedad" runat="server" Text="Tipo de propiedad:" />
                    <asp:DropDownList ID="ddlTipoPropiedad" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnEncontrar" runat="server" Text="ENCONTRAR" CssClass="btn btn-verde mt-2" OnClick="btnEncontrar_Click" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>
