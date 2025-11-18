<%@ include file="../header.jsp" %>
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Books Management</h2>
            <a href="/books/add" class="btn btn-primary">Add New Book</a>
        </div>
        
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success alert-dismissible fade show">
                ${successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show">
                ${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>
        
        <c:choose>
            <c:when test="${not empty books && books.size() > 0}">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>ISBN</th>
                                <th>Genre</th>
                                <th>Price</th>
                                <th>Author</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="book" items="${books}">
                                <tr>
                                    <td>${book.id}</td>
                                    <td><strong>${book.title}</strong></td>
                                    <td><code>${book.isbn}</code></td>
                                    <td>
                                        <span class="badge bg-info">${book.genre}</span>
                                    </td>
                                    <td>
                                        <span class="badge bg-success">$${book.price}</span>
                                    </td>
                                    <td>${book.author.name}</td>
                                    <td>
                                        <a href="/books/edit/${book.id}" class="btn btn-warning btn-sm">Edit</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info text-center">
                    <h4>No Books Found</h4>
                    <p>Start by adding your first book to the system.</p>
                    <a href="/books/add" class="btn btn-primary">Add First Book</a>
                </div>
            </c:otherwise>
        </c:choose>
<%@ include file="../footer.jsp" %>