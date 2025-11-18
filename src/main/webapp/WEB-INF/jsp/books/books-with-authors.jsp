<%@ include file="../header.jsp" %>
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Books with Authors (Inner Join Query)</h2>
            <a href="/books" class="btn btn-outline-primary">Back to Books</a>
        </div>
        
        <div class="alert alert-info">
            <strong>Custom Query:</strong> This page demonstrates a custom inner join query between Books and Authors tables.
        </div>
        
        <c:choose>
            <c:when test="${not empty booksWithAuthors && booksWithAuthors.size() > 0}">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Book ID</th>
                                <th>Book Title</th>
                                <th>ISBN</th>
                                <th>Genre</th>
                                <th>Price</th>
                                <th>Author ID</th>
                                <th>Author Name</th>
                                <th>Author Email</th>
                                <th>Country</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="result" items="${booksWithAuthors}">
                                <tr>
                                    <td>${result[0].id}</td>
                                    <td><strong>${result[0].title}</strong></td>
                                    <td><code>${result[0].isbn}</code></td>
                                    <td>
                                        <span class="badge bg-info">${result[0].genre}</span>
                                    </td>
                                    <td>
                                        <span class="badge bg-success">$${result[0].price}</span>
                                    </td>
                                    <td>${result[1].id}</td>
                                    <td>${result[1].name}</td>
                                    <td>${result[1].email}</td>
                                    <td>${result[1].country}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <div class="card mt-4">
                    <div class="card-body">
                        <h5 class="card-title">Query Information</h5>
                        <p class="card-text">
                            <strong>SQL Equivalent:</strong><br>
                            <code>SELECT b.*, a.* FROM books b INNER JOIN authors a ON b.author_id = a.id</code>
                        </p>
                        <p class="card-text">
                            <strong>JPA Query:</strong><br>
                            <code>@Query("SELECT b, a FROM Book b JOIN b.author a")</code>
                        </p>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-warning text-center">
                    <h4>No Data Found</h4>
                    <p>No books with author information available.</p>
                    <a href="/books/add" class="btn btn-primary">Add Books First</a>
                </div>
            </c:otherwise>
        </c:choose>
<%@ include file="../footer.jsp" %>