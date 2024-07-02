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
            color: #4c6444;
            font-size: 20px;
            font-family: "Roboto", sans-serif;
            font-weight: 900;
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
                    color: #4c6444;
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
            font-family: "Roboto", sans-serif;
            font-weight: 600;
            font-style: italic;
        }

        .card-title {
            font-size: 24px;
            font-family: "Roboto", sans-serif;
            font-weight: 600;
            font-style: normal;
        }

        .iconos {
            color: #000000;
            cursor: pointer;
            transition: font-weight 0.3s ease;
            margin-bottom: 10px;
            display: flex;
            justify-content: center;
        }

            .iconos i {
                margin: 0 15px;
                font-size: 2em;
                font-weight: bold;
            }

                .iconos i:hover {
                    color: #4c6444;
                    font-size: 2.2em;
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

            .btn-verde:hover {
                transform: scale(1.01);
                color: white;
                font-weight: bold;
                font-size: 18px;
            }

        .fa-xl{
            color:black;
            width:15px;
        }
    </style>

    <div class="resultados">
    </div>
    <br />

    <!-- Tarjeta de resultado centrada -->
    <%foreach (dominio.Inmueble miInmueble in listaInmuebles)
        {
            lblDireccion.Text = miInmueble.Ubicacion.Direccion.ToString();
            lblPrecio.Text = "$" + miInmueble.Precio.ToString();
            lblLocalidad.Text = miInmueble.Ubicacion.Localidad.ToString() + ", Buenos Aires, Argentina";
            lblMtsTotales.Text = miInmueble.Metros2.ToString() + "mts totales";
            lblMtsCubiertos.Text = miInmueble.Metros2Cubiertos.ToString() + "mts cubiertos";
            lblBaños.Text = miInmueble.Baños.ToString() + " baño/s";
            lblAmbientes.Text = miInmueble.Ambientes.ToString() + " ambiente/s";
            lblDescripcion.Text = miInmueble.Descripcion.ToString();%>

    <div class="card-container">
        <div class="card mb-3">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="<%=miInmueble.Imagenes[0].URLImagen.ToString()%>" class="img-fluid rounded-start" alt="departamento" onerror="this.onerror=null;this.src='https://images.posthousing.com/nophoto.png';">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <asp:Label ID="lblDireccion" Class="card-title" runat="server"></asp:Label>
                            <asp:Label ID="lblPrecio" CssClass="p card-precio" runat="server"></asp:Label>
                        </div>
                        <asp:Label ID="lblLocalidad" CssClass="p card-text" runat="server"></asp:Label>
                        <div class="d-flex justify-content-between align-items-center">
                            <i class="fa-solid fa-expand" style="color: #000000;"></i>
                            <asp:Label ID="lblMtsTotales" CssClass="h6" runat="server"></asp:Label>
                            <i class="fa-solid fa-maximize" style="color: #000000;"></i>
                            <asp:Label ID="lblMtsCubiertos" CssClass="h6" runat="server"></asp:Label>
                            <i class="fa-solid fa-bed" style="color: #000000;"></i>
                            <asp:Label ID="lblAmbientes" CssClass="h6" runat="server"></asp:Label>
                            <i class="fa-solid fa-bath" style="color: #000000;"></i>
                            <asp:Label ID="lblBaños" CssClass="h6" runat="server"></asp:Label>
                        </div>
                        <asp:Label ID="lblDescripcion" CcClass="p card-text small text-body-secondary" runat="server"></asp:Label>
                        <br />
                        <br />

                        <div class="iconos">
                            <i class="fa-brands fa-whatsapp fa-xl"></i>
                            <i class="fa-regular fa-envelope fa-xl"></i>
                            <a href="DetallePropiedad.aspx?id=<%=miInmueble.ID%>#calendario" style="margin-top:-10px; margin-left:5px"><i class="fa-regular fa-calendar-days fa-xl"></i></a>
                        </div>
                        <br />

                        <div class="form-group">
                            <a href="DetallePropiedad.aspx?id=<%=miInmueble.ID%>" class="btn btn-verde">VER DETALLE</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%};%>
</asp:Content>
