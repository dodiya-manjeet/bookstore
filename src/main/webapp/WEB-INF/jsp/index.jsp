<%@ include file="header.jsp" %>
        <div class="row">
            <div class="col-md-8 mx-auto text-center">
                <h1 class="mb-4">Welcome to Bookstore Management System</h1>
                
                <div class="row mt-5">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Authors</h5>
                                <h2 class="text-primary">${authorsCount}</h2>
                                <a href="/authors" class="btn btn-primary">Manage Authors</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Books</h5>
                                <h2 class="text-success">${booksCount}</h2>
                                <a href="/books" class="btn btn-success">Manage Books</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%@ include file="footer.jsp" %>