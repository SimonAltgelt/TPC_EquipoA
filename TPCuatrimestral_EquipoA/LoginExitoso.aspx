<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginExitoso.aspx.cs" Inherits="TPCuatrimestral_EquipoA.LoginExitoso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <h1>Logueo existoso!</h1>
            <hr />
        </div>
        <!--a los btn les falta el evento click-->
        <div class="col-4">
            <asp:Button Text="Pag1" ID="btnPag1" runat="server" CssClass="btn btn-outline-secondary" />
        </div>
        <div class="col-4">
            <!-- si el usuario es administrador, mostrar el boton de adm -->
            <% if (Session["Usuario"] != null && ((dominio.Usuario)Session["Usuario"]).Tipo == dominio.TipoUsuario.Administrador)
                {  %>
            <!-- este debe ser el btn de adm. sacarlo de la master y ponerlo aca -->
            <asp:Button Text="Pag2" ID="btnPag2" runat="server" CssClass="btn btn-outline-secondary" />
            <p>Debes ser administrador.</p>
            <% } %>
        </div>
    </div>
</asp:Content>
