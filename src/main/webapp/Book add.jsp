<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book - PahanEdu Bookshop</title>
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
        #bookCoverPreview {
            transition: all 0.3s ease;
        }
    </style>
</head>
<body class="min-h-screen bg-gray-50">
<!-- Header/Navigation would go here -->

<div class="container mx-auto px-4 py-8">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold text-gray-800">
            <a href="Book.jsp" class="text-indigo-600 hover:text-indigo-800">
                <i class="fas fa-arrow-left mr-2"></i>
            </a>
            Add New Book
        </h1>
    </div>

    <div class="form-card bg-white rounded-lg p-6">
        <form action="AddBookServlet" method="post" enctype="multipart/form-data" class="space-y-6">
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
                <!-- Basic Information Section -->
                <div class="md:col-span-2">
                    <h3 class="text-lg font-medium text-gray-900 border-b pb-2 mb-4">
                        <i class="fas fa-book mr-2 text-indigo-600"></i>
                        Basic Information
                    </h3>
                </div>

                <div class="md:col-span-2">
                    <label for="title" class="block text-sm font-medium text-gray-700 mb-1">Title *</label>
                    <input type="text" id="title" name="title" required
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="author" class="block text-sm font-medium text-gray-700 mb-1">Author *</label>
                    <input type="text" id="author" name="author" required
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="isbn" class="block text-sm font-medium text-gray-700 mb-1">ISBN *</label>
                    <input type="text" id="isbn" name="isbn" required
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="publisher" class="block text-sm font-medium text-gray-700 mb-1">Publisher</label>
                    <input type="text" id="publisher" name="publisher"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="publicationDate" class="block text-sm font-medium text-gray-700 mb-1">Publication Date</label>
                    <input type="date" id="publicationDate" name="publicationDate"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <!-- Book Details Section -->
                <div class="md:col-span-2 mt-6">
                    <h3 class="text-lg font-medium text-gray-900 border-b pb-2 mb-4">
                        <i class="fas fa-info-circle mr-2 text-indigo-600"></i>
                        Book Details
                    </h3>
                </div>

                <div>
                    <label for="category" class="block text-sm font-medium text-gray-700 mb-1">Category *</label>
                    <select id="category" name="category" required
                            class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                        <option value="">Select Category</option>
                        <option value="fiction">Fiction</option>
                        <option value="non-fiction">Non-Fiction</option>
                        <option value="science">Science</option>
                        <option value="technology">Technology</option>
                        <option value="biography">Biography</option>
                        <option value="history">History</option>
                        <option value="children">Children's Books</option>
                        <option value="textbook">Textbook</option>
                        <option value="reference">Reference</option>
                    </select>
                </div>

                <div>
                    <label for="language" class="block text-sm font-medium text-gray-700 mb-1">Language</label>
                    <select id="language" name="language"
                            class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                        <option value="english">English</option>
                        <option value="spanish">Spanish</option>
                        <option value="french">French</option>
                        <option value="german">German</option>
                        <option value="other">Other</option>
                    </select>
                </div>

                <div>
                    <label for="pages" class="block text-sm font-medium text-gray-700 mb-1">Number of Pages</label>
                    <input type="number" id="pages" name="pages" min="1"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="format" class="block text-sm font-medium text-gray-700 mb-1">Format</label>
                    <select id="format" name="format"
                            class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                        <option value="paperback">Paperback</option>
                        <option value="hardcover">Hardcover</option>
                        <option value="ebook">E-book</option>
                        <option value="audiobook">Audiobook</option>
                    </select>
                </div>

                <!-- Pricing & Inventory Section -->
                <div class="md:col-span-2 mt-6">
                    <h3 class="text-lg font-medium text-gray-900 border-b pb-2 mb-4">
                        <i class="fas fa-tag mr-2 text-indigo-600"></i>
                        Pricing & Inventory
                    </h3>
                </div>

                <div>
                    <label for="price" class="block text-sm font-medium text-gray-700 mb-1">Price *</label>
                    <div class="relative rounded-md shadow-sm">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <span class="text-gray-500">$</span>
                        </div>
                        <input type="number" id="price" name="price" min="0" step="0.01" required
                               class="input-highlight block w-full pl-7 pr-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                    </div>
                </div>

                <div>
                    <label for="discount" class="block text-sm font-medium text-gray-700 mb-1">Discount (%)</label>
                    <input type="number" id="discount" name="discount" min="0" max="100"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="quantity" class="block text-sm font-medium text-gray-700 mb-1">Quantity in Stock *</label>
                    <input type="number" id="quantity" name="quantity" min="0" required
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <div>
                    <label for="threshold" class="block text-sm font-medium text-gray-700 mb-1">Low Stock Threshold</label>
                    <input type="number" id="threshold" name="threshold" min="1"
                           class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <!-- Book Cover Section -->
                <div class="md:col-span-2 mt-6">
                    <h3 class="text-lg font-medium text-gray-900 border-b pb-2 mb-4">
                        <i class="fas fa-image mr-2 text-indigo-600"></i>
                        Book Cover
                    </h3>
                </div>

                <div class="md:col-span-2 flex flex-col md:flex-row items-start md:items-center gap-6">
                    <div class="w-full md:w-1/3">
                        <div id="bookCoverPreview" class="w-full h-48 bg-gray-100 rounded-md flex items-center justify-center overflow-hidden">
                            <span class="text-gray-400">No cover image</span>
                        </div>
                    </div>
                    <div class="w-full md:w-2/3">
                        <label for="coverImage" class="block text-sm font-medium text-gray-700 mb-2">Upload Cover Image</label>
                        <input type="file" id="coverImage" name="coverImage" accept="image/*"
                               class="block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100">
                        <p class="mt-1 text-xs text-gray-500">JPG, PNG or GIF (Max 2MB)</p>
                    </div>
                </div>

                <!-- Description Section -->
                <div class="md:col-span-2 mt-6">
                    <h3 class="text-lg font-medium text-gray-900 border-b pb-2 mb-4">
                        <i class="fas fa-align-left mr-2 text-indigo-600"></i>
                        Description
                    </h3>
                </div>

                <div class="md:col-span-2">
                    <label for="description" class="block text-sm font-medium text-gray-700 mb-1">Synopsis *</label>
                    <textarea id="description" name="description" rows="4" required
                              class="input-highlight w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"></textarea>
                </div>
            </div>

            <div class="flex justify-end space-x-3 pt-6 border-t border-gray-200">
                <button type="button" onclick="window.location.href='books.jsp'"
                        class="px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Cancel
                </button>
                <button type="submit"
                        class="px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Save Book
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    // Preview cover image when selected
    document.getElementById('coverImage').addEventListener('change', function(e) {
        const preview = document.getElementById('bookCoverPreview');
        const file = e.target.files[0];

        if (file) {
            const reader = new FileReader();

            reader.onload = function(e) {
                preview.innerHTML = `<img src="${e.target.result}" class="w-full h-full object-contain" alt="Book cover preview">`;
            }

            reader.readAsDataURL(file);
        } else {
            preview.innerHTML = '<span class="text-gray-400">No cover image</span>';
        }
    });

    // Form validation
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.querySelector('form');

        form.addEventListener('submit', function(e) {
            const isbn = document.getElementById('isbn').value;
            const price = document.getElementById('price').value;

            // Simple ISBN validation (10 or 13 digits)
            if (isbn && !/^(?:\d{10}|\d{13})$/.test(isbn.replace(/[-\s]/g, ''))) {
                alert('Please enter a valid ISBN (10 or 13 digits)');
                e.preventDefault();
                return;
            }

            // Price validation
            if (price && parseFloat(price) <= 0) {
                alert('Price must be greater than 0');
                e.preventDefault();
                return;
            }
        });
    });
</script>
</body>
</html>