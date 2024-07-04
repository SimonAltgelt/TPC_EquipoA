<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPCuatrimestral_EquipoA.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .centrado {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start; 
            min-height: 50vh; 
            font-family: "Roboto", sans-serif;
            color: #4c6444;
            margin-top: 20px; 
            margin-bottom: 20px; 
        }

        .centrado h1 {
            font-size: 36px;
            margin-bottom: 10px;
            font-family: "Roboto", sans-serif;
            color: #4c6444;
        }

        .no-resultados {
            font-size: 24px;
            color: #4c6444;
        }

        .icono {
            font-size: 90px; 
            color: #ff0000;
            margin-top: 10px; 
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="centrado">
        <h1>Hubo un problema</h1>
        <asp:Label Text="texto" ID="lblError" CssClass="no-resultados" runat="server" />
        <i class="fa-solid fa-triangle-exclamation fa-beat icono"></i>
    </div>
</asp:Content>
