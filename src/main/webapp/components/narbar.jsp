<%@page import="com.mycompany.TechMart.entities.User"%>
<%

    User user1 = (User) session.getAttribute("current-user");


%>





<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Tech Mart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="services.jsp">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contactUs.jsp">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About Us</a>
                </li>

            </ul>

            <ul class="navbar-nav ml-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="cart.jsp"><i class="fa fa-cart-plus" style="font-size: 20px;"></i><span class="ml-0 cart-items">( 0 )</span></a>
                </li>



                <%                    if (user1 == null) {

                %>
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>


                <%                } else if (user1.getUserType().equals("admin")) {

                %>

                <li class="nav-item active">
                    <a class="nav-link" href="admin.jsp"><%= user1.getUserName()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#!">Orders</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>

                <%                    } else if (user1.getUserType().equals("agent")) {
                %>

                <li class="nav-item active">
                    <a class="nav-link" href="salesAgent.jsp"><%= user1.getUserName()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#!">Orders</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>

                    <%
                    } else if (user1.getUserType().equals("supplier")) {
                    %>

                <li class="nav-item active">
                    <a class="nav-link" href="supplier.jsp"><%= user1.getUserName()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#!">Orders</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>


                    <%
                    } else {
                    %>

                <li class="nav-item active">
                    <a class="nav-link" href="normal.jsp"><%= user1.getUserName()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#!">Orders</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>


                    <%
                        }
                    %>


            </ul>

        </div>
    </div>
</nav>