

<%@page import="com.mycompany.TechMart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.mycompany.TechMart.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
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


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart-Manage Category</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/narbar.jsp" %>
        <div class="container mt-3">
            <%@include file="components/message.jsp" %>
            <div class="crud-inner">
                <div class="row">
                    <div class="col-md-3">
                        <h3 id="crudUser">Category Details</h3>
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required=""/>
                            </div>

                            <div class="form-group">
                                <textarea style="height: 250px;" class="form-control" placeholder="Enter category description" name="catDescription" required=""></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-success">Add</button>
                                <button type="reset" class="btn btn-secondary">Reset</button>
                                <a class="btn btn-secondary" href="admin.jsp">Back</a>

                            </div>

                        </form>
                    </div>
                    <div class="col-md-9">
                        <h3>View and Manage Category Details</h3>



                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">Title</th>
                                    <th scope="col">Category Description</th>
                                    

                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <%                                        Session s = FactoryProvider.getFactory().openSession();

                                Query q = s.createQuery("from Category");
                                List<Category> list1 = q.list();
                                for (Category category : list1) {

                            %>
                            <tbody>

                                <tr>

                                    <td><%= category.getCategoryTitle()%></td>
                                    <td><%= category.getCategoryDescription()%></td>
                                    

                                    <td><a href="categoryEdit.jsp?category_id=<%=category.getCategoryId()%>">Update</a> 
                                        <a href="DeleteCategoryServlet?category_id=<%=category.getCategoryId()%>">Delete</a></td>
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
