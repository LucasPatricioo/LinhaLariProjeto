<%@ Page Title="" Language="C#" MasterPageFile="~/UsuarioDeslogado.master" AutoEventWireup="true" CodeBehind="PaginaInicial.aspx.cs" Inherits="ProjetoLinhaLari.PaginaInicial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>Página Inicial</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--    <div class="row">
        <div class="col-md-12">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="Assets/img/cardigan.jpg" height="670" alt="Primeiro Slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Assets/img/top.jpg" height="670" alt="Segundo Slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Assets/img/touca.jpg" height="670" alt="Terceiro Slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only"></span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only"></span>
                </a>
            </div>
        </div>

    </div>--%>

    <div class="row" style="padding: 10px 10px;">
        <div class="col-md-12" style="text-align: center;">
            <h2>Favoritos</h2>
        </div>
    </div>

    <div class="row" style="padding: 10px 10px; text-align: center;">
        <div class="card-group">

            <asp:Repeater ID="Repeater" runat="server"
                OnItemCommand="Repeater_ItemCommand"
                OnItemDataBound="Repeater_ItemDataBound" EnableViewState="False" ViewStateMode="Enabled">
                <ItemTemplate>

                    <!-- style="padding: 3px; margin-bottom: 10px" -->

                    <div class="card" style="width: 150px; float: left;">
                        <asp:Image runat="server" ID="imgApresentadoCard" ImageUrl='<%#Eval("UrlAnexo") %>' Width="150" />
                        <div class="card-body" style="background-color: rgba(103,79,35,0.7);">
                            <h5 class="card-title">
                                <asp:Label runat="server" ID="lblNomeProduto" Text='<%#Eval("NomeProduto") %>'></asp:Label>
                            </h5>
                            <p class="card-text">
                                <asp:Label ID="lblDescProduto" runat="server" Text='<%#Eval("Descricao") %>'></asp:Label>
                            </p>

                        </div>
                        <div class="card-footer">
                            <small class="text-muted">
                                <asp:Label ID="lblDataAnexado" runat="server" Text='<%#Eval("DataAnexado") %>'></asp:Label></small>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>


    <%--      <div class="col-md-4">
            <a href="PaginaInicial.aspx">
        </div>
        <div class="col-md-4">
            <a href="PaginaInicial.aspx">
                <img src="Assets/img/touca.jpg" class="img-fluid rounded" height="200" width="200" alt="..."></a>
        </div>
        <div class="col-md-4">
            <a href="PaginaInicial.aspx">
                <img src="Assets/img/cardigan.jpg" class="img-fluid rounded" height="200" width="200" alt="..."></a>
        </div>--%>

    <%--    <div class="row" style="padding: 10px 10px;">
        <div class="col-md-12" style="text-align: center;">
            <h2>Mais Vistos</h2>
        </div>
    </div>

    <div class="row" style="padding: 10px 10px; text-align: center;">
        <div class="col-md-4">
            <a href="PaginaInicial.aspx">
                <img src="Assets/img/top.jpg" class="img-fluid rounded" height="200" width="200" alt="..."></a>
        </div>
        <div class="col-md-4">
            <a href="PaginaInicial.aspx">
                <img src="Assets/img/touca.jpg" class="img-fluid rounded" height="200" width="200" alt="..."></a>
        </div>
        <div class="col-md-4">
            <a href="PaginaInicial.aspx">
                <img src="Assets/img/cardigan.jpg" class="img-fluid rounded" height="200" width="200" alt="..."></a>
        </div>
    </div>

    --%>
</asp:Content>
