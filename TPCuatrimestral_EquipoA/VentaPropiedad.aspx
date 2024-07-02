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
                        <asp:TextBox ID="Nombre" runat="server" CssClass="form-control" placeholder="Nombre*" type="text" />
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="Nombre" ErrorMessage="El nombre es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="Nombre" ErrorMessage="El nombre solo debe contener letras." ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />

                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="Apellido" runat="server" CssClass="form-control" placeholder="Apellido*" type="text" />
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="Apellido" ErrorMessage="El apellido es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="Apellido" ErrorMessage="El apellido solo debe contener letras." ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />

                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="Telefono" runat="server" CssClass="form-control" placeholder="Telefono*" type="tel" />
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="Telefono" ErrorMessage="El teléfono es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="Telefono" ErrorMessage="El teléfono solo debe contener números." ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
                        <label class="txtTelefono">
                            Ingrese un número completo con código de área. Ej: 112345678 (CABA) o 3511234567 (Ciudad de Córdoba)
                        </label>
                    </div>
                    <div class="form-group">
                   <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Email*" type="email" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="Email" ErrorMessage="El email es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="Email" ErrorMessage="El email no es válido." ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" CssClass="text-danger" Display="Dynamic" />
                        </div>
                    <div class="form-group">
                        <asp:TextBox id="Localidad" runat="server" CssClass="form-control" placeholder="Localidad/provincia*" type="text" />
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="Localidad" ErrorMessage="La localidad es obligatoria." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revLocalidad" runat="server" ControlToValidate="Localidad" ErrorMessage="La localidad solo debe contener letras." ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <div class="form-group text-left">
                        <label class="tipoPropiedad">Tipo de propiedad*</label>
                        <select class="form-control" id="exampleFormControlSelect1">
                            <option>DEPARTAMENTO</option>
                            <option>CASA</option>
                            <option>PH</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" placeholder="Comentarios"></textarea>
                    </div>
                    <button type="button" class="btn btn-outline-success btn-largo">Enviar</button>
                </div>
            </div>

            <!-- Columna de la imagen -->
            <div class="col-md-6 img-container">
                <img src="img/invertir-en-departamentos.png" class="img-fluid" />
            </div>
        </div>
    </div>
</asp:Content>
