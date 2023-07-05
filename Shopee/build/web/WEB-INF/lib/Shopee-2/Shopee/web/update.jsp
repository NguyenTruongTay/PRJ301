<%-- 
    Document   : update
    Created on : Sep 27, 2022, 5:27:45 PM
    Author     : Saka289
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update product</title>
    </head>
    <body>
        <h1>Update a Product</h1>
        <c:set var="c" value="${requestScope.product}"/>
        <form action="update" method="post">
            Enter ID; <input type="number" readonly name="id" value="${c.id}"> <br/>
            Enter Category ID; <select name="category_id" id="category_id">
                <c:forEach var="cate" items="${requestScope.categories}">
                    <option ${(c.category_id == cate.id)? "selected":""} value="${cate.id}">${cate.name}</option>
                </c:forEach>
            </select>
            Enter Title; <input type="text" name="title" value="${c.title}"><br/>
            Enter price; <input type="text" name="price" value="${c.price}"><br/>
            Enter quantity; <input type="text" name="quantity" value="${c.quantity}"><br/>
            Enter discount; <input type="text" name="discount" value="${c.discount}"><br/>
            Enter description; <input type="text" name="description" value="${c.description}"><br/>

            Enter status; <input type="text" name="status" value="${c.status}"><br/>
<!--            Enter brand_id; <input type="text" name="brand_id" value="${c.brand_id}"><br/>-->
            Enter brand_id; 
            <select name="brand_id" id="brand_id">
                <c:forEach var="brand" items="${requestScope.brands}">
                    <option ${(c.brand_id == brand.id)? "selected":""} value="${brand.id}">${brand.name}</option>
                </c:forEach>
            </select>
            <br>Enter image:<input type='file' name="image" value="${c.image}"/>
            <br><img id="myImg" src="#" alt="your image" height=200 width=150>

            <br><input type="submit" value="SAVE">
        </form>

    </body>

    <script type="text/javascript">
        /* The uploader form */
        $(function () {
            $(":file").change(function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();

                    reader.onload = imageIsLoaded;
                    reader.readAsDataURL(this.files[0]);
                }
            });
        });

        function imageIsLoaded(e) {
            $('#myImg').attr('src', e.target.result);
            $('#yourImage').attr('src', e.target.result);
        }
        ;
    </script>
    
</html>
