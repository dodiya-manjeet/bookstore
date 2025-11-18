<%@ include file="../header.jsp" %>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title mb-0">Add New Book</h4>
                    </div>
                    <div class="card-body">
                        <form method="post">
                            <div class="mb-3">
                                <label for="title" class="form-label">Book Title *</label>
                                <input type="text" class="form-control" id="title" name="title" required 
                                       placeholder="Enter book title">
                            </div>
                            <div class="mb-3">
                                <label for="isbn" class="form-label">ISBN *</label>
                                <input type="text" class="form-control" id="isbn" name="isbn" required 
                                       placeholder="Enter ISBN number">
                            </div>
                            <div class="mb-3">
                                <label for="genre" class="form-label">Genre</label>
                                <select class="form-select" id="genre" name="genre">
                                    <option value="">Select Genre</option>
                                    <option value="Fantasy">Fantasy</option>
                                    <option value="Science Fiction">Science Fiction</option>
                                    <option value="Mystery">Mystery</option>
                                    <option value="Thriller">Thriller</option>
                                    <option value="Romance">Romance</option>
                                    <option value="Horror">Horror</option>
                                    <option value="Historical">Historical</option>
                                    <option value="Biography">Biography</option>
                                    <option value="Fiction">Fiction</option>
                                    <option value="Non-Fiction">Non-Fiction</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Price *</label>
                                <input type="number" class="form-control" id="price" name="price" 
                                       step="0.01" min="0" required placeholder="Enter price">
                            </div>
                            <div class="mb-3">
                                <label for="authorId" class="form-label">Author *</label>
                                <select class="form-select" id="authorId" name="authorId" required>
                                    <option value="">Select Author</option>
                                    <c:forEach var="author" items="${authors}">
                                        <option value="${author.id}">${author.name} (${author.country})</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <a href="/books" class="btn btn-secondary me-md-2">Cancel</a>
                                <button type="submit" class="btn btn-primary">Add Book</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
<%@ include file="../footer.jsp" %>