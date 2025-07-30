<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer - PahanEdu Bookshop</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f3f4f6;
        }
        .form-card {
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
        .input-highlight:focus {
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.3);
            border-color: #4f46e5;
        }
    </style>
</head>
<body class="min-h-screen bg-gray-50">
<!-- Header/Navigation would go here -->

<div class="container mx-auto px-4 py-8">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold text-gray-800">
            <a href="Customer.jsp" class="text-indigo-600 hover:text-indigo-800">
                <i class="fas fa-arrow-left mr-2"></i>
            </a>
            Add New Customer
        </h1>
    </div>

    <div class="form-card bg-white rounded-lg p-6">
        <form action="AddCustomerServlet" method="post" class="space-y-6">
            <c:if test="${not empty error}">
                <div class="p-4 bg-red-50 text-red-700 rounded-lg flex items-start">
                    <i class="fas fa-exclamation-circle mt-1 mr-3"></i>
                    <div>
                        <h4 class="font-medium">Error submitting form</h4>
                        <p class="text-sm">${error}</p>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="p-4 bg-green-50 text-green-700 rounded-lg flex items-start">
                    <i class="fas fa-check-circle mt-1 mr-3"></i>
                    <div>
                        <h4 class="font-medium">Success!</h4>
                        <p class="text-sm">${success}</p>
                    </div>
                </div>
            </c:if>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Personal Information Section -->
                <div class="md:col-span-2">
                    <h3 class="text-lg font-medium text-gray-900 border-b pb-2 mb-4">
                        <i class="fas fa-user-circle mr-2 text-indigo-600"></i>
                        Personal Information
                    </h3>
                </div>

                <div>
                    <label for="firstName" class="block text-sm font-medium text-gray-700 mb-1">First Name *</label>
                    <input type="text" id="firstName" name="firstName" required
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="lastName" class="block text-sm font-medium text-gray-700 mb-1">Last Name *</label>
                    <input type="text" id="lastName" name="lastName" required
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email *</label>
                    <input type="email" id="email" name="email" required
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="phone" class="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
                    <input type="tel" id="phone" name="phone"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="birthDate" class="block text-sm font-medium text-gray-700 mb-1">Date of Birth</label>
                    <input type="date" id="birthDate" name="birthDate"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="gender" class="block text-sm font-medium text-gray-700 mb-1">Gender</label>
                    <select id="gender" name="gender"
                            class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                        <option value="">Select</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                        <option value="prefer-not-to-say">Prefer not to say</option>
                    </select>
                </div>

                <!-- Address Information Section -->
                <div class="md:col-span-2 mt-6">
                    <h3 class="text-lg font-medium text-gray-900 border-b pb-2 mb-4">
                        <i class="fas fa-home mr-2 text-indigo-600"></i>
                        Address Information
                    </h3>
                </div>

                <div class="md:col-span-2">
                    <label for="streetAddress" class="block text-sm font-medium text-gray-700 mb-1">Street Address</label>
                    <input type="text" id="streetAddress" name="streetAddress"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="city" class="block text-sm font-medium text-gray-700 mb-1">City</label>
                    <input type="text" id="city" name="city"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="state" class="block text-sm font-medium text-gray-700 mb-1">State/Province</label>
                    <input type="text" id="state" name="state"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="postalCode" class="block text-sm font-medium text-gray-700 mb-1">Postal Code</label>
                    <input type="text" id="postalCode" name="postalCode"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="country" class="block text-sm font-medium text-gray-700 mb-1">Country</label>
                    <select id="country" name="country"
                            class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                        <option value="">Select Country</option>
                        <option value="US">United States</option>
                        <option value="UK">United Kingdom</option>
                        <option value="CA">Canada</option>
                        <option value="AU">Australia</option>
                        <!-- Add more countries as needed -->
                    </select>
                </div>

                <!-- Membership Information Section -->
                <div class="md:col-span-2 mt-6">
                    <h3 class="text-lg font-medium text-gray-900 border-b pb-2 mb-4">
                        <i class="fas fa-id-card mr-2 text-indigo-600"></i>
                        Membership Information
                    </h3>
                </div>

                <div>
                    <label for="membershipType" class="block text-sm font-medium text-gray-700 mb-1">Membership Type</label>
                    <select id="membershipType" name="membershipType"
                            class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                        <option value="standard">Standard (Free)</option>
                        <option value="premium">Premium ($9.99/month)</option>
                        <option value="vip">VIP ($19.99/month)</option>
                    </select>
                </div>

                <div>
                    <label for="joinDate" class="block text-sm font-medium text-gray-700 mb-1">Join Date</label>
                    <input type="date" id="joinDate" name="joinDate"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

            </div>

            <div class="flex justify-end space-x-3 pt-6 border-t border-gray-200">
                <button type="button" onclick="window.location.href='customers.jsp'"
                        class="px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Cancel
                </button>
                <button type="submit"
                        class="px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Save Customer
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    // Set default join date to today
    document.addEventListener('DOMContentLoaded', function() {
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('joinDate').value = today;

        // Form validation
        const form = document.querySelector('form');
        form.addEventListener('submit', function(e) {
            const email = document.getElementById('email').value;
            const phone = document.getElementById('phone').value;

            // Simple email validation
            if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                alert('Please enter a valid email address');
                e.preventDefault();
                return;
            }

            // Simple phone validation (numbers only)
            if (phone && !/^[\d\s\-()+]+$/.test(phone)) {
                alert('Please enter a valid phone number');
                e.preventDefault();
                return;
            }
        });
    });
</script>
</body>
</html>