<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>

<html lang="en">
<head>
    <title>Shop Book</title>
    <jsp:include page="/WEB-INF/view/admin/layout/head.jsp"/>
</head>
<body>

<div class="container">
    <header class="row">
        <div class="head-h1">
            <h1>ADMIN</h1>
        </div>
    </header>
    <nav class="row">
        <jsp:include page="/WEB-INF/view/admin/layout/menu.jsp"/>
    </nav>
    <h3 class="label label-success">${param.mess}</h3>
    <div class="row">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#tab1">Edit</a></li>
            <li><a data-toggle="tab" href="#tab2">List</a></li>
        </ul>

        <div class="tab-content">
            <div id="tab1" class="tab-pane fade in active">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <hr style="border-top: 1px dashed;margin: 35px 0">
                        <h2>FORM</h2>
                        <hr style="border-top: 1px dashed;margin: 35px 0">
                        <form:form action="" method="post" modelAttribute="productDTO">
                            <div class="row">
                                <div class="form-group col-sm-6" >
                                    <label>ID</label>
                                    <form:input path="id" class="form-control" readonly="true"/>
                                </div>
                                <div class="form-group form-group col-sm-6">
                                    <label>Tên sách</label>
                                    <form:input path="name" class="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-12" >
                                    <label>Thể Loại</label>
                                    <form:select path="category.id" class="form-control">
                                        <form:options items="${cates}" itemLabel="categoryName" itemValue="id"/>
                                    </form:select>
                                </div>
                            </div>
                             <div class="row">
                                 <div class="form-group col-sm-6" >
                                    <label>Giá</label>
                                    <form:input path="price" class="form-control"/>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Giảm</label>
                                    <form:input path="discount" class="form-control"/>
                                </div>
                             </div>
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label>Số lượng</label>
                                    <form:input path="quantity" class="form-control" />
                                </div>
                                <div class="form-group col-sm-6" >
                                    <label>Lượt xem</label>
                                    <form:input path="viewCount" class="form-control" />
                                </div>
                            </div>
                            <input type="hidden" value="${productDTO.image}" name="img">
                            <div class="row">
                                <div class="form-group col-sm-6" >
                                    <label>Đặc biệt</label>
                                    <div class="form-control">
                                        <form:radiobutton path="special" value="true" label="yes" />
                                        <form:radiobutton path="special" value="false" label="no" />
                                    </div>
                                </div>
                                <div class="form-group form-group col-sm-6">
                                    <label>Sẵn có</label>
                                    <div class="form-control">
                                        <form:radiobutton path="available" value="true" label="yes" />
                                        <form:radiobutton path="available" value="false" label="no" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                    <div class="form-group col-sm-12" >
                                        <label>Hình ảnh</label>
                                        <img src="/resources/images/product/${productDTO.image}" style="width: 125px;height: 110px"/>
                                        <form:input type="file" path="image" class="form-control"/>
                                    </div>
                            </div>
                            <div class="row">
                                <div class="form-group form-group col-sm-12">
                                    <label>description</label>
                                    <form:textarea rows="3" path="description" class="form-control"/>
                                </div>
                                <div class="form-group col-sm-12">
                                    <button class="btn btn-primary" formaction="/admin/product/create">Create</button>
                                    <button class="btn btn-warning" formaction="/admin/product/update">Update</button>
                                    <a class="btn btn-default" href="/admin/product/index">Reset</a>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>

            </div>
            <div id="tab2" class="tab-pane fade">
                <hr style="border-top: 1px dashed;margin: 35px 0">
                <h2>Danh sách sản phẩm</h2>
                <hr style="border-top: 1px dashed;margin: 35px 0">
                <table class="table table-hover">
                    <thead>
                    <th>Id</th>
                    <th>Tên sách</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Sẵn có</th>
                    <th>Lượt xem</th>
                    <th>Thể Loại</th>

                    </thead>
                    <tbody>
                    <c:forEach var="c" items="${listProduct}">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.name}</td>
                            <td>${c.price}</td>
                            <td>${c.quantity}</td>
                            <td>${c.available?'yes':'no'}</td>
                            <td>${c.viewCount}</td>
                            <td>${c.category.categoryName}</td>
                            <td>
                                <a class="btn btn-sm btn-info" href="/admin/product/edit/${c.id}">edit</a>
                                <a class="btn btn-sm btn-info" href="/admin/product/delete/${c.id}">delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script type="text/javascript">
        //<![CDATA[
        bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
        //]]>
    </script>

    </div>
    <footer class="row">
        <p class="text-center">&copy; Shop Book 2021</p>
    </footer>
</div>

</body>
</html>
