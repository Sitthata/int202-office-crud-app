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
    </div>
</nav>
<section class="px-4 py-5">
    <div class="mb-4">
        <form action="office-list" method="get">
            <div>
                <label class="block text-gray-700 text-sm font-bold mb-2" for="findByCountry">
                    Find By City or Country
                </label>
                <div class="flex gap-1">
                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                           id="findByCountry" type="text" placeholder="Country or City" name="cityOrCountry">
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                        Find
                    </button>
                    <c:if test="${requestScope.cityOrCountry != null}">
                        <a href="office-list"
                           class="bg-red-400 hover:bg-red-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                           type="submit">
                            Reset
                        </a>
                    </c:if>
                </div>
            </div>
        </form>
    </div>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <c:forEach items="${requestScope.offices}" var="office">
            <div class="bg-emerald-500 justify-around flex flex-col gap-3 p-3 rounded-lg md:min-w-auto w-full min-h-[250px]">
                <h2 class="text-lg font-semibold">Code:${office.officeCode}</h2>
                <hr class="bg-black">
                <h3 class="text-3xl font-semibold">${office.city} : ${office.state}</h3>
                <div class="text-md bg-emerald-200 p-3">
                    <h3>Territory: ${office.territory}</h3>
                    <h3>Country: ${office.country}</h3>
                    <h3>Address1: ${office.addressLine1}</h3>
                    <h3>Address2: ${office.addressLine2}</h3>
                </div>
                <div>
                    <span class="text-bold text-lg">Contact</span>
                    <h2><span class="font-semibold">${office.postalCode}</span> | ${office.phone}</h2>
                </div>
                <div class="flex w-full gap-2">
                    <!-- Form for PUT -->
                    <form action="edit-office" method="get">
                        <input type="hidden" name="officeCode" value="${office.officeCode}"/>
                        <button type="submit"
                                class="bg-emerald-400 font-semibold px-[0.75rem] py-[0.5rem] rounded-lg">
                            Edit
                        </button>
                    </form>
                    <!-- Form for DELETE -->
                    <form action="edit-office" method="post">
                        <input type="hidden" name="_method" value="delete"/>
                        <input type="hidden" name="officeCode" value="${office.officeCode}"/>
                        <button type="submit"
                                class="bg-red-400 font-semibold px-[0.75rem] py-[0.5rem] rounded-lg">
                            Delete
                        </button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
</body>
</html>
