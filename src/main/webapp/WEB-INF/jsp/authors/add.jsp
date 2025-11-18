<%@ include file="../header.jsp" %>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title mb-0">Add New Author</h4>
                    </div>
                    <div class="card-body">
                        <form method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Author Name *</label>
                                <input type="text" class="form-control" id="name" name="name" required 
                                       placeholder="Enter author's full name">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address *</label>
                                <input type="email" class="form-control" id="email" name="email" required 
                                       placeholder="Enter author's email address">
                            </div>
                            <div class="mb-3">
                                <label for="country" class="form-label">Country</label>
                                <input type="text" class="form-control" id="country" name="country" 
                                       placeholder="Enter author's country">
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <a href="/authors" class="btn btn-secondary me-md-2">Cancel</a>
                                <button type="submit" class="btn btn-primary">Add Author</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
<%@ include file="../footer.jsp" %>