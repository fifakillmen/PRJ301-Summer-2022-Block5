<%-- 
    Document   : TimeSheet
    Created on : Aug 19, 2022, 9:36:45 AM
    Author     : fifak
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
    <title>Table V02</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/styles.css" />
    <link rel="ultil" type="text/css" href="./css/ultil.css" />

    <jsp:useBean id="dt" class="TimeHelper.HelpTime" scope="request"></jsp:useBean>
        <!--===============================================================================================-->
    </head>
    <body>


        <div class="table100 ver2 m-b-110">
            <table data-vertable="ver2">
                <thead>
                    <tr class="row100 head">
                <form action="servlet/Date" method="post">  
                    <th rowspan="2">
                        <span class="auto-style1">
                            <strong>YEAR</strong></span>
                        &nbsp;
                        <select id="ctl00_mainContent_drpYear" name="year" >
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

                    <br />MONTH&nbsp;<select id="ctl00_mainContent_drpSelectWeek" name="ctl00$mainContent$drpSelectWeek" >
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
            </form>
            <th colspan="36" width="1020"  >BẢNG CHẤM CÔNG</th>
            <tr/>
            </tr>
            <tr class="row100 head">
                <th class="column100 column1 " data-column="column1">TT</th>
                <th class="column100 columnName " data-column="columnName">Họ Và Tên</th>
                    <c:set var="countColum" value="2" scope="page" />
                    <c:forEach items="${requestScope.dates}" var="d">
                    <th class="column100 column${countColum+1}" data-column="column${countColum+1}">
                        <c:set var="countColum" value="${countColum + 1}" scope="page"/>           
                        <fmt:formatDate pattern = "EEE" 
                                        value = "${d}" />
                        <br/>
                        <fmt:formatDate pattern = "dd" 
                                        value = "${d}" /> </td>

                    </c:forEach>
                <th class="column100 column90" data-column="column90">SC hưởng lương</th>
                <th class="column100 column91" data-column="column91">Nghỉ không lương</th>
                <th class="column100 column92" data-column="column92">SC hưởng BHXH</th>
            </tr>
            </thead>
            <tbody>

                <c:set var="count" value="0" scope="page" />
                <c:set var="total" value="0" scope="page" />
                <c:forEach items="${requestScope.employees}" var="e">
                    <c:set var="count" value="${count + 1}" scope="page"/>
                    <c:set var="countColum1" value="2" scope="page" />                    
                    <tr class="row100">
                        <td class="column100 column1 " data-column="column1">${count}</td>
                        <td class="column100 columnName " data-column="e.">${e.fullname}</td>
                        <c:forEach items="${requestScope.dates}" var="d">
                            <c:set var="countColum1" value="${countColum1 + 1}" scope="page"/>           

                            <td class="column100 column${countColum1}" data-column="column${countColum1} ">
                                <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                    --
                                </c:if>


                                <c:if test="${dt.getDayOfWeek(d) != 6 and dt.getDayOfWeek(d) != 7}">
                                    <input class="inConvention" type="text"  
                                           <c:forEach items="${e.attendences}" var="a">
                                               <c:choose>
                                                   <c:when test="${d.time == a.day.time}"> 
                                                       value="${a.conventionRoll}"
                                                   </c:when> 
                                               </c:choose>
                                           </c:forEach>
                                           />
                                </c:if>
                            </td>
                        </c:forEach>
                        <c:set var="total" value="${total+e.getWorkTime()}" scope ="page"></c:set>

                            <td class="column100 column90" data-column="column90">
                            ${e.getWorkTime()}
                        </td>
                        <td class="column100 column91" data-column="column91">
                            <c:if test="${e.getNoWorkTime() != 0}">
                                ${e.getNoWorkTime()}
                            </c:if> 
                        </td >
                        <td class="column100 column92" data-column="column92">
                            <c:if test="${e.getWorkBHXH() != 0}">
                                ${e.getWorkBHXH()}
                            </c:if> 
                        </td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </div>
</body>
</html> 