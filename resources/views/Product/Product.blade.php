<style>
    .product-img img {
        width: 100%;
        height: 300px;
        /* Set a fixed height */
        object-fit: cover;
        /* Ensures the image is cropped to fit the container while maintaining aspect ratio */
    }
</style>

<div class="col-lg-9 col-md-12">
    <div class="row pb-3">
        <div class="col-12 pb-1">
            <div class="d-flex align-items-center justify-content-between mb-4">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search by name">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
                <div class="dropdown ml-4">
                    <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        Sort by
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                        <a class="dropdown-item" href="#">Latest</a>
                        <a class="dropdown-item" href="#">Popularity</a>
                        <a class="dropdown-item" href="#">Best Rating</a>
                    </div>
                </div>
            </div>
        </div>

        @foreach ($products as $product)
            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <a href="{{ route('product.detail', ['id' => $product->id]) }}"><img class="img-fluid w-100"
                            src="{{ asset($product->pimage) }}" alt="{{ $product->pname }}"></a>
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">{{ $product->pname }}</h6>
                        <div class="d-flex justify-content-center">
                            <h6>${{ $product->price }}</h6>
                            @if ($product->pstock)
                                <h6 class="text-muted ml-2"><del>{{ $product->pstock }}</del></h6>
                            @endif
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">


                        <form action="{{ route('cart.add') }}" method="POST" class="mr-2">
                            @csrf
                            <input type="hidden" name="product_id" value="{{ $product->id }}">
                            <button type="submit" class="btn btn-sm text-dark p-0">
                                <i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart
                            </button>
                        </form>
                        <form action="{{ route('product.buy') }}" method="POST">
                            @csrf
                            <input type="hidden" name="product_id" value="{{ $product->id }}">
                            <button type="submit" class="btn btn-sm btn-primary">
                                <i class="fas fa-credit-card text-light mr-1"></i>Buy Now
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>