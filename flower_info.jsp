<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="com.Connection.jdbc_conn"%>
<%@page import="com.model.Promodel"%>
<%@page import="com.Entity.addFlower"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flower Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
 
    .container {
        max-width: 600px;
        margin: auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        
    }
    .form-group {
        margin-bottom: 20px;
    }
    label {
        display: block;
        margin-bottom: 5px;
    }
    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="submit"] {
        background-color: #4caf50;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<%
try {
	
    int id = Integer.parseInt(request.getParameter("id"));
    Promodel pm = new Promodel(jdbc_conn.getConnection());
    List<addFlower> li = pm.showflower(id);
    for (addFlower af : li) {
        byte[] img = af.getImage();
        String base64Image = img != null ? Base64.getEncoder().encodeToString(img) : "";
%>
<section class="text-gray-600 body-font overflow-hidden" style="align-content: center">
    <div class="container px-5 py-24 mx-auto">
        <div class="lg:w-4/5 mx-auto flex flex-wrap">
            <img alt="flower" class="lg:w-1/2 w-full lg:h-auto h-64 object-cover object-center rounded"
                 src="data:image/jpeg;base64 ,<%= base64Image %>" alt="<%= af.getName() %>" style="width: 450px; height: 450px;margin-top: 60px">
            <div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0">
                <h2 class="text-sm title-font text-gray-500 tracking-widest"><%= af.getName() %></h2>
                <h1 class="text-gray-900 text-3xl title-font font-medium mb-1"><%= af.getType() %></h1>
                <div class="flex mb-4">
                    <span class="flex items-center">
                        <!-- Rating stars -->
                        <%-- Your rating stars SVG code here --%>
                    </span>
                    <!-- Reviews -->
                    
             
                
       <div class="container">
        <form id="paymentForm" action="adduser" method="post" >
         <input type="hidden" id="fullName" name="name" value="<%=af.getName()%>">
          <input type="hidden" id="fullName" name="type" value="<%=af.getType() %>" >
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" xrequired>
            </div>
            <div class="form-group">
                <label for="contact">Contact Number:</label>
                <input type="text" id="contact" name="contact" required>
            </div>
            <div class="form-group">
                <label for="contact">Total Payment:</label>
                <input type="text" id="total" name="total" value="<%=af.getTotalprice() %>" required>
            </div>
            <div class="form-group">
                <label for="advance">Advance Payment:</label>
                <input type="number" id="advance" name="advance" value="<%=af.getPaid() %>" readonly="readonly" required>
            </div>
            <div class="form-group">
                <label for="remaining">Remaining Payment:</label>
                <input type="number" id="remaining" name="remaining" value="<%=af.getRemaining() %>" readonly="readonly" required>
            </div>
            <div class="form-group">
                <label for="remaining">Date :</label>
                <input type="date" id="date" name="date" required>
            </div>
            <input type="submit" value="Place Order">
           <a href="User_Dashboard.jsp"> <input type="button" value="Cancel Order"></a> 
        </form>
    </div>
            </div>
        </div>
    </div>
</section>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
</body>
</html>
