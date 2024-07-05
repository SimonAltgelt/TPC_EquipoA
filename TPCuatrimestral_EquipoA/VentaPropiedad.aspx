<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VentaPropiedad.aspx.cs" Inherits="TPCuatrimestral_EquipoA.VentaPropiedad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .tituloVenta {
            font-size: 35px;
            font-weight: bold;
        }

        .txtVenta {
            font-size: 20px;
            text-align: center;
        }

        .txtTelefono {
            font-size: 9px;
        }

        .tipoPropiedad {
            font-size: 12px;
            color: dimgray;
        }

        .img-container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }

        .img-fluid {
            max-height: 100%;
            object-fit: cover;
        }

        .form-control {
            resize: none;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .btn-largo {
            width: 80%;
        }
    </style>

    <div class="container">
        <div class="row" style="height: 100vh;">
            <!-- Columna del formulario -->
            <div class="col-md-6 d-flex align-items-center justify-content-center">
                <div class="w-100 text-center">
                    <label class="tituloVenta">Tasa tu propiedad</label>
                    <div>
                        <label class="txtVenta">Completá el formulario y nuestro staff se pondrá en contacto con vos para continuar con el proceso.</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre*" type="text" />
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="GroupVenta"
                            ErrorMessage="El nombre es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="GroupVenta" ErrorMessage="El nombre solo debe contener letras." ValidationExpression="^[a-zA-Z\sáéíóúÁÉÍÓÚñÑ]+$" CssClass="text-danger" Display="Dynamic" />

                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido*" type="text" />
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ValidationGroup="GroupVenta"
                            ErrorMessage="El apellido es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ValidationGroup="GroupVenta" ErrorMessage="El apellido solo debe contener letras." ValidationExpression="^[a-zA-Z\sáéíóúÁÉÍÓÚñÑ]+$" CssClass="text-danger" Display="Dynamic" />

                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Telefono*" type="tel" />
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ValidationGroup="GroupVenta"
                            ErrorMessage="El teléfono es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ValidationGroup="GroupVenta" ErrorMessage="El teléfono solo debe contener números." ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
                        <label class="txtTelefono">
                            Ingrese un número completo con código de área. Ej: 112345678 (CABA) o 3511234567 (Ciudad de Córdoba)
                        </label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email*" type="email" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="GroupVenta"
                            ErrorMessage="El email es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="GroupVenta" ErrorMessage="El email no es válido." ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtLocalidad" runat="server" CssClass="form-control" placeholder="Localidad/provincia*" type="text" />
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="txtLocalidad" ValidationGroup="GroupVenta"
                            ErrorMessage="La localidad es obligatoria." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revLocalidad" runat="server" ControlToValidate="txtLocalidad" ValidationGroup="GroupVenta" ErrorMessage="La localidad solo puede contener letras y números." ValidationExpression="^[a-zA-Z0-9\sáéíóúÁÉÍÓÚñÑ]+$" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <div class="form-group text-left">
                        <label class="tipoPropiedad">Tipo de propiedad*</label>
                        <select class="form-control" id="exampleFormControlSelect1">
                            <option>CASA</option>
                            <option>DEPARTAMENTO</option>
                            <option>PH</option>
                            <option>TERRENO</option>
                            <option>OFICINA</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" placeholder="Comentarios"></textarea>
                    </div>
                    <asp:Button ID="btnEnviar" Text="Enviar" CssClass="btn btn-outline-success btn-largo" ValidationGroup="GroupVenta" runat="server" OnClick="btnEnviar_Click" />
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" CausesValidation="false" CssClass="btn btn-outline-success btn-largo" OnClick="btnVolver_Click" />
                </div>
            </div>

            <!-- Columna de la imagen -->
            <div class="col-md-6 img-container">
                <img src="img/invertir-en-departamentos.png" class="img-fluid" />
            </div>
        </div>
    </div>
</asp:Content>
