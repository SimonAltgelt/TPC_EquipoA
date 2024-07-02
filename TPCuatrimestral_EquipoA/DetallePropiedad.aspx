<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallePropiedad.aspx.cs" Inherits="TPCuatrimestral_EquipoA.DetallePropiedad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <style>
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
            background-color: #4c6444;
            border-color: #4c6444;
        }

            .btn-primary:hover {
                background-color: #4c6444;
                border-color: #4c6444;
                color: black;
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
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Nombre*">
                    </div>
                    <br />
                    <div class="form-group">
                        <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="Apellido*">
                    </div>
                    <br />
                    <div class="form-group">
                        <input type="tel" class="form-control" id="exampleFormControlInput3" placeholder="Telefono*">
                        <label class="txtTel">
                            Ingrese un número completo con código de área. Ej: 112345678 (CABA) o 3511234567 (Ciudad de Córdoba)
                        </label>
                    </div>
                    <br />
                    <div class="form-group">
                        <input type="email" class="form-control" id="exampleFormControlInput4" placeholder="name@example.com">
                    </div>
                    <br />
                    <div class="form-group">
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" placeholder="Comentarios"></textarea>
                    </div>
                    <br />
                    <br />
                    <button type="button" class="btn btn-verde" id="calendario">Enviar</button>
                </div>
            </div>
        </div>
    </div>
    <br />
    <%--  --%>
    <%-- CALENDARIO --%>
    <div class="container text-center">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-5" style="margin-left: 112px">
                <asp:Calendar ID="Calendario" runat="server" OnSelectionChanged="Calendario_SelectionChanged">
                    <OtherMonthDayStyle ForeColor="LightGray"></OtherMonthDayStyle>
                    <TitleStyle BackColor="#4c6444"
                        ForeColor="Black"></TitleStyle>
                    <DayStyle BackColor="White"></DayStyle>
                    <SelectedDayStyle BackColor="#4d2d18"
                        Font-Bold="True"></SelectedDayStyle>
                </asp:Calendar>
            </div>

            <div class="col-md-5" style="margin-left:-202px">
                <asp:RadioButton ID="TurnoMañana" Text="Turno Mañana" CssClass="btn btn-verde" GroupName="RadioGroup1" runat="server" /><br />
                <asp:RadioButton ID="TurnoMediodia" Text="Turno Mediodia" CssClass="btn btn-verde" GroupName="RadioGroup1" runat="server" /><br />
                <asp:RadioButton ID="TurnoTarde" Text="Turno Tarde" CssClass="btn btn-verde" GroupName="RadioGroup1" runat="server" /><br />
                <br />
                <asp:Button ID="Confirmar" Text="Confirmar turno" CssClass="btn btn-primary" OnClick="Confirmar_Click" runat="server" />
                <br />
                <asp:Label ID="LblCapturaDia" CssClass="h3" runat="server"></asp:Label>
            </div>
        </div>
    </div>

    <br />
    <%-- FIN CALENDARIO  --%>

    <!-- DATOS DE LA PROPIEDAD -->
    <div class="container text-center">
        <%
            lblPrecio.Text = "$" + miInmueble.Precio.ToString();
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
</asp:Content>
