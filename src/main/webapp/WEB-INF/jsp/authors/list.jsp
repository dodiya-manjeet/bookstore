<%@ include file="../header.jsp" %>
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Authors Management</h2>
            <a href="/authors/add" class="btn btn-primary">Add New Author</a>
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
            <c:when test="${not empty authors && authors.size() > 0}">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Country</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="author" items="${authors}">
                                <tr>
                                    <td>${author.id}</td>
                                    <td>${author.name}</td>
                                    <td>${author.email}</td>
                                    <td>${author.country}</td>
                                    <td>
                                        <a href="/authors/edit/${author.id}" class="btn btn-warning btn-sm">Edit</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info text-center">
                    <h4>No Authors Found</h4>
                    <p>Start by adding your first author to the system.</p>
                    <a href="/authors/add" class="btn btn-primary">Add First Author</a>
                </div>
            </c:otherwise>
        </c:choose>
<%@ include file="../footer.jsp" %>