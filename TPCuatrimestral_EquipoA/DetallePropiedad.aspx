<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallePropiedad.aspx.cs" Inherits="TPCuatrimestral_EquipoA.DetallePropiedad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        h2 {
        }

        .txtTel {
            font-size: 10px;
            font-family: "Roboto", sans-serif;
        }

        .direccion {
            color: #000;
            font-size: 20px;
            font-family: "Roboto", sans-serif;
            font-weight: 700;
            font-style: normal;
            margin-left: 180px;
        }

        .precio {
            color: #4c6444;
            font-size: 25px;
            font-family: "Roboto", sans-serif;
            font-weight: bold;
            font-style: normal;
        }

        .txtDescripcion {
            font-size: 30px;
            font-weight: bold;
            font-family: "Roboto", sans-serif;
        }

        .txtContacto {
            font-size: 30px;
            font-weight: bold;
            color: #4c6444;
            font-family: "Roboto", sans-serif;
        }

        .txtInfo {
            font-size: 18px;
            font-weight: bold;
            color: #4c6444;
            font-family: "Roboto", sans-serif;
        }

        .txtInfoDescripcion {
            font-size: 15px;
            font-weight: bold;
            color: rgb(0, 0, 0, 0,80);
            font-family: "Roboto", sans-serif;
        }

        .custom-border {
            border: 2px solid #4c6444;
            border-radius: 15px;
            padding: 20px;
        }

        .carousel-item img {
            width: 100%;
            height: 800px;
            object-fit: cover;
        }

        .d-block {
            display: flex;
            width: 600px;
            height: 600px;
        }

        .btn-verde {
            background-color: #4c6444;
            color: white;
            font-family: "Roboto", sans-serif;
            font-size: 16px;
            font-style: normal;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            transition: all 0.3s;
            width: 100%;
        }

        .container-alquiler {
            background-color: #4c6444;
            color: white;
            font-family: "Roboto", sans-serif;
            font-size: 20px;
            font-style: normal;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            width: 100%;
        }

        .form-control {
            resize: none;
        }

        .icono-detalle {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 10px;
            font-size: 25px;
        }

        .lbl-detalle {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 10px;
            font-size: 20px;
        }

        .btn-primary {
            background-color: #356AA0;
            border-color: #356AA0;
            margin-left: 15.8%;
        }

            .btn-primary:hover {
                background-color: #356AA0;
                border-color: #356AA0;
                color: black;
            }

        #info {
            width: 570px;
            margin-left: 35%;
            padding: 14px;
        }

        .turno {
            background-color: #4c6444;
            color: white;
            font-family: "Roboto", sans-serif;
            font-size: 16px;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            transition: all 0.3s;
            justify-content: center;
            align-content: center;
            align-items: center;
            width: 40%;
            margin-left: 15.8%;
        }

        .small-space {
            margin-top: 5px;
        }

        .capturado{
            margin-left:15.8%
        }
    </style>

    <br />
    <div class="container text-center">
        <div class="row">
            <!-- CARRUSEL -->
            <div class="col-8">
                <div id="carouselExampleRide" class="carousel slide">
                    <div class="carousel-inner">
                        <% bool esActivo = true;
                            foreach (dominio.Imagen miImagen in miInmueble.Imagenes)
                            { %>
                        <div class="carousel-item <%= esActivo ? "active" : "" %>">
                            <img src="<%= miImagen.URLImagen %>" alt="Imagen de la propiedad" class="d-block w-100" onerror="this.onerror=null;this.src='https://images.posthousing.com/nophoto.png';">
                        </div>
                        <% esActivo = false; // setea el esActive a falso despues de la primer iteracion
                            } %>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <!-- CONATCTO -->
            <div class="col-4 custom-border ">
                <div class="w-100">
                    <div class="container text-center">
                        <label class="txtContacto">CONTACTO</label>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre" />
                        <asp:RequiredFieldValidator id="rfvNombre" runat="server" controltovalidate="txtNombre" ValidationGroup="Consulta" errormessage="El nombre es obligatorio." cssclass="text-danger" display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="Consulta" ErrorMessage="El nombre solo debe contener letras." ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido" />
                        <asp:RequiredFieldValidator id="rfvApellido" runat="server" controltovalidate="txtApellido" ValidationGroup="Consulta" errormessage="El apellido es obligatorio." cssclass="text-danger" display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ValidationGroup="Consulta" ErrorMessage="El apellido solo debe contener letras." ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Teléfono" />
                        <asp:RequiredFieldValidator ID="rfvTel" runat="server" ControlToValidate="txtTelefono" ValidationGroup="Consulta" ErrorMessage="El teléfono es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revTel" runat="server" ControlToValidate="txtTelefono" ValidationGroup="Consulta" ErrorMessage="El teléfono solo debe contener números." ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
                        <label class="txtTel">
                            Ingrese un número completo con código de área. Ej: 112345678 (CABA) o 3511234567 (Ciudad de Córdoba)
                        </label>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Email" />
                        <asp:RequiredFieldValidator id="rfvEmail" runat="server" controltovalidate="txtEmail" ValidationGroup="Consulta" errormessage="El email es obligatorio." cssclass="text-danger" display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="Consulta" ErrorMessage="El email no es válido." ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:TextBox ID="txtConsulta" TextMode="MultiLine" Rows="6" runat="server" placeholder="Dejanos tu consulta acá." Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConsulta" runat="server" ControlToValidate="txtConsulta" ValidationGroup="Consulta" ErrorMessage="El detalle de tu consulta es obligatorio." CssClass="text-danger" Display="Dynamic" />
                    </div>
                    <br />
                    <br />
                    <asp:Button CssClass="btn btn-verde" Text="Enviar" ValidationGroup="Consulta" runat="server"/>
                </div>
            </div>
        </div>
    </div>
    <br />
    <%--  --%>

    <!-- DATOS DE LA PROPIEDAD -->
    <div class="container text-center">
        <%
            lblPrecio.Text = miInmueble.Precio.ToString() + " USD";
            lblNombre.Text = miInmueble.Ubicacion.Direccion.ToString() + ", " + miInmueble.Ubicacion.Localidad.ToString();
            lblMetrosTotales.Text = miInmueble.Metros2.ToString() + "mts Totales";
            lblMetrosCubiertos.Text = miInmueble.Metros2Cubiertos.ToString() + "mts Cubiertos";
            lblAmbientes.Text = miInmueble.Ambientes.ToString() + " ambiente/s";
            lblBaños.Text = miInmueble.Baños.ToString() + " baño/s";
            lblDescripcion.Text = miInmueble.Descripcion.ToString();
        %>
        <div class="row custom-border">
            <div class="container-alquiler">
                <asp:Label ID="lblAlquiler" Text="ALQUILER" runat="server" />
            </div>
            <asp:Label ID="lblPrecio" CssClass="p precio" runat="server"></asp:Label>
        </div>
        <br />
        <div class="row custom-border">
            <asp:Label ID="lblNombre" runat="server" />
        </div>
        <br />
        <div class="custom-border d-flex flex-column justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <div class="icono-detalle">
                    <i class="fa-solid fa-expand" style="color: #000000;"></i>
                </div>
                <div class="lbl-detalle">
                    <asp:Label ID="lblMetrosTotales" CssClass="h6" runat="server"></asp:Label>
                </div>
            </div>
            <div class="d-flex align-items-center">
                <div class="icono-detalle">
                    <i class="fa-solid fa-maximize " style="color: #000000;"></i>
                </div>
                <div class="lbl-detalle">
                    <asp:Label ID="lblMetrosCubiertos" CssClass="h6" runat="server"></asp:Label>
                </div>
            </div>
            <div class="d-flex align-items-center">
                <div class="icono-detalle">
                    <i class="fa-solid fa-bed" style="color: #000000;"></i>
                </div>
                <div class="lbl-detalle">
                    <asp:Label ID="lblAmbientes" CssClass="h6" runat="server"></asp:Label>
                </div>
            </div>
            <div class="d-flex align-items-center">
                <div class="icono-detalle">
                    <i class="fa-solid fa-bath" style="color: #000000;"></i>
                </div>
                <div class="lbl-detalle">
                    <asp:Label ID="lblBaños" CssClass="h6" runat="server"></asp:Label>
                </div>
            </div>
        </div>
        <br />
        <div class="row custom-border">
            <asp:Label ID="lblDescripcion" CssClass="p card-text small text-body-secondary" runat="server"></asp:Label>
        </div>
    </div>
    <br />
    <%-- INFO A CONSIDERAR --%>
    <h2 class="txtContacto" style="text-align: center" id="calendario">TURNOS DE VISITA DISPONIBLES</h2>
    <div id="info" class="row custom-border text-center">
        <div class="txtInfo">
            Información a considerar:
        </div>
        <div class="txtInfoDescripcion">
            TURNO MAÑANA: 9hs. - 11hs.
        </div>
        <div class="txtInfoDescripcion">
            TURNO MEDIODIA: 11:30hs. - 13:30hs.
        </div>
        <div class="txtInfoDescripcion">
            TURNO TARDE: 14hs. - 16hs.
        </div>
        <br />
    </div>
    <br />
    <% if (Session["Usuario"] != null)
        {

    %>
    <%-- CALENDARIO --%>
    <div class="container text-center">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-5" style="margin-left: 16.8%">

                <asp:ScriptManager runat="server" />
                <asp:UpdatePanel ID="updCalendario" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                        <asp:Calendar ID="Calendario" runat="server" OnSelectionChanged="Calendario_SelectionChanged">

                            <OtherMonthDayStyle ForeColor="LightGray"></OtherMonthDayStyle>
                            <TitleStyle BackColor="#4c6444" ForeColor="Black"></TitleStyle>
                            <DayStyle BackColor="White"></DayStyle>
                            <SelectedDayStyle BackColor="#4d2d18" Font-Bold="True"></SelectedDayStyle>

                        </asp:Calendar>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
            <br />

            <div style="margin-left: -202px">
                <br />
                <asp:RadioButton ID="TurnoMañana" Text="Turno Mañana" CssClass="btn btn-verde turno small-space" GroupName="RadioGroup1" runat="server" />
                <asp:RadioButton ID="TurnoMediodia" Text="Turno Mediodia" CssClass="btn btn-verde turno small-space" GroupName="RadioGroup1" runat="server" />
                <asp:RadioButton ID="TurnoTarde" Text="Turno Tarde" CssClass="btn btn-verde turno small-space" GroupName="RadioGroup1" runat="server" /><br />
                <br />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Button ID="Confirmar" Text="Confirmar turno" CssClass="btn btn-primary" OnClick="Confirmar_Click" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Label ID="LblCapturaDia" CssClass="h3 capturado" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <%}
        else
        {%>
    <div style="text-align: center;">
        Para seleccionar un turno en el calendario por favor, 
        <a href="InicioSesion.aspx">inicie sesión</a>.
    </div>
    <% } %>
    <br />
    <%-- FIN CALENDARIO  --%>
</asp:Content>
