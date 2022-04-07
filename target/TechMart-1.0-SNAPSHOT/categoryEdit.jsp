<%@page import="com.mycompany.TechMart.entities.Category"%>
<%@page import="com.mycompany.TechMart.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart-Update Category</title>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/narbar.jsp" %>



        <div class="userEdit-inner">
            <div class="container">

                <%                    int CategoryId = Integer.parseInt(request.getParameter("category_id").trim());

                    Session s = FactoryProvider.getFactory().openSession();

                    Category category = (Category) s.get(Category.class, CategoryId);
                %>
                <div class="row">
                    <div class="col-12">
                        <h3 class="userEdit-h3">
                            Update Category Details</h3>
                        <form action="UpdateCategoryServlet" method="post">

                            <input value="<%= category.getCategoryId()%>" name="categoryId" type="hidden">

                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required="" value="<%= category.getCategoryTitle()%>"/>
                            </div>

                            <div class="form-group">
                                <textarea style="height: 250px;" class="form-control" placeholder="Enter category description" name="catDescription" required=""><%= category.getCategoryDescription()%></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Update</button>
                                <button type="reset"  class="btn btn-secondary"><a class="userEdit-a" href="manageCategory.jsp">Cancel</a></button>


                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/footer.jsp" %>

    </body>
</html>
