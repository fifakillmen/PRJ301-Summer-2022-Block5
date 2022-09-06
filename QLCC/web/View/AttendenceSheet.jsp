<%-- 
    Document   : TimeSheet
    Created on : Aug 19, 2022, 9:36:45 AM
    Author     : fifak
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"
              integrity="sha512-XWTTruHZEYJsxV3W/lSXG1n3Q39YIWOstqvmFsdNEEQfHoZ6vm6E9GK2OrF6DSJSpIbRbi+Nn0WDPID9O7xB2Q=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <jsp:useBean id="dt" class="TimeHelper.HelpTime" scope="request"></jsp:useBean>
        </head>


        <body>
        <tr align="center">

        <table class="table table-bordered table-striped" style="font-size: 12px; text-align:center">

            <td rowspan="2"><span class="auto-style1"><strong>YEAR</strong></span>&nbsp;<select id="ctl00_mainContent_drpYear" name="year" >



                    <option value="${requestScope.year-3}">${requestScope.year-3}</option>
                &nbsp;
                <opftion value="${requestScope.year-2}">${requestScope.year-2}</option>
                    &nbsp;
                    <option value="${requestScope.year-1}">${requestScope.year-1}</option>
                    &nbsp;
                    <option selected="selected" value="${requestScope.year}">${requestScope.year}</option>
                    &nbsp;
                    <option value="${requestScope.year+1}">${requestScope.year+1}</option>
                    <option value="${requestScope.year+2}">${requestScope.year+2}</option>
                    &nbsp;</select><br />Month&nbsp;<select id="ctl00_mainContent_drpSelectWeek" name="ctl00$mainContent$drpSelectWeek" >&nbsp;
                <option value="1">01</option>
                &nbsp;
                <option value="2">02</option>
                &nbsp;
                <option value="3">03</option>
                &nbsp;
                <option value="4">04</option>
                &nbsp;
                <option value="5">05</option>
                &nbsp;
                <option value="6">06</option>
                &nbsp;
                <option value="7" selected="selected">07</option>
                &nbsp;
                <option value="8">08</option>
                &nbsp;
                <option value="9">09</option>
                &nbsp;
                <option value="10">10</option>
                &nbsp;
                <option value="11">11</option>
                &nbsp;
                <option value="12">12</option>
                <td colspan="36" width="1020"  >BẢNG CHẤM CÔNG</td>
                <tr/>

                <tr>
                    <td rowspan="1">TT</td>
                    <td rowspan="1">Họ và tên</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td><fmt:formatDate pattern = "EEE" 
                                        value = "${d}" />
                            <br/>
                            <fmt:formatDate pattern = "dd" 
                                            value = "${d}" /> </td>

                    </c:forEach>
                    <td width="40">SC hưởng lương<br />&nbsp;thời <br />gian</td>
                    <td width="40">SC<br />&nbsp;nghỉ<br />kh&ocirc;ng<br />lương</td>
                    <td width="40">SC<br />hưởng <br />BHXH</td>
                </tr>


                <c:forEach items="${requestScope.employees}" var="e">
                    <tr>
                        <td>1</td>
                        <td>${e.fullname}</td>
                        <c:forEach items="${requestScope.dates}" var="d">

                            <td
                                >
                                <c:forEach items="${e.attendences}" var="a">
                                    <c:if test="${d.time == a.day.time}">
                                        ${a.conventionRoll}
                                    </c:if>
                                </c:forEach>
                            </td>

                        </c:forEach>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                </c:forEach>



    </table>


</table>
</body>

</html>
