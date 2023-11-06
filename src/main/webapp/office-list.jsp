<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/6/2023
  Time: 10:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-emerald-100">
<nav class="flex justify-between items-center p-5">
    <h1 class="text-5xl font-bold">Office Manager ::</h1>
    <div class="flex gap-2">
        <a href="add-office" class="bg-sky-400 font-semibold px-[0.75rem] py-[0.5rem] rounded-lg">Add Office</a>
        <a href="delete-office" class="bg-red-400 font-semibold px-[0.75rem] py-[0.5rem] rounded-lg">Delete Office</a>
        <a href="delete-office" class="bg-emerald-400 font-semibold px-[0.75rem] py-[0.5rem] rounded-lg">Update Office</a>
    </div>
</nav>
<section class="px-4 py-5">
    <div class="flex flex-col gap-3 md:flex-wrap md:flex-row">
        <c:forEach items="${requestScope.offices}" var="office">
            <div class="bg-emerald-600 flex flex-col gap-3 p-3 rounded-lg md:min-w-auto w-full min-h-[250px]">
                <h2 class="text-lg font-semibold">Code:${office.officeCode}</h2>
                <hr>
                <h3 class="text-3xl font-semibold">${office.city} : ${office.state}</h3>
                <h3>Territory: ${office.territory}</h3>
                <div>
                    <span class="text-bold text-lg">Contact</span>
                    <h2><span class="font-semibold">${office.postalCode}</span> | ${office.phone}</h2>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
</body>
</html>
