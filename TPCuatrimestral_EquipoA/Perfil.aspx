﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="TPCuatrimestral_EquipoA.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .form-control {
            width: 400px;
        }

        .contenidoPrincipal {
            margin-left: 400px;
            padding-top: 40px;
        }

        .form-group {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .img-small {
            width: 150px; /* Ajusta el ancho de la imagen */
            height: 150px; /* Ajusta el alto de la imagen */
            object-fit: cover; /* Ajusta la imagen para que se recorte según el contenedor */
        }
    </style>

    <div class="contenidoPrincipal">

        <div>
            <h1>Mi Perfil</h1>
        </div>
        <div class="form-group">
            <label class="form-label">Nombre</label>
            <asp:TextBox ID="txtNombre" placeholder="Completá con tu nombre." runat="server" CssClass="form-control"></asp:TextBox>
            <!-- Valida que el campo no este vacio -->
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="GroupPerfil" ErrorMessage="El nombre es obligatorio." CssClass="text-danger" Display="Dynamic" />
            <!-- Valida que el campo solo contenga letras -->
            <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="GroupPerfil" ErrorMessage="El nombre solo debe contener letras." ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="form-group">
            <label class="form-label">Apellido</label>
            <asp:TextBox ID="txtApellido" placeholder="Completá con tu apellido." runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ValidationGroup="GroupPerfil" ErrorMessage="El apellido es obligatorio." CssClass="text-danger" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ValidationGroup="GroupPerfil" ErrorMessage="El apellido solo debe contener letras." ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="form-group">
            <label class="form-label">Documento</label>
            <asp:TextBox ID="txtDocumento" placeholder="Completá con tu documento." runat="server" CssClass="form-control"></asp:TextBox>
             <!-- Valida que el campo solo contenga números -->
            <asp:RegularExpressionValidator ID="revDocumento" runat="server" ControlToValidate="txtDocumento" ValidationGroup="GroupPerfil" ErrorMessage="El documento solo debe contener números." ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="form-group">
            <label class="form-label">Domicilio</label>
            <asp:TextBox ID="txtDomicilio" placeholder="Completá con tu domicilio." runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revDomicilio" runat="server" ControlToValidate="txtDomicilio" ValidationGroup="GroupPerfil" ErrorMessage="El domicilio solo debe contener letras y números." ValidationExpression="^[a-zA-Z0-9\s]+$" CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="form-group">
            <label class="form-label">Email</label>
            <asp:TextBox ID="txtEmail" placeholder="Completá con tu email." runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="GroupPerfil" ErrorMessage="El email es obligatorio." CssClass="text-danger" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="GroupPerfil" ErrorMessage="El email no es válido." ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="form-group">
            <label class="form-label">Teléfono</label>
            <asp:TextBox ID="txtTelefono" placeholder="Completá con tu teléfono." runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ValidationGroup="GroupPerfil" ErrorMessage="El teléfono es obligatorio." CssClass="text-danger" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ValidationGroup="GroupPerfil" ErrorMessage="El teléfono solo debe contener números." ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="form-group">
            <label class="form-label">Contraseña</label>
            <asp:TextBox ID="txtContraseña" placeholder="Contraseña" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="txtContraseña" ValidationGroup="GroupPerfil" ErrorMessage="La contraseña es obligatoria." CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="form-group">
            <label class="form-label">Imagen de Perfil</label>
            <input type="file" id="txtImagen" runat="server" class="form-control" />
        </div>
        <asp:Image ID="imagenPerfil" runat="server" CssClass="img-small"/>
        <div class="form-group">
            <asp:Button ID="btnAceptar" runat="server" Text="Guardar cambios" class="btn btn-primary" ValidationGroup="GroupPerfil" OnClick="btnAceptar_Click" />
            <asp:Button ID="btnVolver" runat="server" Text="Volver" CausesValidation="false" class="btn btn-primary" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
