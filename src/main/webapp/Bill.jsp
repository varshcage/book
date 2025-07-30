<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Bill - PahanEdu Bookshop</title>
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
        .item-row:hover {
            background-color: #f9fafb;
        }
    </style>
</head>
<body class="min-h-screen bg-gray-50">
<div class="container mx-auto px-4 py-8">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold text-gray-800">
            <a href="billing.jsp" class="text-indigo-600 hover:text-indigo-800">
                <i class="fas fa-arrow-left mr-2"></i>
            </a>
            Create New Bill
        </h1>
        <div class="flex space-x-3">
            <button id="saveBillBtn" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                <i class="fas fa-save mr-2"></i>Save Bill
            </button>
            <button id="previewBillBtn" class="px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                <i class="fas fa-eye mr-2"></i>Preview
            </button>
        </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <!-- Customer and Bill Info -->
        <div class="lg:col-span-1">
            <div class="form-card bg-white rounded-lg p-6 h-full">
                <h3 class="text-lg font-medium text-gray-900 border-b pb-2 mb-4">
                    <i class="fas fa-user mr-2 text-indigo-600"></i>
                    Customer Information
                </h3>

                <div class="space-y-4">
                    <div>
                        <label for="customerSearch" class="block text-sm font-medium text-gray-700 mb-1">Search Customer</label>
                        <div class="relative">
                            <input type="text" id="customerSearch" placeholder="Search by name, email or phone"
                                   class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                            <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                                <i class="fas fa-search text-gray-400"></i>
                            </div>
                        </div>
                        <div id="customerResults" class="hidden mt-1 border border-gray-200 rounded-md bg-white max-h-60 overflow-auto"></div>
                    </div>

                    <div id="customerDetails" class="hidden space-y-3">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Selected Customer</label>
                            <div class="p-3 bg-gray-50 rounded-md">
                                <p class="font-medium" id="selectedCustomerName">John Smith</p>
                                <p class="text-sm text-gray-600" id="selectedCustomerEmail">john@example.com</p>
                                <p class="text-sm text-gray-600" id="selectedCustomerPhone">(555) 123-4567</p>
                            </div>
                        </div>

                        <div>
                            <label for="paymentMethod" class="block text-sm font-medium text-gray-700 mb-1">Payment Method *</label>
                            <select id="paymentMethod" required
                                    class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                                <option value="">Select Method</option>
                                <option value="cash">Cash</option>
                                <option value="credit_card">Credit Card</option>
                                <option value="debit_card">Debit Card</option>
                                <option value="bank_transfer">Bank Transfer</option>
                            </select>
                        </div>

                        <div>
                            <label for="billNotes" class="block text-sm font-medium text-gray-700 mb-1">Notes</label>
                            <textarea id="billNotes" rows="2"
                                      class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bill Items -->
        <div class="lg:col-span-2">
            <div class="form-card bg-white rounded-lg p-6">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-lg font-medium text-gray-900">
                        <i class="fas fa-book mr-2 text-indigo-600"></i>
                        Bill Items
                    </h3>
                    <button id="addItemBtn" class="px-3 py-1 bg-green-600 text-white rounded-md text-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
                        <i class="fas fa-plus mr-1"></i>Add Item
                    </button>
                </div>

                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                        <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Item</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Price</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Qty</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Discount</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Total</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
                        </tr>
                        </thead>
                        <tbody id="billItems" class="bg-white divide-y divide-gray-200">
                        <!-- Items will be added here dynamically -->
                        <tr id="noItemsRow">
                            <td colspan="6" class="px-6 py-4 text-center text-sm text-gray-500">No items added yet</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Add Item Modal (hidden by default) -->
                <div id="addItemModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
                    <div class="bg-white rounded-lg p-6 w-full max-w-md">
                        <div class="flex justify-between items-center mb-4">
                            <h3 class="text-lg font-medium text-gray-900">Add Item</h3>
                            <button id="closeItemModal" class="text-gray-400 hover:text-gray-500">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>

                        <div class="space-y-4">
                            <div>
                                <label for="itemSearch" class="block text-sm font-medium text-gray-700 mb-1">Search Book</label>
                                <div class="relative">
                                    <input type="text" id="itemSearch" placeholder="Search by title, author or ISBN"
                                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                                    <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                                        <i class="fas fa-search text-gray-400"></i>
                                    </div>
                                </div>
                                <div id="itemResults" class="hidden mt-1 border border-gray-200 rounded-md bg-white max-h-60 overflow-auto"></div>
                            </div>

                            <div id="itemDetails" class="hidden space-y-3">
                                <div class="grid grid-cols-3 gap-4">
                                    <div class="col-span-1">
                                        <div id="itemCover" class="h-32 bg-gray-100 rounded-md flex items-center justify-center">
                                            <span class="text-gray-400">No cover</span>
                                        </div>
                                    </div>
                                    <div class="col-span-2">
                                        <p class="font-medium" id="itemTitle">Book Title</p>
                                        <p class="text-sm text-gray-600" id="itemAuthor">Author Name</p>
                                        <p class="text-sm text-gray-600" id="itemISBN">ISBN: 0000000000</p>
                                        <p class="text-sm text-gray-600" id="itemStock">In Stock: 10</p>
                                    </div>
                                </div>

                                <div class="grid grid-cols-3 gap-4">
                                    <div>
                                        <label for="itemPrice" class="block text-sm font-medium text-gray-700 mb-1">Price (LKR)</label>
                                        <input type="number" id="itemPrice" min="0" step="0.01"
                                               class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                                    </div>
                                    <div>
                                        <label for="itemQuantity" class="block text-sm font-medium text-gray-700 mb-1">Quantity</label>
                                        <input type="number" id="itemQuantity" min="1" value="1"
                                               class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                                    </div>
                                    <div>
                                        <label for="itemDiscount" class="block text-sm font-medium text-gray-700 mb-1">Discount (%)</label>
                                        <input type="number" id="itemDiscount" min="0" max="100" value="0"
                                               class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="mt-6 flex justify-end space-x-3">
                            <button id="cancelAddItem" class="px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                Cancel
                            </button>
                            <button id="confirmAddItem" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                Add Item
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Bill Summary -->
                <div class="mt-8 pt-6 border-t border-gray-200">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label for="additionalNotes" class="block text-sm font-medium text-gray-700 mb-1">Additional Notes</label>
                            <textarea id="additionalNotes" rows="2"
                                      class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"></textarea>
                        </div>
                        <div>
                            <div class="bg-gray-50 p-4 rounded-md">
                                <div class="flex justify-between py-2 border-b border-gray-200">
                                    <span class="text-gray-700">Subtotal:</span>
                                    <span class="text-gray-900 font-medium" id="subtotalAmount">LKR 0.00</span>
                                </div>
                                <div class="flex justify-between py-2 border-b border-gray-200">
                                    <span class="text-gray-700">Discount:</span>
                                    <span class="text-gray-900 font-medium" id="discountAmount">LKR 0.00</span>
                                </div>
                                <div class="flex justify-between py-2 border-b border-gray-200">
                                    <span class="text-gray-700">Tax (8%):</span>
                                    <span class="text-gray-900 font-medium" id="taxAmount">LKR 0.00</span>
                                </div>
                                <div class="flex justify-between py-2">
                                    <span class="text-lg font-bold text-gray-900">Total:</span>
                                    <span class="text-lg font-bold text-indigo-600" id="totalAmount">LKR 0.00</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Sample data - in a real app, this would come from your backend
    const sampleCustomers = [
        { id: 1, name: "John Smith", email: "john@example.com", phone: "(555) 123-4567" },
        { id: 2, name: "Jane Doe", email: "jane@example.com", phone: "(555) 987-6543" },
        { id: 3, name: "Robert Johnson", email: "robert@example.com", phone: "(555) 456-7890" }
    ];

    const sampleBooks = [
        {
            id: 1,
            title: "Intro to Java Programming",
            author: "Daniel Liang",
            isbn: "978-0135166307",
            price: 1500.00,
            stock: 15,
            cover: "https://m.media-amazon.com/images/I/41f6Rd6ZEPL._SY425_.jpg"
        },
        {
            id: 2,
            title: "Web Development 101",
            author: "Ethan Marcotte",
            isbn: "978-1492052204",
            price: 1200.00,
            stock: 8,
            cover: "https://m.media-amazon.com/images/I/51WS36aA2BL._SY425_.jpg"
        },
        {
            id: 3,
            title: "Learning SQL",
            author: "Alan Beaulieu",
            isbn: "978-1492057611",
            price: 1100.00,
            stock: 12,
            cover: "https://m.media-amazon.com/images/I/51gP9mXEqWL._SY425_.jpg"
        }
    ];

    // DOM elements
    const customerSearch = document.getElementById('customerSearch');
    const customerResults = document.getElementById('customerResults');
    const customerDetails = document.getElementById('customerDetails');
    const addItemBtn = document.getElementById('addItemBtn');
    const addItemModal = document.getElementById('addItemModal');
    const closeItemModal = document.getElementById('closeItemModal');
    const cancelAddItem = document.getElementById('cancelAddItem');
    const itemSearch = document.getElementById('itemSearch');
    const itemResults = document.getElementById('itemResults');
    const itemDetails = document.getElementById('itemDetails');
    const confirmAddItem = document.getElementById('confirmAddItem');
    const billItems = document.getElementById('billItems');
    const noItemsRow = document.getElementById('noItemsRow');

    // Bill items array
    let billItemsData = [];
    let selectedBook = null;

    // Customer search functionality
    customerSearch.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        if (searchTerm.length < 2) {
            customerResults.classList.add('hidden');
            return;
        }

        const filteredCustomers = sampleCustomers.filter(customer =>
            customer.name.toLowerCase().includes(searchTerm) ||
            customer.email.toLowerCase().includes(searchTerm) ||
            customer.phone.includes(searchTerm)
        );

        if (filteredCustomers.length > 0) {
            customerResults.innerHTML = filteredCustomers.map(customer => `
                    <div class="p-2 hover:bg-gray-100 cursor-pointer border-b border-gray-100 last:border-0 customer-item"
                         data-id="${customer.id}"
                         data-name="${customer.name}"
                         data-email="${customer.email}"
                         data-phone="${customer.phone}">
                        ${customer.name} - ${customer.email}
                    </div>
                `).join('');
            customerResults.classList.remove('hidden');
        } else {
            customerResults.innerHTML = '<div class="p-2 text-gray-500">No customers found</div>';
            customerResults.classList.remove('hidden');
        }
    });

    // Handle customer selection
    customerResults.addEventListener('click', function(e) {
        if (e.target.classList.contains('customer-item')) {
            const customerId = e.target.getAttribute('data-id');
            const customerName = e.target.getAttribute('data-name');
            const customerEmail = e.target.getAttribute('data-email');
            const customerPhone = e.target.getAttribute('data-phone');

            document.getElementById('selectedCustomerName').textContent = customerName;
            document.getElementById('selectedCustomerEmail').textContent = customerEmail;
            document.getElementById('selectedCustomerPhone').textContent = customerPhone;

            customerSearch.value = customerName;
            customerResults.classList.add('hidden');
            customerDetails.classList.remove('hidden');
        }
    });

    // Add item modal
    addItemBtn.addEventListener('click', function() {
        addItemModal.classList.remove('hidden');
    });

    [closeItemModal, cancelAddItem].forEach(btn => {
        btn.addEventListener('click', function() {
            addItemModal.classList.add('hidden');
            itemDetails.classList.add('hidden');
            itemSearch.value = '';
            selectedBook = null;
        });
    });

    // Book search functionality
    itemSearch.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        if (searchTerm.length < 2) {
            itemResults.classList.add('hidden');
            return;
        }

        const filteredBooks = sampleBooks.filter(book =>
            book.title.toLowerCase().includes(searchTerm) ||
            book.author.toLowerCase().includes(searchTerm) ||
            book.isbn.includes(searchTerm)
        );

        if (filteredBooks.length > 0) {
            itemResults.innerHTML = filteredBooks.map(book => `
                    <div class="p-2 hover:bg-gray-100 cursor-pointer border-b border-gray-100 last:border-0 book-item"
                         data-id="${book.id}"
                         data-title="${book.title}"
                         data-author="${book.author}"
                         data-isbn="${book.isbn}"
                         data-price="${book.price}"
                         data-stock="${book.stock}"
                         data-cover="${book.cover}">
                        ${book.title} - ${book.author} (LKR ${book.price.toFixed(2)})
                    </div>
                `).join('');
            itemResults.classList.remove('hidden');
        } else {
            itemResults.innerHTML = '<div class="p-2 text-gray-500">No books found</div>';
            itemResults.classList.remove('hidden');
        }
    });

    // Handle book selection
    itemResults.addEventListener('click', function(e) {
        if (e.target.classList.contains('book-item')) {
            selectedBook = {
                id: e.target.getAttribute('data-id'),
                title: e.target.getAttribute('data-title'),
                author: e.target.getAttribute('data-author'),
                isbn: e.target.getAttribute('data-isbn'),
                price: parseFloat(e.target.getAttribute('data-price')),
                stock: parseInt(e.target.getAttribute('data-stock')),
                cover: e.target.getAttribute('data-cover')
            };

            document.getElementById('itemTitle').textContent = selectedBook.title;
            document.getElementById('itemAuthor').textContent = selectedBook.author;
            document.getElementById('itemISBN').textContent = `ISBN: ${selectedBook.isbn}`;
            document.getElementById('itemStock').textContent = `In Stock: ${selectedBook.stock}`;
            document.getElementById('itemPrice').value = selectedBook.price;
            document.getElementById('itemQuantity').value = 1;
            document.getElementById('itemDiscount').value = 0;

            const coverElement = document.getElementById('itemCover');
            if (selectedBook.cover) {
                coverElement.innerHTML = `<img src="${selectedBook.cover}" class="h-full w-full object-contain" alt="Book cover">`;
            } else {
                coverElement.innerHTML = '<span class="text-gray-400">No cover</span>';
            }

            itemResults.classList.add('hidden');
            itemDetails.classList.remove('hidden');
        }
    });

    // Add item to bill
    confirmAddItem.addEventListener('click', function() {
        if (!selectedBook) return;

        const price = parseFloat(document.getElementById('itemPrice').value) || selectedBook.price;
        const quantity = parseInt(document.getElementById('itemQuantity').value) || 1;
        const discount = parseInt(document.getElementById('itemDiscount').value) || 0;
        const discountAmount = price * quantity * (discount / 100);
        const itemTotal = (price * quantity) - discountAmount;

        const newItem = {
            id: selectedBook.id,
            title: selectedBook.title,
            isbn: selectedBook.isbn,
            price: price,
            quantity: quantity,
            discount: discount,
            total: itemTotal
        };

        billItemsData.push(newItem);
        renderBillItems();
        calculateTotals();

        // Reset and close modal
        addItemModal.classList.add('hidden');
        itemDetails.classList.add('hidden');
        itemSearch.value = '';
        selectedBook = null;
    });

    // Render bill items
    function renderBillItems() {
        if (billItemsData.length === 0) {
            noItemsRow.classList.remove('hidden');
            billItems.innerHTML = '';
            billItems.appendChild(noItemsRow);
            return;
        }

        noItemsRow.classList.add('hidden');
        billItems.innerHTML = billItemsData.map((item, index) => `
                <tr class="item-row" data-index="${index}">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm font-medium text-gray-900">${item.title}</div>
                        <div class="text-sm text-gray-500">${item.isbn}</div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">LKR ${item.price.toFixed(2)}</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${item.quantity}</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${item.discount}%</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">LKR ${item.total.toFixed(2)}</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <button class="text-red-600 hover:text-red-900 remove-item">
                            <i class="fas fa-trash"></i>
                        </button>
                    </td>
                </tr>
            `).join('');

        // Add event listeners to remove buttons
        document.querySelectorAll('.remove-item').forEach(btn => {
            btn.addEventListener('click', function() {
                const row = this.closest('tr');
                const index = parseInt(row.getAttribute('data-index'));
                billItemsData.splice(index, 1);
                renderBillItems();
                calculateTotals();
            });
        });
    }

    // Calculate totals
    function calculateTotals() {
        const subtotal = billItemsData.reduce((sum, item) => sum + (item.price * item.quantity), 0);
        const discount = billItemsData.reduce((sum, item) => sum + (item.price * item.quantity * item.discount / 100), 0);
        const tax = (subtotal - discount) * 0.08;
        const total = subtotal - discount + tax;

        document.getElementById('subtotalAmount').textContent = `LKR ${subtotal.toFixed(2)}`;
        document.getElementById('discountAmount').textContent = `LKR ${discount.toFixed(2)}`;
        document.getElementById('taxAmount').textContent = `LKR ${tax.toFixed(2)}`;
        document.getElementById('totalAmount').textContent = `LKR ${total.toFixed(2)}`;
    }

    // Save bill
    document.getElementById('saveBillBtn').addEventListener('click', function() {
        const customerName = document.getElementById('selectedCustomerName').textContent;
        const paymentMethod = document.getElementById('paymentMethod').value;

        if (!customerName || customerName === 'John Smith') {
            alert('Please select a customer');
            return;
        }

        if (!paymentMethod) {
            alert('Please select a payment method');
            return;
        }

        if (billItemsData.length === 0) {
            alert('Please add at least one item to the bill');
            return;
        }

        // In a real application, you would send this data to your backend
        const billData = {
            customer: {
                name: customerName,
                email: document.getElementById('selectedCustomerEmail').textContent,
                phone: document.getElementById('selectedCustomerPhone').textContent
            },
            paymentMethod: paymentMethod,
            notes: document.getElementById('billNotes').value,
            items: billItemsData,
            subtotal: parseFloat(document.getElementById('subtotalAmount').textContent.replace('LKR ', '')),
            discount: parseFloat(document.getElementById('discountAmount').textContent.replace('LKR ', '')),
            tax: parseFloat(document.getElementById('taxAmount').textContent.replace('LKR ', '')),
            total: parseFloat(document.getElementById('totalAmount').textContent.replace('LKR ', ''))
        };

        console.log('Bill data to be saved:', billData);
        alert('Bill saved successfully! In a real app, this would be sent to your backend.');
        // window.location.href = 'billing.jsp?billId=123'; // Redirect to view bill
    });

    // Preview bill
    document.getElementById('previewBillBtn').addEventListener('click', function() {
        if (billItemsData.length === 0) {
            alert('Please add at least one item to the bill');
            return;
        }

        // In a real application, you would open a preview window or modal
        alert('Bill preview would open here. In a real app, this would show a print-friendly version.');
    });
</script>
</body>
</html>