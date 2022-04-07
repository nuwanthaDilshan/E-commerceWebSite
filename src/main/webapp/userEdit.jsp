

<%@page import="com.mycompany.TechMart.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart-Update User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/narbar.jsp" %>



        <div class="userEdit-inner ">
            <div class="container">

                <%                    int userId = Integer.parseInt(request.getParameter("user_id").trim());

                    Session s = FactoryProvider.getFactory().openSession();

                    User user2 = (User) s.get(User.class, userId);
                %>
                <div class="row">
                    <div class="col-12">
                        <h3 class="userEdit-h3">
                            Update User Details</h3>
                        <form action="UpdateServlet" method="post">

                            <input value="<%= user2.getUserId()%>" name="userId" type="hidden"/>

                            <div class="form-group">
                                <input name="userName" type="text" class="form-control" id="name" placeholder="Enter Name" aria-describedby="emailHelp" value="<%= user2.getUserName()%>"  required="">
                            </div>
                            <div class="form-group">
                                <input name="userEmail" type="email" class="form-control" id="email" placeholder="Enter Email" aria-describedby="emailHelp" value="<%= user2.getUserEmail()%>" required="">
                            </div>
                            <div class="form-group">
                                <input name="userPassword" type="password" class="form-control" id="password" placeholder="Enter Password" aria-describedby="emailHelp" value="<%= user2.getUserPassword()%>" >
                            </div>
                            <div class="form-group">
                                <input name="userPhone" type="number" class="form-control" id="phone" placeholder="Enter Phone" aria-describedby="emailHelp" value="<%= user2.getUserPhone()%>">
                            </div>
                            <div class="form-group">
                                <textarea name="userAddress" style="height:100px;" class="form-control" placeholder="Enter Address"><%= user2.getUserAddress()%></textarea>
                            </div>

                            <div class="form-group">
                                <select name="agentBranch" class="form-control"> 
                                    <option><%= user2.getUserBranch()%></option>
                                    <option>null</option>
                                    <option>Colombo</option>
                                    <option>Galle</option>
                                    <option>Kandy</option>
                                    <option>Nugegoda</option>
                                    <option>Gampaha</option>
                                    <option>Kurunagala</option>
                                    <option>Jaffna</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <select name="userType" class="form-control">
                                    <option>                                    <%= user2.getUserType()%>
                                    </option>
                                    <option>agent</option>
                                    <option>admin</option>
                                    <option>supplier</option>
                                    <option>normal</option>
                                </select>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-success">Update</button>
                                <button type="reset"  class="btn btn-secondary"><a class="userEdit-a" href="crudUser.jsp">Cancel</a></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                                    
                                            <%@include file="components/footer.jsp" %>

    </body>
</html>
