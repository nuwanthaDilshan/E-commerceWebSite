<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechMart-About</title>
        
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        
        <%@include file="components/narbar.jsp" %>
        
          <section class="about py-5">
    <div class="container py-5" data-aos="zoom-in" data-aos-duration="2000">
      <div class="row">
        <div class="col-lg-5">
            <img src="images/about.jpg" data-aos="fade-right" data-aos-duration="2000"
            class="img-fluid" alt="" />
        </div>
        <div class="col-lg-7">
          <h1>About Me.</h1>
          <p>WE ARE THE BEST IN THIS FIELD</p>
          <p class="py-3">
            Welcome to
            <span class="font-weight-bold"> Tech mart,</span> your number one source for all things. We're dedicated to giving you the very best of mobile phone accessories. you can get our products to your door step.
            We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don't hesitate to contact us.
          </p>

          <div class="progress">
            <div class="pro-value1">
              <p>
                Services <span class="text-white float-right">95%</span>
              </p>
            </div>
          </div>

          <div class="progress my-3">
            <div class="pro-value2">
              <p>Product Quality<span class="text-white float-right">98%</span></p>
            </div>
          </div>

          <div class="progress my-3">
            <div class="pro-value3">
              <p>
                Delivery<span class="text-white float-right">85%</span>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
        
                <%@include file="components/footer.jsp" %>

        
    </body>
</html>
