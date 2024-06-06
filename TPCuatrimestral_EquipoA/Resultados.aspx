<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="TPCuatrimestral_EquipoA.Resultados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .resultados {
            background-image: url('img/edificiosupp.jpg');
            background-size: cover;
            background-position: center;
            height: 120px;
            display: flex;
            align-items: center;
            padding-left: 20px;
            color: rgb(12, 4, 4);
        }

        .resultados h1 {
            margin: 0;
        }

        .card-precio {
            color: #006744;
            font-size: 20px;
            font-family: "Roboto", sans-serif;
            font-weight: 700;
            font-style: normal;
        }

        .iconos {
            color: #000000;
            cursor: pointer;
            transition: font-weight 0.3s ease;
            margin-bottom: 15px;
            display: flex;
            justify-content: center;
        }

        .iconos i {
            margin: 0 5px;
            margin-top: 5px;
        }

        .iconos i:hover {
            color: #006744;
        }

        .card-container {
            display: flex;
            justify-content: center;
        }

        .card {
            max-width: 1000px;
            margin: 30px;
        }

        .card-body {
            display: flex;
            flex-direction: column; /* Alinea los elementos verticalmente */
            justify-content: space-between; /* Espacio uniforme entre los elementos */
            height: 100%; /* Para asegurarse de que ocupe toda la altura */
        }

        .iconos {
            margin-bottom: 15px;
        }

        .btn-outline-info {
            margin-top: auto; /* Empuja el botón hacia abajo */
            align-self: center; /* Centra el botón horizontalmente */
        }
    </style>

    <div class="resultados">
    </div>
    <br />

    <!-- Tarjeta de resultado centrada -->
    <%foreach (dominio.Inmueble miInmueble in misInmuebles)
        {
            lblDireccion.Text = miInmueble.Ubicacion.Direccion.ToString();
            lblPrecio.Text = "$" + miInmueble.Precio.ToString();
            lblMtsTotales.Text = miInmueble.Metros2.ToString() + "mts totales";
            lblMtsCubiertos.Text = miInmueble.Metros2Cubiertos.ToString() + "mts cubiertos";
            lblBaños.Text = miInmueble.Baños.ToString() + " baño/s";
            lblAmbientes.Text = miInmueble.Ambientes.ToString() + " ambiente/s";
            lblDescripcion.Text = miInmueble.Descripcion.ToString();%>
    <div class="card-container">
        <div class="card mb-3">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="<%=miInmueble.Imagenes[0].URLImagen.ToString()%>" class="img-fluid rounded-start" alt="departamento">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <asp:Label ID="lblDireccion" CssClass="h5 card-title" runat="server"></asp:Label>
                            <asp:Label ID="lblPrecio" CssClass="p card-precio" runat="server"></asp:Label>
                        </div>
                        <p class="card-text">San Fernando, G.B.A. Zona Norte, Argentina</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <i class="fa-solid fa-bath" style="color: #000000;"></i>
                            <asp:Label ID="lblMtsTotales" CssClass="h6" runat="server"></asp:Label>
                            <i class="fa-solid fa-maximize" style="color: #000000;"></i>
                            <asp:Label ID="lblMtsCubiertos" CssClass="h6" runat="server"></asp:Label>
                            <i class="fa-solid fa-bed" style="color: #000000;"></i>
                            <asp:Label ID="lblAmbientes" CssClass="h6" runat="server"></asp:Label>
                            <i class="fa-solid fa-bath" style="color: #000000;"></i>
                            <asp:Label ID="lblBaños" CssClass="h6" runat="server"></asp:Label>
                        </div>
                        <asp:Label ID="lblDescripcion" CcClass="p card-text small text-body-secondary" runat="server"></asp:Label>
                        <div class="iconos">
                            <i class="fa-brands fa-whatsapp fa-xl"></i>
                            <i class="fa-regular fa-envelope fa-xl"></i>
                            <i class="fa-regular fa-calendar-days fa-xl"></i>
                            <div>
                                <a href="DetallePropiedad.aspx" class="btn btn-outline-info">Ver Detalle</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%};%>
</asp:Content>
