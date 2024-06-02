<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="TPCuatrimestral_EquipoA.Resultados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .resultados {
            background-image: url('img/ciudad.png');
            background-size: cover;
            background-position: center;
            height: 120px;
            display: flex;
            align-items: center;
            padding-left: 20px;
            color: wheat;
            padding-top: 40px;
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
        <h1>Resultados de la búsqueda</h1>
    </div>
    <br />

    <!-- Tarjeta de resultado centrada -->
    <div class="card-container">
        <div class="card mb-3">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="./img/departamento.png" class="img-fluid rounded-start" alt="departamento">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="card-title">Calle Falsa 123</h5>
                            <p class="card-precio">$ 540.000</p>
                        </div>
                        <p class="card-text">San Fernando, G.B.A. Zona Norte, Argentina</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <i class="fa-solid fa-bath" style="color: #000000;"></i>
                            <h6>100 mts Totales</h6>
                            <i class="fa-solid fa-maximize" style="color: #000000;"></i>
                            <h6>88 mts Cubiertos</h6>
                            <i class="fa-solid fa-bed" style="color: #000000;"></i>
                            <h6>3 ambientes</h6>
                            <i class="fa-solid fa-bath" style="color: #000000;"></i>
                            <h6>1 baño</h6>
                        </div>
                        <p class="card-text">
                            <small class="text-body-secondary">Dpto. 2amb. Con Toilette y Cochera Descubierta. Edificio de 4 pisos de excelente calidad constructiva. Ubicado en un primer piso al co ...</small>
                        </p>
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
</asp:Content>
