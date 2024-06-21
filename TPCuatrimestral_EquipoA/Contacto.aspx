<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="TPCuatrimestral_EquipoA.Contacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .tituloVenta {
            font-size: 35px;
            font-weight: bold;
            text-align: center;
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
            display: flow;
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
            <div class="col-md-6 d-flex align-items-center">
                <div class="w-100 text-center">
                    <!-- NO PUEDO CENTAR EL TITULO -->
                    <label class="tituloVenta">Contactate con nosotros</label>
                    <div>
                        <label class="txtVenta">Completá el formulario y nuestro staff se pondrá en contacto con vos para asesorarte.</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Nombre*">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="Apellido*">
                    </div>
                    <div class="form-group">
                        <input type="tel" class="form-control" id="exampleFormControlInput3" placeholder="Telefono*">
                        <label class="txtTelefono">
                            Ingrese un número completo con código de área. Ej: 112345678 (CABA) o 3511234567 (Ciudad de Córdoba)
                        </label>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" id="exampleFormControlInput4" placeholder="name@example.com">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="exampleFormControlInput5" placeholder="Localidad/provincia*">
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" placeholder="Consulta"></textarea>
                    </div>
                    <br />
                    <button type="button" class="btn btn-outline-success btn-largo">Enviar</button>
                </div>
            </div>

            <!-- Columna de la imagen -->
            <div class="col-md-6 d-flex img-container">
                <img src="https://img.freepik.com/foto-gratis/mujer-talla-media-que-trabaja-como-abogada_23-2151054054.jpg?t=st=1717281427~exp=1717285027~hmac=037728c9b23b7fde4605fa8e985cfdea0c6d27ad3be38543a8f7f58ec9a7c1aa&w=360" />
            </div>
        </div>
    </div>
</asp:Content>
