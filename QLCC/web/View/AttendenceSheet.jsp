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
        <table class="table table-bordered table-striped" style="font-size: 12px; text-align:center ">

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
                    &nbsp;
            </select>
            <br />

            Month&nbsp;<select id="ctl00_mainContent_drpSelectWeek" name="ctl00$mainContent$drpSelectWeek" >
                &nbsp;
                <option value="01" 
                        <c:if test="${month eq 1}">
                            selected="selected"
                        </c:if> >01</option>
                &nbsp;
                <option value="02"
                        <c:if test="${month eq 2}">
                            selected="selected"
                        </c:if>>02</option>
                &nbsp;
                <option value="03"
                        <c:if test="${month eq 3}">
                            selected="selected"
                        </c:if>>03</option>
                &nbsp;
                <option value="04"
                        <c:if test="${month eq 4}">
                            selected="selected"
                        </c:if>>04</option>
                &nbsp;
                <option value="05"
                        <c:if test="${month eq 5}">
                            selected="selected"
                        </c:if>>05</option>
                &nbsp;
                <option value="06"
                        <c:if test="${month eq 6}">
                            selected="selected"
                        </c:if>>06</option>
                &nbsp;
                <option value="07" 
                        <c:if test="${month eq 7}">
                            selected="selected"
                        </c:if>>07</option>
                &nbsp;
                <option value="08"
                        <c:if test="${month eq 8}">
                            selected="selected"
                        </c:if>>08</option>
                &nbsp;
                <option value="09"
                        <c:if test="${month eq 9}">
                            selected="selected"
                        </c:if>>09</option>
                &nbsp;
                <option value="10"
                        <c:if test="${month eq 10}">
                            selected="selected"
                        </c:if>>10</option>
                &nbsp;
                <option value="11"
                        <c:if test="${month eq 11}">
                            selected="selected"
                        </c:if>>11</option>
                &nbsp;
                <option value="12"
                        <c:if test="${month eq 12}">
                            selected="selected"
                        </c:if>>12</option>
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

                <c:set var="count" value="0" scope="page" />
                <c:set var="total" value="0" scope="page" />
                <c:forEach items="${requestScope.employees}" var="e">
                    <c:set var="count" value="${count + 1}" scope="page"/>                    
                    <tr>
                        <td>${count}</td>
                        <td>${e.fullname}</td>

                        <c:forEach items="${requestScope.dates}" var="d">
                            <td rowspan="2"
                                <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                    style="background-color: yellow;"
                                </c:if> ><span class="auto-style1"></span>
                                <select id="ctl00_mainContent_drpConvention" name="convention">

                                    <c:forEach items="${requestScope.conventions}" var= "c">
                                        <option 
                                            <c:forEach items="${e.attendences}" var="a">
                                                <c:if test="${d.time == a.day.time}">
                                                    <c:if test="${a.conventionRoll eq c}">
                                                        selected="selected"
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                            value="${c}">${c}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </c:forEach>
                        <c:set var="total" value="${total+e.getWorkTime()}" scope ="page"></c:set>

                            <td>
                            ${e.getWorkTime()}
                        </td>
                        <td>
                            <c:if test="${e.getNoWorkTime() != 0}">
                                ${e.getNoWorkTime()}
                            </c:if> 
                        </td>
                        <td>
                            <c:if test="${e.getWorkBHXH() != 0}">
                                ${e.getWorkBHXH()}
                            </c:if> 
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>Total:</td>
                    <td>${total}</td>
                </tr>
    </table>
</table>
</body>

</html>
