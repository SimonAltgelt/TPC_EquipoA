<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="TPCuatrimestral_EquipoA.Administracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="resultados">
        <h1>Administración</h1>
    </div>
    <% foreach (dominio.Inmueble miInmueble in todoInmueble)
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
                    <img src="<%=miInmueble.Imagenes[0].URLImagen.ToString()%>" class="img-fluid rounded-start" alt="departamento">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <asp:Label ID="lblDireccion" CssClass="h5 card-title" runat="server"></asp:Label>
                            <asp:Label ID="lblPrecio" CssClass="p card-precio" runat="server"></asp:Label>
                        </div>
                        <asp:Label ID="lblLocalidad" CssClass="p card-text" runat="server"></asp:Label>
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
