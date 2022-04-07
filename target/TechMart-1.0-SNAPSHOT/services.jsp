<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart-Services</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/narbar.jsp" %>
        <div class="container-fluid">
           
        <div class="services">
             <h1 class="text-center">Our Services.</h1>
            <hr>
            <!--first row-->
            <div class="row mt-5 ml-3 mr-3">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img style="max-width: 125px" class="card-img-top" src="images/delivery-truck.png" alt="Card image cap">
                            <div class="container">
                                <h5 class="card-title">Delivery</h5>
                                <p class="card-text">Island wide Delivery is available for all orders</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img style="max-width: 125px" class="card-img-top" src="images/tracking.png" alt="Card image cap">
                            <div class="container">
                                <h5 class="card-title">Tracking</h5>
                                <p class="card-text">Customers can track their orders</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img style="max-width: 125px" class="card-img-top" src="images/debit-card.png" alt="Card image cap">
                            <div class="container">
                                <h5 class="card-title">Card Payment</h5>
                                <p class="card-text">Shop for anything and pay with ease with your Visa card.. it's good to know that this option is available and Visa requires your bank to assess the claim</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--second row-->
            <div class="row mt-5 ml-3 mr-3">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img style="max-width: 125px" class="card-img-top" src="images/help.png" alt="Card image cap">
                            <div class="container">
                                <h5 class="card-title">Need help?</h5>
                                <p class="card-text">Customer can get help from sales agent if she/he has trouble.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img style="max-width: 125px" class="card-img-top" src="images/available.png" alt="Card image cap">
                            <div class="container">
                                <h5 class="card-title">Cod Available </h5>
                                <p class="card-text">COD payment option is available for all products and for delivery</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img style="max-width: 125px" class="card-img-top" src="images/product-return.png" alt="Card image cap">
                            <div class="container">
                                <h5 class="card-title">Return the products</h5>
                                <p class="card-text">Customer can return the products with fair recent within 7 days.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
                <%@include file="components/footer.jsp" %>

    </body>
</html>
