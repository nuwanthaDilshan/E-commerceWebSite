<%-- 
    Document   : cart
    Created on : Mar 16, 2022, 5:45:54 PM
    Author     : nuwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart-Cart</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/narbar.jsp" %>
        <div class="container mt-3">
            
            <h1 class="text-center">My Cart.</h1>
            
            <hr>

            <div class="container-fluid">

                <div class="cart-body">


                </div>
                
                 <div class="modal-footer">
                     <a href="index.jsp" class="btn btn-secondary">Close</a>
        <button type="button" class="btn btn-primary checkout-btn" onclick="goToCheckout()">Checkout</button>
      </div>

            </div>

        </div>

        <%@include file="components/footer.jsp" %>
    </body>
</html>
