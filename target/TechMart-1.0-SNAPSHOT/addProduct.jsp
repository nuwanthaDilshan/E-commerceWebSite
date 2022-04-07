<%@page import="com.mycompany.TechMart.entities.Product"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.mycompany.TechMart.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.TechMart.helper.FactoryProvider"%>
<%@page import="com.mycompany.TechMart.dao.CategoryDao"%>
<%@page import="com.mycompany.TechMart.entities.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart-Add Product</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/narbar.jsp" %>
        <div class="container mt-3">
            <%@include file="components/message.jsp" %>
            <div class="crud-inner">
                <div class="row">
                    <div class="col-md-3">
                        <h3 id="crudUser">Product Details</h3>
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct" />

                            <div class="form-group">

                                <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required=""/>

                            </div>

                            <div class="form-group">

                                <textarea style="height: 100px" class="form-control" placeholder="Enter description of product" name="pDesc" required=""></textarea>

                            </div>

                            <div class="form-group">

                                <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required=""/>

                            </div>

                            <div class="form-group">

                                <input type="number" class="form-control" placeholder="Enter discount of product" name="pDiscount" required=""/>

                            </div>

                            <div class="form-group">

                                <input type="number" class="form-control" placeholder="Enter Quantity of product" name="pQuantity" required=""/>

                            </div>





                            <div class="form-group">

                                <select name="catId" id="" class="form-control">

                                    <%                                            for (Category c : list) {

                                    %>

                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>


                                    <%

                                        }

                                    %>

                                </select>


                            </div>

                            <div class="form-group">
                                <label for="pPic">Select picture of product</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" required=""/>

                            </div>

                            <div class="container text-center">

                                <button type="submit" class="btn btn-success">Add</button>
                                <button type="reset" class="btn btn-secondary">Reset</button>
                                <a class="btn btn-secondary" href="admin.jsp">Back</a>

                            </div>
                        </form>
                    </div>
                                    
                                    
                                    
                    <div class="col-md-9">
                        <h3>View Product Details</h3>



                        <table class="table table-bordered container-fluid">
                            <thead>
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Photo</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Discount</th>
                                    <th scope="col">Quantity</th>
                                </tr>
                            </thead>
                            <%                                        Session s = FactoryProvider.getFactory().openSession();

                                Query q = s.createQuery("from Product");
                                List<Product> list1 = q.list();
                                for (Product product : list1) {

                            %>
                            <tbody>

                                <tr>

                                    <td><%= product.getpName() %></td>
                                    <td><%= product.getpDesc() %></td>
                                    <td><%= product.getpPhoto() %></td>
                                    <td><%= product.getpPrice() %></td>
                                    <td><%= product.getpDiscount() %></td>
                                    <td><%= product.getpQuantity() %></td>


                                </tr>

                            </tbody>
                            <%    }
                                s.close();
                            %>
                        </table>


                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/footer.jsp" %>
    </body>
</html>
