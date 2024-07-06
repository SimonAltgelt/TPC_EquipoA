<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MisFavoritos.aspx.cs" Inherits="TPCuatrimestral_EquipoA.MisFavoritos" %>
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
            align-items: center;
        }

            .iconos i {
                margin: 0 60px;
                margin-top: 5px;
                font-size: 40px;
                font-weight: bold;
            }

                .iconos i:hover {
                    color: #4c6444;
                    font-weight: bold;
                }

        .card-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap; /* Permite que las tarjetas se distribuyan en varias filas si es necesario */
        }

        .card {
            width: 900px;
            height: auto;
            margin: 30px;
        }

        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
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

        .fa-xl {
            color: black;
            width: 15px;
        }

        .img-fixed {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .no-resultados {
            text-align: center;
            font-family: "Roboto", sans-serif;
            font-size: 24px;
            color: #4c6444;
            margin: 50px 0;
        }
    </style>

    <div class="resultados">
    </div>
    <br />

    <% if (listaInmuebles.Count == 0)
        { %>
        <div class="no-resultados">
            No tenés inmuebles seguidos todavía.
        </div>
    <%}else{%>
    <asp:Repeater ID="repetidorFavoritos" runat="server">
        <ItemTemplate>
            <div class="card-container">
                <div class="card mb-3">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src='<%#obtenerPrimerImagen(Eval("Imagenes"))%>' class="img-fluid rounded-start img-fixed" alt="departamento" onerror="this.onerror=null;this.src='https://images.posthousing.com/nophoto.png';">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <asp:Label ID="lblDireccion" CssClass="card-title" runat="server" Text='<%# Eval("Ubicacion.Direccion") %>'></asp:Label>
                                    <asp:Label ID="lblPrecio" CssClass="p card-precio" runat="server" Text='<%# Eval("Precio") + " USD"%>'></asp:Label>
                                </div>
                                <asp:Label ID="lblLocalidad" CssClass="p card-text" runat="server" Text='<%# Eval("Ubicacion.Localidad") + ", Buenos Aires, Argentina"%>'></asp:Label>
                                <div class="d-flex justify-content-between align-items-center">
                                    <i class="fa-solid fa-expand" style="color: #000000;"></i>
                                    <asp:Label ID="lblMtsTotales" CssClass="h6" runat="server" Text='<%# Eval("Metros2") + " mts totales"%>'></asp:Label>
                                    <i class="fa-solid fa-maximize" style="color: #000000;"></i>
                                    <asp:Label ID="lblMtsCubiertos" CssClass="h6" runat="server" Text='<%# Eval("Metros2Cubiertos") + " mts cubiertos"%>'></asp:Label>
                                    <i class="fa-solid fa-bed" style="color: #000000;"></i>
                                    <asp:Label ID="lblAmbientes" CssClass="h6" runat="server" Text='<%# Eval("Ambientes") + " ambiente/s" %>'></asp:Label>
                                    <i class="fa-solid fa-bath" style="color: #000000;"></i>
                                    <asp:Label ID="lblBaños" CssClass="h6" runat="server" Text='<%# Eval("Baños") + " baño/s"%>'></asp:Label>
                                </div>
                                <asp:Label ID="lblDescripcion" CssClass="p card-text small text-body-secondary" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label>
                                <br />
                                <br />
                                <div class="iconos">
                                    <a href="whatsapp://send?phone=541167814237&text=Hola,%20quiero%20contactarte"><i class="fab fa-whatsapp fa-xl"></i></a>
                                    <a href="Contacto.aspx"><i class="far fa-envelope fa-xl"></i></a>
                                    <asp:LinkButton ID="btnFavoritos" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="ThisBtnClick" OnClick="btnFavoritos_Click">
                                        <i class="far fa-heart fa-xl"></i>
                                    </asp:LinkButton>
                                    <a href='DetallePropiedad.aspx?id=<%# Eval("ID") %>#calendario'><i class="far fa-calendar-days fa-xl"></i></a>
                                </div>
                                <br />
                                <div class="form-group">
                                    <a href='DetallePropiedad.aspx?id=<%# Eval("ID") %>' class="btn btn-verde">VER DETALLE</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <% } %>

</asp:Content>