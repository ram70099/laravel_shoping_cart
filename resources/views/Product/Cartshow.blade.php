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
            <h4 class="text-center mb-4">Your Cart</h4>
        </div>

        @forelse ($products as $product)
            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="{{ asset($product->pimage) }}" alt="{{ $product->pname }}">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">{{ $product->pname }}</h6>
                        <div class="d-flex justify-content-center">
                            <h6>${{ $product->price }}</h6>
                            @if ($product->ordered)
                                <h6 class="text-muted ml-2"><n>Ordered:{{ $product->ordered }}</n></h6>
                            @endif
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="{{ route('product.detail', ['id' => $product->id]) }}" class="btn btn-sm text-dark p-0">
                            <i class="fas fa-eye text-primary mr-1"></i>View Detail
                        </a>
                        <form action="{{ route('cart.remove') }}" method="POST">
                            @csrf
                            <input type="hidden" name="product_id" value="{{ $product->id }}">
                            <button type="submit" class="btn btn-sm text-dark p-0">
                                <i class="fas fa-trash-alt text-danger mr-1"></i>Remove
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        @empty
            <div class="col-12 text-center">
                <p>Your cart is empty.</p>
            </div>
        @endforelse
    </div>
</div>
