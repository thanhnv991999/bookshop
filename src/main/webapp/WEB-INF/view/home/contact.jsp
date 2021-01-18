
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Shop Book</title>
    <link href="/resources/css/main.css" rel="stylesheet">
    <jsp:include page="../layout/head.jsp"/>
</head>
<body>

<div class="container">
    <header class="row">
        <div class="head-h1">
            <h1>BOOK SHOP</h1>
        </div>
    </header>
    <nav class="row">
        <jsp:include page="../layout/menu.jsp"/>
    </nav>
    <div class="row">

        <div id="contact-page" class="container">
            <div class="bg">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="gmap" class="contact-map">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8">
                        <div class="contact-form">
                            <div class="status alert alert-success" style="display: none"></div>
                            <form id="main-contact-form" class="contact-form row" name="contact-form" method="post">
                                <div class="form-group col-md-6">
                                    <input type="text" name="name" class="form-control" required="required" placeholder="Name">
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="email" name="email" class="form-control" required="required" placeholder="Email">
                                </div>
                                <div class="form-group col-md-12">
                                    <input type="text" name="subject" class="form-control" required="required" placeholder="Subject">
                                </div>
                                <div class="form-group col-md-12">
                                    <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your Message Here"></textarea>
                                </div>
                                <div class="form-group col-md-12">
                                    <input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="contact-info">
                            <h2 class="title text-center">Thông tin liên hệ</h2>
                            <address>
                                <p>Book Shop.</p>
                                <p>Điện bàn - Quảng Nam</p>
                                <p>VN</p>
                                <p>SDT : 0774562885</p>
                                <p>Email: vanthanh991999@gmail.com</p>
                            </address>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/#contact-page-->




        <script src="/resources/js/jquery.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="/resources/js/gmaps.js"></script>
        <script src="/resources/js/contact.js"></script>
    </div>
    <footer class="row">
        <p class="text-center">&copy; Shop Book 2021</p>
    </footer>
</div>

</body>
</html>
