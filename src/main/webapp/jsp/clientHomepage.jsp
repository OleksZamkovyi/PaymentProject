<%@ page import="ozamkovyi.db.entity.Client" %>
<%@ page import="java.util.ResourceBundle" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 07.10.2020
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <link rel="stylesheet" href="./../style/styleForClientHomepage6.css">
</head>
<body>
<%
    String locale = (String) session.getAttribute("locale");
    ResourceBundle bundle = (ResourceBundle) session.getAttribute("resourceBundle");
    session.setAttribute("currentURL", "/clientHomepage");
    Client client = (Client) session.getAttribute("currentUser");
    String engDisable = "disabled";
    String uaDisable = "";
    if (locale.equals("ua")) {
        uaDisable = "disabled";
        engDisable = "";
    }
    pageContext.setAttribute("uaDisable", uaDisable);
    pageContext.setAttribute("engDisable", engDisable);
%>
<form method="get" action="/userLocalization">
    <div class="standart_buttons">
        <div class="leng_buttons">
            <div class="button_eng">
                <button class="button_l" name="engButton" ${engDisable}>Eng</button>
            </div>
            <div class="button_ukr">
                <button class="button_l" name="uaButton" ${uaDisable}>Ua</
                >
            </div>
        </div>
        <div class="exit">
            <button class="exit_button" name="logOut"><%=bundle.getString("clientHomepage_jsp.button.logOut")%>
            </button>
        </div>
    </div>
</form>

<form action="/clientHomepage" method="post">

    <div class="content">
        <div class="name"><%=client.getName()%>
        </div>
        <div class="buttons">
            <button class="button" name="buttonMyCard"><%=bundle.getString("clientHomepage_jsp.button.myCards")%>
            </button>
            <button class="button" name="buttonMyAccount"><%=bundle.getString("clientHomepage_jsp.button.myAccount")%>
            </button>
            <button class="button" name="buttonMyPayment"><%=bundle.getString("clientHomepage_jsp.button.myPayment")%>
            </button>
        </div>
    </div>
</form>

</body>
</html>
