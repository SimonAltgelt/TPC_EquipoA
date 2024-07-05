<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPCuatrimestral_EquipoA.Registro" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
    <style>
        body {
            background: url('img/Registro.jpg') no-repeat center;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, Helvetica, sans-serif;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 130%;
            text-align: center;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .form-container h2 {
            
            margin-bottom: 1rem;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-link {
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>REGISTRARME</h2>
            <div class="form-group">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre" />
                <asp:RequiredFieldValidator id="rfvNombre" runat="server" controltovalidate="txtNombre" ValidationGroup="GroupRegistro" errormessage="El nombre es obligatorio." cssclass="text-danger" display="Dynamic" />
                <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="GroupRegistro" ErrorMessage="El nombre solo debe contener letras." ValidationExpression="^[a-zA-Z\sáéíóúÁÉÍÓÚñÑ]+$" CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido" />
                <asp:RequiredFieldValidator id="rfvApellido" runat="server" controltovalidate="txtApellido" ValidationGroup="GroupRegistro" errormessage="El apellido es obligatorio." cssclass="text-danger" display="Dynamic" />
                <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ValidationGroup="GroupRegistro" ErrorMessage="El apellido solo debe contener letras." ValidationExpression="^[a-zA-Z\sáéíóúÁÉÍÓÚñÑ]+$" CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Email" />
                <asp:RequiredFieldValidator id="rfvEmail" runat="server" controltovalidate="txtEmail" ValidationGroup="GroupRegistro" errormessage="El email es obligatorio." cssclass="text-danger" display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="GroupRegistro" ErrorMessage="El email no es válido." ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtContraseña" runat="server" CssClass="form-control" TextMode="Password" placeholder="Contraseña" />
                <asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="txtContraseña" ValidationGroup="GroupRegistro" ErrorMessage="La contraseña es obligatoria." CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtTel" runat="server" CssClass="form-control" placeholder="Teléfono" />
                <asp:RequiredFieldValidator ID="rfvTel" runat="server" ControlToValidate="txtTel" ValidationGroup="GroupRegistro" ErrorMessage="El teléfono es obligatorio." CssClass="text-danger" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revTel" runat="server" ControlToValidate="txtTel" ValidationGroup="GroupRegistro" ErrorMessage="El teléfono solo debe contener números." ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="form-group">
                <asp:CheckBox ID="chkRecuerdame" runat="server"/>
                <asp:Label ID="lblRecuerdame" runat="server" AssociatedControlID="chkRecuerdame" CssClass="form-check-label" Text="Recuérdame" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Text="Registrarme" ValidationGroup="GroupRegistro" OnClick="btnRegistrar_Click" />
                <asp:Button ID="btnCancelar" runat="server" CausesValidation="false" CssClass="btn btn-link" Text="Cancelar" OnClick="btnCancelar_Click" />
            </div>
        </div>
    </form>
</body>
</html>
