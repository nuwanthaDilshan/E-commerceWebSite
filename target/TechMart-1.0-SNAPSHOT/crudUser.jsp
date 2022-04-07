<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.TechMart.helper.FactoryProvider"%>
<%@page import="com.mycompany.TechMart.dao.crudUserDao"%>
<%@page import="com.mycompany.TechMart.entities.User"%>

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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart-Add User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/narbar.jsp" %>
        <div class="container mt-3">
            <%@include file="components/message.jsp" %>
            <div class="crud-inner">
                <div class="row">
                    <div class="col-md-3">
                        <h3 id="crudUser">User Details</h3>
                        <form action="AddUserServlet" method="post">
                            <input type="hidden" name="added" value="adduser">

                            <div class="form-group">
                                <input name="userName" type="text" class="form-control" id="name" placeholder="Enter Name" aria-describedby="emailHelp"  required="">
                            </div>
                            <div class="form-group">
                                <input name="userEmail" type="email" class="form-control" id="email" placeholder="Enter Email" aria-describedby="emailHelp" required="">
                            </div>
                            <div class="form-group">
                                <input name="userPassword" type="password" class="form-control" id="password" placeholder="Enter Password" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <input name="userPhone" type="number" class="form-control" id="phone" placeholder="Enter Phone" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <textarea name="userAddress" style="height:100px;" class="form-control" placeholder="Enter Address"></textarea>
                            </div>

                            <div class="form-group">
                                <select name="agentBranch" class="form-control">
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
                                    <option>agent</option>
                                    <option>admin</option>
                                    <option>supplier</option>
                                    <option>normal</option>
                                </select>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-success">Add</button>
                                <button type="reset" class="btn btn-secondary">Reset</button>
                                <a class="btn btn-secondary" href="admin.jsp">Back</a>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-9">
                        <h3>View and Manage User Details</h3>



                        <table class="table table-bordered container-fluid">
                            <thead>
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Password</th>
                                    <th scope="col">Phone Number</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Branch</th>
                                    <th scope="col">User Type</th>

                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <%                                        Session s = FactoryProvider.getFactory().openSession();

                                Query q = s.createQuery("from User");
                                List<User> list1 = q.list();
                                for (User user2 : list1) {

                            %>
                            <tbody>

                                <tr>

                                    <td><%= user2.getUserName()%></td>
                                    <td><%= user2.getUserEmail()%></td>
                                    <td><%= user2.getUserPassword()%></td>
                                    <td><%= user2.getUserPhone()%></td>
                                    <td><%= user2.getUserAddress()%></td>
                                    <td><%= user2.getUserBranch()%></td>
                                    <td><%= user2.getUserType()%></td>

                                    <td><a href="userEdit.jsp?user_id=<%=user2.getUserId()%>">Update</a> 
                                        <a href="DeleteServlet?user_id=<%=user2.getUserId()%>">Delete</a></td>
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
