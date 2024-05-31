<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallePropiedad.aspx.cs" Inherits="TPCuatrimestral_EquipoA.DetallePropiedad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card text-center">
        <div class="card-header">
            VENTA 
        </div>
        <div class="card-body">
            <h5 class="card-title">Calle Falsa 123</h5>
            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
        <div class="card-footer text-body-secondary">
            2 days ago
        </div>
    </div>
    <a href="CompraAlquilerPropiedad.aspx" class="btn btn-outline-info">Comprar o alquilar propiedad</a>
</asp:Content>
