<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="TPCuatrimestral_EquipoA.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .tituloVenta {
            font-size: 35px;
            font-weight: bold;
            text-align: center;
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
            display: flow;
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

       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container">
        <div class="row" style="height: 100vh;">
            <!-- Columna del formulario -->
            <div class="col-md-6 d-flex align-items-center">
                <div class="w-100 text-center">
                    <label class="tituloVenta">Contactate con nosotros</label>
                    <div>
                        <label class="txtVenta">Completá el formulario y nuestro staff se pondrá en contacto con vos para asesorarte.</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre*" type="text" />
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="Group1" ErrorMessage="El nombre es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="Group1" ErrorMessage="El nombre solo debe contener letras." ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido*" type="text" />
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ValidationGroup="Group1" ErrorMessage="El apellido es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ValidationGroup="Group1" ErrorMessage="El apellido solo debe contener letras." ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Telefono*" type="tel" />
                        <label class="txtTelefono">
                            Ingrese un número completo con código de área. Ej: 112345678 (CABA) o 3511234567 (Ciudad de Córdoba)
                        </label>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ValidationGroup="Group1" ErrorMessage="El teléfono es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ValidationGroup="Group1" ErrorMessage="El teléfono solo debe contener números." ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email*" type="email" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="Group1" ErrorMessage="El email es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="Group1" ErrorMessage="El email no es válido." ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtLocalidad" runat="server" CssClass="form-control" placeholder="Localidad/provincia*" type="text" />
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="txtLocalidad" ValidationGroup="Group1" ErrorMessage="La localidad es obligatoria." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revLocalidad" runat="server" ControlToValidate="txtLocalidad" ValidationGroup="Group1" ErrorMessage="La localidad solo debe contener letras." ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtAsunto" runat="server" placeholder="Asunto" Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAsunto" runat="server" ControlToValidate="txtAsunto" ValidationGroup="Group1" ErrorMessage="El asunto de tu consulta es obligatorio." CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtConsulta" TextMode="MultiLine" Rows="6" runat="server" placeholder="Dejanos tu consulta acá." Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConsulta" runat="server" ControlToValidate="txtConsulta" ValidationGroup="Group1" ErrorMessage="El detalle de tu consulta es obligatorio." CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <br />
                    <asp:Button Text="Enviar" ValidationGroup="Group1" CssClass="btn btn-outline-success btn-largo" runat="server" OnClick="btnEnviar_Click" />
                    <asp:Button Text="Volver" CssClass="btn btn-outline-success btn-largo" CausesValidation="false" runat="server" OnClick="btnVolver_Click" />
                </div>
            </div>

            <!-- Columna de la imagen -->
            <div class="col-md-6 d-flex img-container">
                <img src="https://img.freepik.com/foto-gratis/mujer-talla-media-que-trabaja-como-abogada_23-2151054054.jpg?t=st=1717281427~exp=1717285027~hmac=037728c9b23b7fde4605fa8e985cfdea0c6d27ad3be38543a8f7f58ec9a7c1aa&w=360" />
            </div>
        </div>
    </div>
</asp:Content>
