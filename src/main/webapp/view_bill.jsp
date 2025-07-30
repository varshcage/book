<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing - PahanEdu Bookshop</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f3f4f6;
        }
        .bill-card {
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
        @media print {
            body * {
                visibility: hidden;
            }
            .print-section, .print-section * {
                visibility: visible;
            }
            .print-section {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
            }
            .no-print {
                display: none;
            }
            .bill-table {
                width: 100%;
                border-collapse: collapse;
            }
            .bill-table th, .bill-table td {
                border: 1px solid #ddd;
                padding: 8px;
            }
        }
    </style>
</head>
<body class="min-h-screen bg-gray-50">
<div class="container mx-auto px-4 py-8">
    <div class="flex justify-between items-center mb-6 no-print">
        <h1 class="text-2xl font-bold text-gray-800">
            <a href="dashboard.jsp" class="text-indigo-600 hover:text-indigo-800">
                <i class="fas fa-arrow-left mr-2"></i>
            </a>
            Billing
        </h1>
        <div class="flex space-x-3">
            <button onclick="printBill()" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                <i class="fas fa-print mr-2"></i>Print Bill
            </button>
            <button onclick="window.location.href='new-bill.jsp'" class="px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                <i class="fas fa-plus mr-2"></i>New Bill
            </button>
        </div>
    </div>

    <div class="bill-card bg-white rounded-lg p-6 print-section">
        <!-- Bill Header -->
        <div class="text-center mb-8">
            <div class="flex items-center justify-center mb-2">
                <i class="fas fa-book-open text-3xl text-indigo-600 mr-3"></i>
                <h2 class="text-3xl font-bold text-gray-800">PahanEdu Bookshop</h2>
            </div>
            <p class="text-gray-600">123 Education Street, Colombo 05</p>
            <p class="text-gray-600">Tel: 011-1234567 | Email: info@pahanedu.com</p>
            <p class="text-gray-600">VAT No: 123456789</p>
        </div>

        <!-- Bill Info -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div>
                <h3 class="text-lg font-medium text-gray-900 mb-2">Bill To:</h3>
                <p class="text-gray-700">John Smith</p>
                <p class="text-gray-700">john.smith@example.com</p>
                <p class="text-gray-700">(555) 123-4567</p>
            </div>
            <div>
                <h3 class="text-lg font-medium text-gray-900 mb-2">Bill Details:</h3>
                <p class="text-gray-700"><span class="font-medium">Bill No:</span> INV-2023-1001</p>
                <p class="text-gray-700"><span class="font-medium">Date:</span> <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></p>
                <p class="text-gray-700"><span class="font-medium">Payment Method:</span> Cash</p>
            </div>
            <div class="md:text-right">
                <h3 class="text-lg font-medium text-gray-900 mb-2">Amount Due:</h3>
                <p class="text-2xl font-bold text-indigo-600">LKR 3,450.00</p>
                <p class="text-gray-700">Due: Upon Receipt</p>
            </div>
        </div>

        <!-- Bill Items -->
        <div class="mb-8 overflow-x-auto">
            <table class="bill-table min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">#</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Item</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Price</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Qty</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Discount</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Amount</th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                <tr>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">1</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm font-medium text-gray-900">Intro to Java Programming</div>
                        <div class="text-sm text-gray-500">ISBN: 978-0135166307</div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">LKR 1,500.00</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">1</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">10%</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">LKR 1,350.00</td>
                </tr>
                <tr>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm font-medium text-gray-900">Web Development 101</div>
                        <div class="text-sm text-gray-500">ISBN: 978-1492052204</div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">LKR 1,200.00</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">1</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">5%</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">LKR 1,140.00</td>
                </tr>
                <tr>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">3</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm font-medium text-gray-900">Learning SQL</div>
                        <div class="text-sm text-gray-500">ISBN: 978-1492057611</div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">LKR 1,100.00</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">1</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">5%</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">LKR 1,045.00</td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- Bill Summary -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
                <h3 class="text-lg font-medium text-gray-900 mb-2">Notes:</h3>
                <p class="text-gray-700">Thank you for your purchase. Please bring this invoice for any returns or exchanges within 14 days.</p>
            </div>
            <div>
                <div class="bg-gray-50 p-4 rounded-md">
                    <div class="flex justify-between py-2 border-b border-gray-200">
                        <span class="text-gray-700">Subtotal:</span>
                        <span class="text-gray-900 font-medium">LKR 3,535.00</span>
                    </div>
                    <div class="flex justify-between py-2 border-b border-gray-200">
                        <span class="text-gray-700">Discount:</span>
                        <span class="text-gray-900 font-medium">LKR 85.00</span>
                    </div>
                    <div class="flex justify-between py-2 border-b border-gray-200">
                        <span class="text-gray-700">Tax (8%):</span>
                        <span class="text-gray-900 font-medium">LKR 282.80</span>
                    </div>
                    <div class="flex justify-between py-2">
                        <span class="text-lg font-bold text-gray-900">Total:</span>
                        <span class="text-lg font-bold text-indigo-600">LKR 3,450.00</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="mt-12 pt-6 border-t border-gray-200 text-center text-gray-500 text-sm">
            <p>Thank you for shopping with us!</p>
            <p class="mt-1">This is a computer generated invoice and does not require a signature.</p>
        </div>
    </div>

    <!-- Action Buttons (Non-printable) -->
    <div class="mt-6 flex justify-end space-x-3 no-print">
        <button onclick="window.location.href='new-bill.jsp'" class="px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
            <i class="fas fa-redo mr-2"></i>Create Another Bill
        </button>
        <button onclick="downloadBill()" class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
            <i class="fas fa-download mr-2"></i>Download PDF
        </button>
    </div>
</div>

<script>
    // Print bill function
    function printBill() {
        window.print();
    }

    // Download as PDF function (would need a PDF generation library)
    function downloadBill() {
        // In a real implementation, you would use a library like jsPDF or make an API call
        alert("PDF download functionality would be implemented here");
        // Example: window.location.href = 'GeneratePDFServlet?billId=123';
    }

    // You could also add functionality to calculate totals dynamically
    document.addEventListener('DOMContentLoaded', function() {
        // Calculate and update totals if needed
        const subtotal = 3535.00;
        const discount = 85.00;
        const tax = (subtotal - discount) * 0.08;
        const total = subtotal - discount + tax;

        // Update the DOM elements if you're calculating dynamically
        // document.getElementById('subtotal').textContent = 'LKR ' + subtotal.toFixed(2);
        // document.getElementById('tax').textContent = 'LKR ' + tax.toFixed(2);
        // document.getElementById('total').textContent = 'LKR ' + total.toFixed(2);
    });
</script>
</body>
</html>