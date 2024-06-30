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
            min-height: 80vh;
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
            <h1>¡Logueo exitoso!</h1>
             <!-- si el usuario es administrador, señalarlo -->
            <% if (Session["Usuario"] != null && ((dominio.Usuario)Session["Usuario"]).Tipo == dominio.TipoUsuario.Administrador)
                {  %>
            <p>Eres administrador.</p>
            <% } %>
            <hr />
            <br />
        </div>
        <div class="row1">
            <asp:Button ID="btnIngresar" runat="server" CssClass="btn btn-verde mt-2" Text="Continuar a Home" OnClick="btnIngresar_Click" />
        </div>
    </div>
</asp:Content>
