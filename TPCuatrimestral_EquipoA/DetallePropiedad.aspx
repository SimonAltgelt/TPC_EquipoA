<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallePropiedad.aspx.cs" Inherits="TPCuatrimestral_EquipoA.DetallePropiedad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .txtTel {
            font-size: 10px;
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
            color: #006744;
            font-size: 20px;
            font-family: "Roboto", sans-serif;
            font-weight: 700;
            font-style: normal;
        }

        .txtDescripcion {
            font-size: 30px;
            font-weight: bold;
        }

        .txtContacto {
            font-size: 30px;
            font-weight: bold;
            color: #006744;
        }

        .btn-secondary {
        }

        .custom-border {
            border: 2px solid #006744;
            border-radius: 15px;
            padding: 20px;
        }
    </style>
    <div class=" container text-center">
        <label class="txtDescripcion">Dpto. 2amb Con Cochera Descubierta. </label>
    </div>
    <div class="container text-center">
        <div class="row">
            <!-- CARRUSEL -->
            <!-- me quedaron 2 columas transparentonas horribles -->
            <div class="col-8">
                <div id="carouselExampleRide" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="img/cocina.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="img/dormitorio.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="img/living.png" class="d-block w-100" alt="...">
                        </div>
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
                    <div class=" container text-center">
                        <label class="txtContacto">CONTACTO </label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Nombre*">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="Apellido*">
                    </div>
                    <div class="form-group">
                        <input type="tel" class="form-control" id="exampleFormControlInput3" placeholder="Telefono*">
                        <label class="txtTel">
                            Ingrese un número completo con código de área. Ej: 112345678 (CABA) o 3511234567 (Ciudad de Córdoba)
                        </label>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" id="exampleFormControlInput4" placeholder="name@example.com">
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" placeholder="Comentarios"></textarea>
                    </div>
                    <button type="button" class="btn btn-outline-success">Enviar</button>
                </div>
            </div>
        </div>
    </div>
    <br />
    <!-- DATOS DE LA PROPIEDAD -->
    <div class="container text-center">

        <%
            lblPrecio.Text = "$" + misInmuebles[1].Precio.ToString();
            lblNombre.Text = misInmuebles[1].Ubicacion.Direccion.ToString() + ", " + misInmuebles[1].Ubicacion.Localidad.ToString();
            lblMetrosTotales.Text = misInmuebles[1].Metros2.ToString() + "mts Totales";
            lblMetrosCubiertos.Text = misInmuebles[1].Metros2Cubiertos.ToString() + "mts Cubiertos";
            lblAmbientes.Text = misInmuebles[1].Ambientes.ToString() + " ambiente/s";
            lblBaños.Text = misInmuebles[1].Baños.ToString() + " baño/s";
            lblDescripcion.Text = misInmuebles[1].Descripcion.ToString();
        %>

        <div class="row custom-border">
            <!-- ESTE BOTON NO LLEVA A NINGUN LADO, LO PONGO POR EL ESTILO DEBERIA DECIR ACA 
                SI LA PROP ESTA EN VENTA O ALQUILER-->
            <button type="button" class="btn btn-secondary" disabled>ALQUILER</button>
            <asp:Label ID="lblPrecio" CssClass="p precio" runat="server"></asp:Label>
        </div>

        <br />

        <div class="row custom-border">
            <asp:Label ID="lblNombre" runat="server" />
        </div>

        <br />

        <div class="row custom-border d-flex justify-content-between align-items-center">
            <i class="fa-solid fa-bath" style="color: #000000;"></i>
            <asp:Label ID="lblMetrosTotales" CssClass="h6" runat="server"></asp:Label>

            <i class="fa-solid fa-maximize " style="color: #000000;"></i>
            <asp:Label ID="lblMetrosCubiertos" CssClass="h6" runat="server"></asp:Label>

            <i class="fa-solid fa-bed" style="color: #000000;"></i>
            <asp:Label ID="lblAmbientes" CssClass="h6" runat="server"></asp:Label>

            <i class="fa-solid fa-bath" style="color: #000000;"></i>
            <asp:Label ID="lblBaños" CssClass="h6" runat="server"></asp:Label>
        </div>

        <br />

        <div class="row custom-border">
            <asp:Label ID="lblDescripcion" CssClass="p card-text small text-body-secondary" runat="server"></asp:Label>
        </div>
    </div>







</asp:Content>
