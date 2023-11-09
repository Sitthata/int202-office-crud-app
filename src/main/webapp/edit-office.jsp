<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/9/2023
  Time: 5:52 PM
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
        <!-- Assume other links lead to their respective JSP pages -->
        <a href="office-list" class="bg-sky-400 font-semibold px-[0.75rem] py-[0.5rem] rounded-lg">Office List</a>
    </div>
</nav>
<section class="px-4 py-5">
    <div class="w-full lg:max-w-lg lg:mx-auto">
        <h2 class="text-2xl font-semibold">Edit Office #${office.officeCode}</h2>
        <form action="edit-office" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
            <!-- Hidden input to spoof the PUT HTTP method -->
            <input type="hidden" name="_method" value="put">
            <!-- Office code -->
            <input type="hidden" name="officeCode" value="${office.officeCode}">

            <!-- Address Line 1 -->
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="addressLine1">
                    Address Line 1
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="addressLine1" type="text" placeholder="${office.addressLine1}" name="addressLine1">
            </div>

            <!-- Address Line 2 -->
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="addressLine2">
                    Address Line 2
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="addressLine2" type="text" placeholder="${office.addressLine2}" name="addressLine2">
            </div>

            <!-- City -->
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="city">
                    City
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="city" type="text" placeholder="${office.city}" name="city">
            </div>

            <!-- State -->
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="state">
                    State
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="state" type="text" placeholder="${office.state}" name="state">
            </div>

            <!-- Country -->
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="country">
                    Country
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="country" type="text" placeholder="${office.country}" name="country">
            </div>

            <!-- Postal Code -->
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="postalCode">
                    Postal Code
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="postalCode" type="text" placeholder="${office.postalCode}" name="postalCode">
            </div>

            <!-- Phone -->
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="phone">
                    Phone
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
                       id="phone" type="text" placeholder="${office.phone}" name="phone">
            </div>

            <!-- Territory -->
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="territory">
                    Territory
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="territory" type="text" placeholder="${office.territory}" name="territory">
            </div>

            <div class="flex items-center justify-between">
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                        type="submit">
                    Update Office
                </button>
            </div>
        </form>
        <c:if test="${not empty requestScope.errorMessage}">
            <h2 class="font-semibold text-red-500">${requestScope.errorMessage}</h2>
        </c:if>
    </div>
</section>
</body>
</html>
