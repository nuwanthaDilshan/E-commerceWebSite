

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart-Sales Agent</title>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/narbar.jsp" %>

        <div class="container mt-2 mb-4 agent">
            <div class="container-fluid">

                <div class="container-fluid mt-3">

                    <%@include file="components/message.jsp" %>
                </div>


            </div>
<!--First row-->
            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/users icon.png" alt="alt"/>
                            </div>
                            <h1></h1>
                            <h1 class="text-uppercase text-muted">View process Orders</h1>
                        </div>
                    </div>
                </div>
                
                <!--second col-->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/Category Icon.png" alt="alt"/>
                            </div>
                            <h1></h1>
                            <h1 class="text-uppercase text-muted">Inventory Status</h1>
                        </div>
                    </div>
                </div>
            </div>

<!--seond row-->
            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/users icon.png" alt="alt"/>
                            </div>
                            <h1></h1>
                            <h1 class="text-uppercase text-muted">view TOtal sales</h1>
                        </div>
                    </div>
                </div>
                <!--second col-->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="images/Category Icon.png" alt="alt"/>
                            </div>
                            <h1></h1>
                            <h1 class="text-uppercase text-muted">vehicle and driver</h1>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <%@include file="components/footer.jsp" %>

    </body>
</html>
