<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FrontEndLoja.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Fron-End </title>
    <link href="css/index.css" rel="Stylesheet" type="text/css"/>
    <link href="css/normalize.css" rel="Stylesheet" type="text/css"/>
    <link href="css/gallery.theme.css" rel="Stylesheet" type="text/css"/>
    <link href="css/gallery.min.css" rel="Stylesheet" type="text/css"/>
</head>
<body>
    <form class="form-main" runat="server" id="main">
        <div class="frontend">
            <table class="tb-top">
                <tr>
                    <td class="td-top">
                        <asp:Panel CssClass="top" runat="server" ID="top"></asp:Panel>
                    </td>
                </tr>
            </table>
            <table class="tb-search">
                <tr>
                    <td class="td-search">
                        <asp:Panel CssClass="style-search" runat="server" ID="search">
                            <asp:TextBox CssClass="txtsearch" placeholder="Pesquisar" runat="server" ID="txtsearch"></asp:TextBox>
                            <asp:ImageButton CssClass="bt-search" runat="server" ImageUrl="~/image/bt/lupa.png" ID="btsearch" OnClick="btsearch_Click" />
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <table class="tb-banner">
                <tr>
                    <td class="td-banner">
                        <asp:Panel CssClass="style-banner" runat="server" ID="banner">
                            <div class="gallery autoplay items-3">
                                <div id="item-1" class="control-operator"></div>
                                <div id="item-2" class="control-operator"></div>
                                <div id="item-3" class="control-operator"></div>

                                <figure class="item">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/image/banner/1.png" />
                                </figure>
                                <figure class="item">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/image/banner/2.png" />
                                </figure>
                                <figure class="item">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/image/banner/3.png" />
                                </figure>
                                <div class="controls">
                                    <a href="#item-1" class="control-button">•</a>
                                    <a href="#item-2" class="control-button">•</a>
                                    <a href="#item-3" class="control-button">•</a>
                                </div>
                            </div>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <table class="tb-triple">
                <tr>
                    <td class="td-left">&nbsp;</td>
                    <td class="td-center">
                        <asp:Panel ID="erro_products" runat="server" HorizontalAlign="Center">
                            <asp:Label ID="error" runat="server" Text=""></asp:Label>
                        </asp:Panel>                        
                        <asp:DataList CssClass="datalist" runat="server" RepeatColumns="5" ID="DataList1">
                            <ItemTemplate>
                                <table class="products">
                                    <tr>
                                        <td class="itens">
                                            <asp:Image CssClass="itens-imagens" runat="server" ImageUrl='<%# Eval("imagens") %>' ID="image_p"/>
                                            <br />
                                            <asp:Panel ID="products_itens" runat="server" HorizontalAlign="Center">
                                                <asp:Label CssClass="itens-name" ID="nome_p" runat="server" Text='<%# Eval("nome") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label CssClass="itens-real" ID="real_p" runat="server" Text="R$:"></asp:Label>
                                                <asp:Label CssClass="itens-price" ID="price_p" runat="server" Text='<%# Eval("preco") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Button class="itens-button" runat="server" Text="Comprar" ID="bt_p"/>
                                            </asp:Panel>
                                        </td>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                    <td class="td-right">&nbsp;</td>
                </tr>
            </table>
            <table class="footer">
                <tr>
                    <td class="tdfooter"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
