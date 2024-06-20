﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallePropiedad.aspx.cs" Inherits="TPCuatrimestral_EquipoA.DetallePropiedad" %>

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
            color: #4c6444;
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
            color: #4c6444;
        }

        .btn-secondary {
        }

        .custom-border {
            border: 2px solid #4c6444;
            border-radius: 15px;
            padding: 20px;
        }

        .carousel-item img {
            width: 100%;
            height: 800px;
            object-fit: cover; /* Puedes cambiar esto a 'contain' si prefieres que las imágenes se ajusten sin recortar */
        }

        .d-block {
           display: flex;
           width: 600px;
           height: 600px;
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
                            <img src="<%= miImagen.URLImagen %>" alt="Imagen de la propiedad" class="d-block w-100">
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
            lblPrecio.Text = "$" + miInmueble.Precio.ToString();
            lblNombre.Text = miInmueble.Ubicacion.Direccion.ToString() + ", " + miInmueble.Ubicacion.Localidad.ToString();
            lblMetrosTotales.Text = miInmueble.Metros2.ToString() + "mts Totales";
            lblMetrosCubiertos.Text = miInmueble.Metros2Cubiertos.ToString() + "mts Cubiertos";
            lblAmbientes.Text = miInmueble.Ambientes.ToString() + " ambiente/s";
            lblBaños.Text = miInmueble.Baños.ToString() + " baño/s";
            lblDescripcion.Text = miInmueble.Descripcion.ToString();
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
