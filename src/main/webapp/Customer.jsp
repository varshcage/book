<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management - PahanEdu Bookshop</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }
        ::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        .notification {
            animation: slideIn 0.3s ease-out, fadeOut 0.5s ease 3s forwards;
        }

        @keyframes slideIn {
            from { transform: translateX(100%); }
            to { transform: translateX(0); }
        }

        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }
    </style>
</head>
<body class="bg-gray-50 font-sans">
<!-- Notification Area -->
<body class="bg-gray-50 font-sans">
<!-- Notification Area -->
<div id="notification-area" class="fixed top-4 right-4 z-50 space-y-2">
    <c:if test="${not empty message}">
        <div class="notification px-4 py-3 rounded-md shadow-md flex items-center
                ${message.type == 'success' ? 'bg-green-100 text-green-800' :
                  message.type == 'error' ? 'bg-red-100 text-red-800' :
                  'bg-blue-100 text-blue-800'}">
            <i class="fas ${message.type == 'success' ? 'fa-check-circle' :
                           message.type == 'error' ? 'fa-exclamation-circle' :
                           'fa-info-circle'} mr-2"></i>
                ${message.text}
        </div>
    </c:if>
</div>

<!-- Sidebar -->
<div class="fixed inset-y-0 left-0 transform -translate-x-full md:translate-x-0 transition duration-200 ease-in-out z-40 w-64 bg-indigo-800 text-white shadow-lg">
    <div class="flex items-center justify-center h-16 px-4 border-b border-indigo-700">
        <div class="flex items-center space-x-2">
            <i class="fas fa-book-open text-2xl text-indigo-300"></i>
            <span class="text-xl font-bold">PahanEdu</span>
        </div>
    </div>
    <nav class="mt-6">
        <div class="px-4 space-y-1">
            <a href="dashboard.jsp" class="flex items-center px-4 py-3 text-indigo-200 hover:text-white hover:bg-indigo-700 rounded-lg">
                <i class="fas fa-tachometer-alt mr-3"></i>
                Dashboard
            </a>
            <a href="Book.jsp" class="flex items-center px-4 py-3 text-indigo-200 hover:text-white hover:bg-indigo-700 rounded-lg">
                <i class="fas fa-book mr-3"></i>
                Books
            </a>
            <a href="Customer.jsp" class="flex items-center px-4 py-3 text-white bg-indigo-900 rounded-lg">
                <i class="fas fa-users mr-3"></i>
                Customers
            </a>
            <a href="Bill.jsp" class="flex items-center px-4 py-3 text-indigo-200 hover:text-white hover:bg-indigo-700 rounded-lg">
                <i class="fa-solid fa-money-bill mr-3"></i>
                Billing
            </a>
            <a href="reports.jsp" class="flex items-center px-4 py-3 text-indigo-200 hover:text-white hover:bg-indigo-700 rounded-lg">
                <i class="fas fa-chart-line mr-3"></i>
                Reports
            </a>
        </div>
    </nav>
    <div class="absolute bottom-0 w-full p-4 border-t border-indigo-700">
        <div class="flex items-center">
            <img class="w-10 h-10 rounded-full bg-gray-200" src="" alt="Profile">
            <div class="ml-3">
                <p class="text-sm font-medium">Admin</p>
                <p class="text-xs text-indigo-300">Administrator</p>
            </div>
        </div>
    </div>
</div>

<!-- Mobile sidebar toggle -->
<div class="md:hidden fixed top-4 left-4 z-40">
    <button id="sidebar-toggle" class="p-2 rounded-md bg-indigo-800 text-white focus:outline-none">
        <i class="fas fa-bars"></i>
    </button>
</div>

