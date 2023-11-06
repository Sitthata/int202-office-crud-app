<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Office</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-emerald-100">
<nav class="flex justify-between items-center p-5">
    <h1 class="text-5xl font-bold">Office Manager ::</h1>
    <div class="flex gap-2">
        <!-- Assume other links lead to their respective JSP pages -->
        <a href="office-list" class="bg-sky-400 font-semibold px-[0.75rem] py-[0.5rem] rounded-lg">Office List</a>
        <a href="delete-office.jsp" class="bg-red-400 font-semibold px-[0.75rem] py-[0.5rem] rounded-lg">Delete
            Office</a>
        <a href="update-office.jsp" class="bg-emerald-400 font-semibold px-[0.75rem] py-[0.5rem] rounded-lg">Update
            Office</a>
    </div>
</nav>

<section class="px-4 py-5">
    <div class="w-full lg:max-w-lg lg:mx-auto">
        <form action="add-office" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
            <!-- Hidden field to specify the action for the servlet -->
            <input type="hidden" name="action" value="add">

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="officeCode">
                    Office Code
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="officeCode" type="text" placeholder="Code" name="officeCode" required>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="city">
                    City
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="city" type="text" placeholder="City" name="city" required>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="state">
                    State
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="state" type="text" placeholder="State" name="state">
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="territory">
                    Territory
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="territory" type="text" placeholder="Territory" name="territory" required>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="postalCode">
                    Postal Code
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="postalCode" type="text" placeholder="Postal Code" name="postalCode" required>
            </div>
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="phone">
                    Phone
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
                       id="phone" type="text" placeholder="Phone" name="phone" required>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="addressLine1">
                    Address Line 1
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="addressLine1" type="text" placeholder="1234 Main St" name="addressLine1" required>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="addressLine2">
                    Address Line 2
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="addressLine2" type="text" placeholder="Apartment, studio, or floor" name="addressLine2">
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="country">
                    Country
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="country" type="text" placeholder="Country" name="country" required>
            </div>

            <div class="flex items-center justify-between">
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                        type="submit">
                    Add Office
                </button>
            </div>
        </form>
        <c:if test="${requestScope.errorMessage != null}">
            <h2 class="font-semibold text-red-500">${errorMessage}</h2>
        </c:if>
    </div>
</section>