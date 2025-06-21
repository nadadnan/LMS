<%@ page import="java.sql.*" %>
<%@ page import="com.DAO.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Confirmation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 80px auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #2e7d32;
        }

        p {
            font-size: 16px;
            color: #555;
            margin: 10px 0;
        }

        .details {
            text-align: left;
            margin-top: 30px;
        }

        .details p {
            margin: 6px 0;
        }

        .btn {
            margin-top: 30px;
            padding: 10px 25px;
            font-size: 16px;
            background-color: #2e7d32;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .btn:hover {
            background-color: #1b5e20;
        }
    </style>
</head>
<body>

<%
    String orderID = request.getParameter("order_id");
    String transactionID = request.getParameter("transaction_id");
    String billcode = request.getParameter("billcode");
    String status = request.getParameter("status_id");

    double amountPaid = 0.0;

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = DBUtil.getConnection(); 
        int numericOrderID = Integer.parseInt(orderID.replaceAll("[^0-9]", ""));

        String query = "SELECT totalPrice FROM orders WHERE orderID = ?";
        ps = con.prepareStatement(query);
        ps.setInt(1, numericOrderID);
        rs = ps.executeQuery();

        if (rs.next()) {
            amountPaid = rs.getDouble("totalPrice");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ex) {}
        try { if (ps != null) ps.close(); } catch (Exception ex) {}
        try { if (con != null) con.close(); } catch (Exception ex) {}
    }
%>

<div class="container">
    <h2>Payment Successful!</h2>
    <p>Thank you for your payment. Your transaction has been processed successfully.</p>

    <div class="details">
        <p><strong>Order ID:</strong> <%= orderID %></p>
        <p><strong>Transaction ID:</strong> <%= transactionID %></p>
        <p><strong>Amount Paid:</strong> RM <%= String.format("%.2f", amountPaid) %></p>
    </div>

    <a href="cust_dashboard1.jsp" class="btn">Go to Dashboard</a>
</div>

<!-- ✅ Temporary workaround to trigger the callback manually -->
<% if (status != null && billcode != null && orderID != null && transactionID != null) { %>
<script>
    fetch("https://laundry.up.railway.app/PaymentCallbackServlet?status=<%= status %>&billcode=<%= billcode %>&order_id=<%= orderID %>&transaction_id=<%= transactionID %>")
        .then(res => console.log("Callback manually triggered"))
        .catch(err => console.error("Callback failed", err));
</script>
<% } %>

</body>
</html>
