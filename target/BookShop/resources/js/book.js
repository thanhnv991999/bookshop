$(document).ready(function () {

    $(".btn-open-dialog").click(function () {
        var id= $(this).closest("div").attr("data-id");
        $("#myModal #id").val(id)
    });
    $(".btn-send").click(function () {
        var form={
            id: $("#myModal #id").val(),
            to: $("#myModal #email").val(),
            body: $("#myModal #content").val(),
            from: $("#myModal #sender").val()
        }
        $.ajax({
            url:"/product/send-to-email",
            data:form,
            success:function(response) {
                if(response){
                    alert("Gửi Thành Công")
                }
                else{
                    alert("Gửi thất bại")
                }
            }
        });

    });

    $("input[type=number]").on(" input",function () {
        var id= $(this).closest("tr").attr("data-id");
        var price= $(this).closest("tr").attr("data-price");
        var discount= $(this).closest("tr").attr("data-discount");
        var qty = $(this).val();
        $.ajax({
           url:`/cart/update/${id}/${qty}`,
            success:function(response) {
                $(".cart-cnt").html(response[0])
                $(".cart-amt").html(response[1])
            }
        });
        var amt = (qty * price) - (qty*price/100*discount);
        $(this).closest("tr").find("td.amt").html(amt);

    })

    $(".btn-add-to-cart").click(function () {
        var id= $(this).closest("div").attr("data-id");
        $.ajax({
            url:"/cart/add/"+id,
            success:function(response) {
                 $(".cart-cnt").html(response[0])
                 $(".cart-amt").html(response[1])
            }
        });
    });

    $(".btn-cart-clear").click(function () {
        $.ajax({
            url:"/cart/clear",
            success:function(response) {
                $(".cart-cnt").html(0)
                $(".cart-amt").html(0)
                $("table>tbody").html("");
            }
        });
    });

    $(".btn-cart-remove").click(function () {
        var id= $(this).closest("tr").attr("data-id");
        $.ajax({
            url:"/cart/remove/"+id,
            success:function(response) {
                $(".cart-cnt").html(response[0])
                $(".cart-amt").html(response[1])
            }
        });
        $(this).closest("tr").remove();
    });

    $(".btn-star").click(function () {
       var id= $(this).closest("div").attr("data-id");
        $.ajax({
            url:"/product/add-to-favo/"+id,
            success:function(response){
                if(response=="t"){
                    alert("Đã thích ")
                }
                else {
                    alert("Đã tồn tại")
                }
            }
        });
    });


});