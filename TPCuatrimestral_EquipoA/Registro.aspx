<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPCuatrimestral_EquipoA.Registro" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Usuario" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtContraseña" runat="server" CssClass="form-control" TextMode="Password" placeholder="Contraseña" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtConfirmaContra" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirma Contraseña" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Email" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtTel" runat="server" CssClass="form-control" placeholder="Telefono" />
            </div>
            <div class="form-group form-check">
                <asp:CheckBox ID="chkRecuerdame" runat="server" CssClass="form-check-input" />
                <asp:Label ID="lblRecuardame" runat="server" AssociatedControlID="chkRecuerdame" CssClass="form-check-label" Text="Recuerdame" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Text="Registrarme" />
                <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-link" Text="Cancelar" />
            </div>
        </div>
    </form>
</body>
</html>
