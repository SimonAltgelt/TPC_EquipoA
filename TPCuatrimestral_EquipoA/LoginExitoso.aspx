<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginExitoso.aspx.cs" Inherits="TPCuatrimestral_EquipoA.LoginExitoso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .center-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            text-align: center;
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
    </style>

    <div class="center-container">
        <div class="col-12">
            <h1>Logueo existoso!</h1>
            <hr />
            <br />
        </div>
        <!--a los btn les falta el evento click-->
        <div class="row1">
            <asp:Button ID="btnIngresar" runat="server" CssClass="btn btn-verde mt-2" Text="Ingresar" OnClick="btnIngresar_Click" />
        </div>
        <br />
        <br />
        <div class="row2">
            <!-- si el usuario es administrador, mostrar el boton de adm -->
            <% if (Session["Usuario"] != null && ((dominio.Usuario)Session["Usuario"]).Tipo == dominio.TipoUsuario.Administrador)
                {  %>
            <asp:Button ID="btnAdmin" runat="server" CssClass="btn btn-verde mt-2" Text="Admin" OnClick="btnAdmin_Click" />
            <p>Debes ser administrador.</p>

            <% } %>
        </div>
    </div>

</asp:Content>