<!-- Main Content -->
<div class="md:ml-64 min-h-screen">
    <!-- Header -->
    <header class="bg-white shadow-sm">
        <div class="flex justify-between items-center px-6 py-4">
            <h1 class="text-2xl font-semibold text-gray-800">Customer Management</h1>
            <div class="flex items-center space-x-4">
                <div class="relative">
                    <button class="p-2 rounded-full hover:bg-gray-100">
                        <i class="fas fa-bell text-gray-600"></i>
                        <span class="absolute top-0 right-0 w-2 h-2 bg-red-500 rounded-full"></span>
                    </button>
                </div>
                <div class="relative">
                    <input type="text" placeholder="Search customers..." class="pl-10 pr-4 py-2 border rounded-full focus:outline-none focus:ring-2 focus:ring-indigo-500">
                    <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content Area -->
    <main class="p-6">
        <!-- Action Bar -->
        <div class="flex justify-between items-center mb-6">
            <div class="flex space-x-2">
                <div class="relative">
                    <button id="filter-btn" class="px-4 py-2 border rounded-md text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500">
                        <i class="fas fa-filter mr-2"></i>Filter
                    </button>
                    <div id="filter-dropdown" class="hidden absolute mt-2 w-48 bg-white rounded-md shadow-lg z-10">
                        <div class="py-1">
                            <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">All Customers</a>
                            <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Active Members</a>
                            <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">New Customers</a>
                            <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">By Location</a>
                        </div>
                    </div>
                </div>
                <button id="export-btn" class="px-4 py-2 border rounded-md text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500">
                    <i class="fas fa-file-export mr-2"></i>Export
                </button>
            </div>
            <a href="Customer add.jsp">
            <button id="add-customer-btn" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500">
                <i class="fas fa-plus mr-2"></i>Add Customer
            </button>
            </a>
        </div>

        <!-- Customers Table -->
        <div class="bg-white rounded-lg shadow overflow-hidden">
            <div class="px-6 py-4 border-b border-gray-200 bg-indigo-600 text-white">
                <h3 class="text-lg font-medium">Customer List</h3>
            </div>
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Customer</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Contact</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Membership</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Registration Date</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach var="customer" items="${customers}">
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0 h-10 w-10">
                                        <img class="h-10 w-10 rounded-full" src="${not empty customer.profileImage ? customer.profileImage : 'https://randomuser.me/api/portraits/men/32.jpg'}" alt="">
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-sm font-medium text-gray-900">${customer.firstName} ${customer.lastName}</div>
                                        <div class="text-sm text-gray-500">ID: ${customer.customerId}</div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm text-gray-900">${customer.email}</div>
                                <div class="text-sm text-gray-500">${customer.phone}</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <c:choose>
                                    <c:when test="${customer.membershipType == 'PREMIUM'}">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Premium</span>
                                    </c:when>
                                    <c:when test="${customer.membershipType == 'STANDARD'}">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-blue-800">Standard</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">New</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    ${customer.registrationDate}
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                <a href="customers/edit?id=${customer.id}" class="text-indigo-600 hover:text-indigo-900 mr-3"><i class="fas fa-edit"></i></a>
                                <a href="customers/delete?id=${customer.id}" class="text-red-600 hover:text-red-900" onclick="return confirm('Are you sure you want to delete this customer?')"><i class="fas fa-trash"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="px-6 py-4 border-t border-gray-200 bg-gray-50 flex items-center justify-between">
                <div class="text-sm text-gray-500">
                    Showing <span class="font-medium">1</span> to <span class="font-medium">4</span> of <span class="font-medium">24</span> customers
                </div>
                <div class="flex space-x-2">
                    <button class="px-3 py-1 border rounded-md text-gray-700 bg-gray-50 hover:bg-gray-100">Previous</button>
                    <button class="px-3 py-1 border rounded-md bg-indigo-600 text-white hover:bg-indigo-700">1</button>
                    <button class="px-3 py-1 border rounded-md text-gray-700 bg-gray-50 hover:bg-gray-100">2</button>
                    <button class="px-3 py-1 border rounded-md text-gray-700 bg-gray-50 hover:bg-gray-100">3</button>
                    <button class="px-3 py-1 border rounded-md text-gray-700 bg-gray-50 hover:bg-gray-100">Next</button>
                </div>
            </div>
        </div>
    </main>
</div>

