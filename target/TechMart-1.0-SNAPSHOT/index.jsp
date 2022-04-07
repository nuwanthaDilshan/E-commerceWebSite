

<%@page import="com.mycompany.TechMart.helper.Helper"%>
<%@page import="com.mycompany.TechMart.entities.Category"%>
<%@page import="com.mycompany.TechMart.dao.CategoryDao"%>
<%@page import="com.mycompany.TechMart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.TechMart.dao.ProductDao"%>
<%@page import="com.mycompany.TechMart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart-Home </title>

        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/narbar.jsp" %>

        <div class="container-fluid ">

            <div class="row mt-3 mx-2">

                <%                    String cat = request.getParameter("category");
//                    out.println(cat);

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if (cat == null || cat.trim().equals("All")) {
                        list = dao.getAllProduct();

                    } else if (cat.trim().equals("All")) {
                        list = dao.getAllProduct();

                    } else {

                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductById(cid);

                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategorys();

                %>

                <%                    User auth = (User) request.getSession().getAttribute("auth");
                    if (auth != null) {
                        request.setAttribute("auth", auth);
                    }

                %>

                <!--show category-->
                <div class="col-md-2">



                    <div class="list-group mt-4">

                        <a href="index.jsp?category=All" class="list-group-item list-group-item-action active">
                            All Products
                        </a>




                        <%                    for (Category c : clist) {


                        %>

                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>

                        <%                                }

                        %>

                    </div>

                </div>



                <!--show product-->
                <div class="col-md-10">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" style="height: 500px" src="images/slider image2.jpg" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" style="height: 500px" src="images/slider image1.png" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" style="height: 500px" src="images/slider image3.jpg" alt="Third slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>


                    <!--row-->
                    <div class="row mt-4">

                        <div class="col-md-12">

                            <div class="card-columns">

                                <!--traversing product-->
                                <%                                for (Product p : list) {

                                %>


                                <!--product cart-->
                                <div class="card  product-cart">


                                    <div class="container text-center">
                                        <img src="images/product/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt="...">

                                    </div>

                                    <div class="card-body">

                                        <h5 class="card-title text-primary"><%= p.getpName()%></h5>

                                        <p class="card-text text-dark">

                                            <%= Helper.get20Words(p.getpDesc())%>
                                        </p>


                                    </div>

                                    <div class="card-footer text-center">

                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getPriceAfterApplyingDiscount()%>)">Add to cart</button>
                                        <button class="btn-floating"> &#8360;<%= p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label strike"> &#8360; <%= p.getpPrice()%> </span></button>

                                    </div>


                                </div>


                                <%                                }
                                    if (list.size() == 0) {
                                        out.println("<h3>No item in this category</h3>");

                                    }

                                %>


                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
        <%@include file="components/footer.jsp" %>

    </body>
</html>
