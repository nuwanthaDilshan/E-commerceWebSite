<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.mycompany.TechMart.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.TechMart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.TechMart.helper.FactoryProvider"%>
<%@page import="com.mycompany.TechMart.dao.CategoryDao"%>
<%@page import="com.mycompany.TechMart.entities.User"%>
<%@page import="com.mycompany.TechMart.entities.*"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in || Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not admin | Do not access this page");
            response.sendRedirect("login.jsp");

            return;
        }
    }


%>

<%  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategorys();

//getting count
    Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());

%>







<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart-Admin</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/narbar.jsp" %>

        <div class="container admin">

            <div class="container-fluid">

                <div class="container-fluid mt-3">

                    <%@include file="components/message.jsp" %>
                </div>


            </div>


            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/users icon.png" alt="alt"/>
                            </div>
                            <h1><%= m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <!--second col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/Category Icon.png" alt="alt"/>
                            </div>
                            <h1><%= list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <!--third col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/Product Icon.png" alt="alt"/>
                            </div>
                            <h1><%= m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!--second row-->
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <a style="text-decoration:none; color: black;" href="manageCategory.jsp"><div class="container">
                                    <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/Add Category Icon.png" alt="alt"/>
                                </div>
                                <p class="mt-2">Click here to add new category</p>
                                <h1 class="text-uppercase text-muted">Manage Category</h1>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">

                            <a style="text-decoration:none; color: black;" href="addProduct.jsp"><div class="container">
                                    <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/Add Product Icon.png" alt="alt"/>
                                </div>
                                <p class="mt-2">Click here to add new Product</p>
                                <h1 class="text-uppercase text-muted">Add Product</h1>
                            </a>
                        </div>
                    </div>

                </div>
            </div>





            <!--Third row-->
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body text-center">
                            <a style="text-decoration:none; color: black;" href="crudUser.jsp"><div class="container">
                                    <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/sales agent icon.png" alt="alt"/>
                                </div>
                                <p class="mt-2">Click here to Add Users</p>
                                <h1 class="text-uppercase text-muted">Manage Users</h1>
                            </a>
                        </div>
                    </div>
                </div>


                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#viewCustomerOrder-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/customer icon.png" alt="alt"/>
                            </div>
                            <p class="mt-2">Click here to view customer order</p>
                            <h1 class="text-uppercase text-muted">view customer order</h1>
                        </div>
                    </div>
                </div>

            </div>


            <!--Fourth row-->
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#viewInventoryDetails-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/inventory icon.png" alt="alt"/>
                            </div>
                            <p class="mt-2">Click here to view inventory details</p>
                            <h1 class="text-uppercase text-muted">view inventory details</h1>
                        </div>
                    </div>
                </div>


                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#viewTotalSales-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/sales icon.png" alt="alt"/>
                            </div>
                            <p class="mt-2">Click here to view total sales</p>
                            <h1 class="text-uppercase text-muted">view total sales</h1>
                        </div>
                    </div>
                </div>

            </div>
        </div>








        <!--End Product modal-->

        <%@include file="components/footer.jsp" %>


    </body>
</html>