<!-- Add Customer Modal -->
<div class="modal fade fixed top-0 left-0 hidden w-full h-full outline-none overflow-x-hidden overflow-y-auto" id="addCustomerModal" tabindex="-1" aria-labelledby="addCustomerModalLabel" aria-hidden="true">
    <div class="modal-dialog relative w-auto pointer-events-none max-w-2xl mx-auto my-8">
        <div class="modal-content border-none shadow-lg relative flex flex-col w-full pointer-events-auto bg-white bg-clip-padding rounded-md outline-none text-current">
            <div class="modal-header flex flex-shrink-0 items-center justify-between p-4 border-b border-gray-200 rounded-t-md bg-indigo-600 text-white">
                <h5 class="text-xl font-medium leading-normal" id="addCustomerModalLabel">Add New Customer</h5>
                <button type="button" class="btn-close box-content w-4 h-4 p-1 text-white border-none rounded-none opacity-50 focus:shadow-none focus:outline-none focus:opacity-100" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body relative p-6">
                <form>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label for="customer-firstname" class="block text-sm font-medium text-gray-700 mb-1">First Name</label>
                            <input type="text" id="customer-firstname" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
                        </div>
                        <div>
                            <label for="customer-lastname" class="block text-sm font-medium text-gray-700 mb-1">Last Name</label>
                            <input type="text" id="customer-lastname" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
                        </div>
                        <div>
                            <label for="customer-email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                            <input type="email" id="customer-email" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
                        </div>
                        <div>
                            <label for="customer-phone" class="block text-sm font-medium text-gray-700 mb-1">Phone</label>
                            <input type="tel" id="customer-phone" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                        </div>
                        <div>
                            <label for="customer-address" class="block text-sm font-medium text-gray-700 mb-1">Address</label>
                            <input type="text" id="customer-address" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                        </div>
                        <div>
                            <label for="customer-city" class="block text-sm font-medium text-gray-700 mb-1">City</label>
                            <input type="text" id="customer-city" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                        </div>
                        <div>
                            <label for="customer-membership" class="block text-sm font-medium text-gray-700 mb-1">Membership</label>
                            <select id="customer-membership" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                                <option value="standard">Standard</option>
                                <option value="premium">Premium</option>
                                <option value="new">New</option>
                            </select>
                        </div>
                        <div class="md:col-span-2">
                            <label for="customer-notes" class="block text-sm font-medium text-gray-700 mb-1">Notes</label>
                            <textarea id="customer-notes" rows="2" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer flex flex-shrink-0 flex-wrap items-center justify-end p-4 border-t border-gray-200 rounded-b-md">
                <button type="button" class="px-4 py-2 border border-gray-300 rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 mr-2" data-bs-dismiss="modal">
                    Cancel
                </button>
                <button type="button" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Add Customer
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Edit Customer Modal -->
<div class="modal fade fixed top-0 left-0 hidden w-full h-full outline-none overflow-x-hidden overflow-y-auto" id="editCustomerModal" tabindex="-1" aria-labelledby="editCustomerModalLabel" aria-hidden="true">
    <!-- Similar structure to Add Customer Modal -->
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade fixed top-0 left-0 hidden w-full h-full outline-none overflow-x-hidden overflow-y-auto" id="deleteCustomerModal" tabindex="-1" aria-labelledby="deleteCustomerModalLabel" aria-hidden="true">
    <div class="modal-dialog relative w-auto pointer-events-none max-w-md mx-auto my-8">
        <div class="modal-content border-none shadow-lg relative flex flex-col w-full pointer-events-auto bg-white bg-clip-padding rounded-md outline-none text-current">
            <div class="modal-header flex flex-shrink-0 items-center justify-between p-4 border-b border-gray-200 rounded-t-md bg-red-600 text-white">
                <h5 class="text-xl font-medium leading-normal" id="deleteCustomerModalLabel">Confirm Deletion</h5>
                <button type="button" class="btn-close box-content w-4 h-4 p-1 text-white border-none rounded-none opacity-50 focus:shadow-none focus:outline-none focus:opacity-100" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body relative p-6">
                <p class="text-gray-700">Are you sure you want to delete this customer? This action cannot be undone.</p>
            </div>
            <div class="modal-footer flex flex-shrink-0 flex-wrap items-center justify-end p-4 border-t border-gray-200 rounded-b-md">
                <button type="button" class="px-4 py-2 border border-gray-300 rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 mr-2" data-bs-dismiss="modal">
                    Cancel
                </button>
                <button type="button" class="px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
                    Delete
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script>
    // Toggle sidebar on mobile
    document.getElementById('sidebar-toggle').addEventListener('click', function() {
        document.querySelector('.fixed.inset-y-0.left-0').classList.toggle('-translate-x-full');
    });

    // Toggle filter dropdown
    document.getElementById('filter-btn').addEventListener('click', function() {
        document.getElementById('filter-dropdown').classList.toggle('hidden');
    });

    // Show add customer modal
    document.getElementById('add-customer-btn').addEventListener('click', function() {
        var addCustomerModal = new bootstrap.Modal(document.getElementById('addCustomerModal'));
        addCustomerModal.show();
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', function(event) {
        if (!event.target.closest('#filter-btn') && !event.target.closest('#filter-dropdown')) {
            document.getElementById('filter-dropdown').classList.add('hidden');
        }
    });

    // Initialize tooltips for action buttons
    document.querySelectorAll('[data-toggle="tooltip"]').forEach(function(element) {
        new bootstrap.Tooltip(element);
    });
</script>
</body>
</html>