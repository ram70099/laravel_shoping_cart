<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>- EShopper</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/style.min.css" rel="stylesheet">
</head>
<body>
    @include('Header.TopBar')
    @include('Header.Header')

    <!-- Shop Detail Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">
                        <div class="carousel-item active">
                            <img class="w-100 h-100" src="{{ asset($product->pimage) }}" alt="Image">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
                <h3 class="font-weight-semi-bold">{{ $product->pname }}</h3>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                        {!! str_repeat('<small class="fas fa-star"></small>', $product->rating) !!}
                        {!! str_repeat('<small class="far fa-star"></small>', 5 - $product->rating) !!}
                    </div>
                    <small class="pt-1">({{ $product->reviews_count }} Reviews)</small>
                </div>
                <h3 class="font-weight-semi-bold mb-4">${{ number_format($product->price, 2) }}</h3>
                <p class="mb-4">{{ $product->pdescription }}</p>
                <div class="d-flex mb-3">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
                    <form>
                        <!-- Size options should go here if available in the database -->
                    </form>
                </div>
                <div class="d-flex mb-4">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Stock:{{$product->pstock}}</p>
                    <form>
                        <!-- Color options should go here if available in the database -->
                    </form>
                </div>
                <div class="d-flex align-items-center mb-4 pt-2">
    <div class="input-group quantity mr-3" style="width: 130px;">
        <div class="input-group-btn">
            <button class="btn btn-primary btn-minus">
                <i class="fa fa-minus"></i>
            </button>
        </div>
        <input type="text" id="quantity" class="form-control bg-secondary text-center" value="1">
        <div class="input-group-btn">
            <button class="btn btn-primary btn-plus">
                <i class="fa fa-plus"></i>
            </button>
        </div>
    </div>

    <!-- Add to Cart -->
    <form action="{{ route('cart.add') }}" method="POST">
        @csrf
        <input type="hidden" name="product_id" value="{{ $product->id }}">
        <input type="hidden" name="quantity" id="cartQuantityInput" value="1">
        <button type="submit" class="btn btn-primary px-3" id="addToCartButton">
            <i class="fa fa-shopping-cart mr-1"></i>Add To Cart
        </button>
    </form>

    <form action="{{ route('product.buy') }}" method="POST" class="ml-2">
        @csrf
        <input type="hidden" name="product_id" value="{{ $product->id }}">
        <input type="hidden" name="quantity" id="buyQuantityInput" value="1">
        <button type="submit" class="btn btn-primary px-3">
            <i class="fas fa-credit-card mr-1"></i> Buy Now
        </button>
    </form>
</div>

                <div class="d-flex pt-2">
                    <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                    <div class="d-inline-flex">
                        <a class="text-dark px-2" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="text-dark px-2" href=""><i class="fab fa-twitter"></i></a>
                        <a class="text-dark px-2" href=""><i class="fab fa-linkedin-in"></i></a>
                        <a class="text-dark px-2" href=""><i class="fab fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('Footer.Footer')

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>

    <script>
    $(document).ready(function() {
        // Increase and Decrease Quantity
        $(".btn-plus").click(function() {
            var currentValue = parseInt($("#quantity").val(), 10); 
            if (!isNaN(currentValue) && currentValue < {{$product->pstock}}) {
                var newValue = currentValue + 1;
                $("#quantity").val(newValue); 
                $("#cartQuantityInput").val(newValue);
                $("#buyQuantityInput").val(newValue);
            }
        });

        $(".btn-minus").click(function() {
            var currentValue = parseInt($("#quantity").val(), 10); 
            if (!isNaN(currentValue) && currentValue > 1) {
                var newValue = currentValue - 1;
                $("#quantity").val(newValue); 
                $("#cartQuantityInput").val(newValue); 
                $("#buyQuantityInput").val(newValue); 
            }
        });
    });
</script>

</body>
</html>
