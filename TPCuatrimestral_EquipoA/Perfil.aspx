<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="TPCuatrimestral_EquipoA.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .form-control{
            width: 400px;
        }
        .contenidoPrincipal{
            margin-left: 400px;
            padding-top: 40px;
        }
        .form-group{
            padding-top: 10px;
            padding-bottom: 10px;
        }
    </style>

    <div class="contenidoPrincipal">

        <div>
            <h1>Mi Perfil</h1>
        </div>
        <div class="form-group">
            <label class="form-label">Nombre</label>
            <asp:TextBox ID="txtNombre" placeholder="Completá con tu nombre." runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label class="form-label">Apellido</label>
            <asp:TextBox ID="txtApellido" placeholder="Completá con tu apellido." runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group"> 
            <label class="form-label">Documento</label>
            <asp:TextBox ID="txtDocumento" placeholder="Completá con tu documento." runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group"> 
            <label class="form-label">Domicilio</label>
            <asp:TextBox ID="txtDomicilio" placeholder="Completá con tu domicilio." runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group"> 
            <label class="form-label">Email</label>
            <asp:TextBox ID="txtEmail" placeholder="Completá con tu email." runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label class="form-label">Teléfono</label>
            <asp:TextBox ID="txtTelefono" placeholder="Completá con tu teléfono." runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label class="form-label">Contraseña</label>
            <asp:TextBox ID="txtContraseña" placeholder="Contraseña" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label class="form-label">Imagen de Perfil</label>
            <input type="file" id="txtImagen" runat="server" class="form-control" />
        </div>
        <asp:Image ID="imagenPerfil" runat="server" CssClass="img-fluid" ImageUrl="https://cdn-icons-png.flaticon.com/512/3135/3135768.png"/>
        <div class="form-group">
            <asp:Button ID="btnAceptar" runat="server" Text="Guardar cambios" class="btn btn-primary" OnClick="btnAceptar_Click" />
        </div>
    </div>
</asp:Content>
