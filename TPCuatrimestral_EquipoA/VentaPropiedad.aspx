<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VentaPropiedad.aspx.cs" Inherits="TPCuatrimestral_EquipoA.VentaPropiedad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .tituloVenta {
            font-size: 35px;
            font-weight: bold;
            text-align:center;
            
        }

        .txtVenta {
            font-size: 20px;
            text-align:center;
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
    </style>

    <div class="container">
        <div class="row" style="height: 100vh;">
            <!-- Columna del formulario -->
            <div class="col-md-6 d-flex align-items-center">
                <div class="w-100">
                    <!-- NO PUEDO CENTAR EL TITULO -->
                    <label class="tituloVenta">Vendé tu propiedad</label>
                    <div>
                        <label class="txtVenta">Completá el formulario y nuestro staff se pondrá en contacto con vos para continuar con el proceso.</label>
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
                        <label class="tipoPropiedad">Tipo de propiedad*</label>
                        <select class="form-control" id="exampleFormControlSelect1">
                            <option>DEPARTAMENTO</option>
                            <option>CASA</option>
                            <option>PH</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" placeholder="Comentarios"></textarea>
                    </div>
                    <button type="button" class="btn btn-outline-success">Enviar</button>
                </div>
            </div>

            <!-- Columna de la imagen -->
            <div class="col-md-6 img-container">
                <img src="img/invertir-en-departamentos.png" />
            </div>
        </div>
    </div>
</asp:Content>
