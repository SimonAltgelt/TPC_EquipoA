<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="TPCuatrimestral_EquipoA.InicioSesion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Inicio de Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
    <style>
        body {
            background: url('img/inicio.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .jumbotron {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 120%;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="jumbotron col-md-6">
            <h2 class="text-center">Iniciar Sesión</h2>
            <div class="form-group">
                <label for="email">Correo Electrónico</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Correo Electrónico" type="email" />
            </div>
            <div class="form-group">
                <label for="password">Contraseña</label>
                <asp:TextBox ID="password" runat="server" CssClass="form-control" placeholder="Contraseña" TextMode="Password" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblForgotPassword" runat="server" CssClass="form-text text-muted">
                    <a href=#>¿Olvidaste tu contraseña?</a>
                </asp:Label>
            </div>
            <div class="form-group">
                <asp:CheckBox ID="chkMantenerSesion" runat="server"/>
                <label>Mantener sesión iniciada </label>
            </div>
            <div class="form-group text-center">
                <asp:Button ID="btnIniciarSesion" runat="server" CssClass="btn btn-primary" OnClick="btnLogin" Text="Iniciar Sesión" />
                <a href="Registro.aspx" class="btn btn-outline-success">Registrarme</a>
            </div>
        </div>
    </form>
</body>
</html>
