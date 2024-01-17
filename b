<h1>Shopping Cart</h1>

<div class="shopping-cart">

  <div class="column-labels">
    <label class="product-image">Image</label>
    <label class="product-details">Product</label>
    <label class="product-price">Price</label>
    <label class="product-quantity">Quantity</label>
    <label class="product-removal">Remove</label>
    <label class="product-line-price">Total</label>
  </div>

  <div class="product">
    <div class="product-image">
      <img src="https://s.cdpn.io/3/dingo-dog-bones.jpg">
    </div>
    <div class="product-details">
      <div class="product-title">Dingo Dog Bones</div>
      <p class="product-description">The best dog bones of all time. Holy crap. Your dog will be begging for these things! I got curious once and ate one myself. I'm a fan.</p>
    </div>
    <div class="product-price">12.99</div>
    <div class="product-quantity">
      <input type="number" value="2" min="1">
    </div>
    <div class="product-removal">
      <button class="remove-product">
        Remove
      </button>
    </div>
    <div class="product-line-price">25.98</div>
  </div>

  <div class="product">
    <div class="product-image">
      <img src="https://s.cdpn.io/3/large-NutroNaturalChoiceAdultLambMealandRiceDryDogFood.png">
    </div>
    <div class="product-details">
      <div class="product-title">Nutro™ Adult Lamb and Rice Dog Food</div>
      <p class="product-description">Who doesn't like lamb and rice? We've all hit the halal cart at 3am while quasi-blackout after a night of binge drinking in Manhattan. Now it's your dog's turn!</p>
    </div>
    <div class="product-price">45.99</div>
    <div class="product-quantity">
      <input type="number" value="1" min="1">
    </div>
    <div class="product-removal">
      <button class="remove-product">
        Remove
      </button>
    </div>
    <div class="product-line-price">45.99</div>
  </div>

  <div class="totals">
    <div class="totals-item">
      <label>Subtotal</label>
      <div class="totals-value" id="cart-subtotal">71.97</div>
    </div>
    <div class="totals-item">
      <label>Tax (5%)</label>
      <div class="totals-value" id="cart-tax">3.60</div>
    </div>
    <div class="totals-item">
      <label>Shipping</label>
      <div class="totals-value" id="cart-shipping">15.00</div>
    </div>
    <div class="totals-item totals-item-total">
      <label>Grand Total</label>
      <div class="totals-value" id="cart-total">90.57</div>
    </div>
  </div>
      
      <button class="checkout">Checkout</button>

</div>












/* Set rates + misc */
var taxRate = 0.05;
var shippingRate = 15.00; 
var fadeTime = 300;


/* Assign actions */
$('.product-quantity input').change( function() {
  updateQuantity(this);
});

$('.product-removal button').click( function() {
  removeItem(this);
});


/* Recalculate cart */
function recalculateCart()
{
  var subtotal = 0;
  
  /* Sum up row totals */
  $('.product').each(function () {
    subtotal += parseFloat($(this).children('.product-line-price').text());
  });
  
  /* Calculate totals */
  var tax = subtotal * taxRate;
  var shipping = (subtotal > 0 ? shippingRate : 0);
  var total = subtotal + tax + shipping;
  
  /* Update totals display */
  $('.totals-value').fadeOut(fadeTime, function() {
    $('#cart-subtotal').html(subtotal.toFixed(2));
    $('#cart-tax').html(tax.toFixed(2));
    $('#cart-shipping').html(shipping.toFixed(2));
    $('#cart-total').html(total.toFixed(2));
    if(total == 0){
      $('.checkout').fadeOut(fadeTime);
    }else{
      $('.checkout').fadeIn(fadeTime);
    }
    $('.totals-value').fadeIn(fadeTime);
  });
}


/* Update quantity */
function updateQuantity(quantityInput)
{
  /* Calculate line price */
  var productRow = $(quantityInput).parent().parent();
  var price = parseFloat(productRow.children('.product-price').text());
  var quantity = $(quantityInput).val();
  var linePrice = price * quantity;
  
  /* Update line price display and recalc cart totals */
  productRow.children('.product-line-price').each(function () {
    $(this).fadeOut(fadeTime, function() {
      $(this).text(linePrice.toFixed(2));
      recalculateCart();
      $(this).fadeIn(fadeTime);
    });
  });  
}


/* Remove item from cart */
function removeItem(removeButton)
{
  /* Remove row from DOM and recalc cart total */
  var productRow = $(removeButton).parent().parent();
  productRow.slideUp(fadeTime, function() {
    productRow.remove();
    recalculateCart();
  });
}














<div class="row">
  <div class="col-lg-7" style="border: 1px solid red;">
      <br>
      <h3 id="sop">&emsp;Shopping Cart</h3>
      <hr>
      <div class="row">
          <div class="col-lg-2">
              <span>
                  <img src="images/plum1.jpg" alt="" width="150px" height="150px"
                      style="border: 1px solid red;">
              </span>
          </div>
          <div class="col-lg">
              <p class="lead">Plum Saffron & Kumkumadi Oil Glow Bright Moisturizer <br> For Dull Skin With SPF
                  35 UVA & UVB
                  Protection
                  (50 g)</p>

              <p> MRP :₹ 198</p>
          </div>
          <div class="col-lg">
              <div class="product-quantity">
                  <input type="number" value="2" min="1">
              </div>
          </div>
      </div>
      <div class="row">

      </div>
  </div>

  <div class="col-lg-5" style="border: 1px solid blue;">
      <br>
      <h3 id="sop">&emsp;Summary</h3>
      <hr>

      <div class="product-line-price">198</div>

      <div class="totals">
          <div class="totals-item">
            <label>Subtotal</label>
            <div class="totals-value" id="cart-subtotal">71.97</div>
          </div>
          <div class="totals-item">
            <label>Tax (5%)</label>
            <div class="totals-value" id="cart-tax">3.60</div>
          </div>
          <div class="totals-item">
            <label>Shipping</label>
            <div class="totals-value" id="cart-shipping">15.00</div>
          </div>
          <div class="totals-item totals-item-total">
            <label>Grand Total</label>
            <div class="totals-value" id="cart-total">90.57</div>
          </div>
        </div>
       


  </div>
  
</div>




<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>payiment</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>zxcompany</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="css/mainpage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/shopping.css">
    <link rel="stylesheet" href="css/med.css">
    <link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="css/categoreis.css">
    <link rel="stylesheet" href="css/ctgmed.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
</head>

<body class="bdy">
    <nav class="navbar navbar-expand-lg navbar-light p-2 nv-clr med-nev">
        <nav class="navbar navbar-lightnv-clr ">
            <a class="navbar-brand" href="#">
                <img src="assets/logo.png" width="30" height="30" alt="">
            </a>
        </nav>

        <button class="navbar-toggler med-bt-1" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
            aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse float-left d-flex med-ul" id="navbarTogglerDemo01">
            <ul class="navbar-nav  mr-5 ml-auto ">
                <li class="nav-item pr-5 font-weight-bold">
                    <a class="nav-link text-white" href="#">home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item pr-5 font-weight-bold">
                    <a class="nav-link text-white " href="#">about <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item pr-5 font-weight-bold">
                    <a class="nav-link text-white" href="#">shop</a>
                </li>
                <li class="nav-item pr-5 font-weight-bold">
                    <a class="nav-link text-white">help</a>
                </li>
            </ul>

        </div>
        <div> <button class=" nv-btn-1 btn btn-primary my-2 my-sm-0 pr-5 mr-5 d-flex d-inline " type="submit"><img
                    class=" img-btn-icn mr-3" src="image/troly-icone.png" alt="">your cart</button></div>

    </nav>
    </nav>
    <section class="bg-colo-4">
        <div class="-alig p-5 ">
            <div class="sc-main p-4">
                <div><button class=" shop-btn text-muted hov-btn" onclick="location.href='shopingcart.html'">1.shopping card</button></div>
                <div><button class=" shop-btn hov-btn text-muted" onclick="location.href='shipping.html'">2.shipping details</button></div>
                <div><button class=" shop-btn  hov-btn" onclick="location.href='payiment.html'">3.payment options</button></div>
            </div>
        </div>
        <div>

        </div>
    </section>
    <section class="container-fluid bg-colo-shp" id="account-details">
        <div class="align-ct p-5 ">
            <div>
                <h2 class="ml-3">
                    shopping card
                    <hr class="hr-2">

                </h2>
            </div>
            <div>
                <h2 class="  m-lf">
                    summary
                    <hr class="hr-3">
                </h2>
            </div>
        </div>
        <div class="p-5  alig-top-2">
            <div class="row">
                <div class="col-8">
                    <div>
                        <div class="container mt-5">
                           
                            <form>
                                <div class="pymt">
                                    <div class="mb-1">
                                        <label for="card-number" class="form-label">Card Number</label>
                                        <input type="text" class="form-control w-100" id="card-number"
                                            placeholder="Card Number" required>
                                    </div>
                                    <div class="w-auto">
                                        <label for="expiry-date" class="form-label">Expiry Date</label>
                                        <input type="text" class="form-control " id="expiry-date" placeholder="MM/YY"
                                            required>
                                    </div>
                                    <div class="">
                                        <label for="cvv" class="form-label ">CVV</label>
                                        <input type="text" class="form-control w-50" id="cvv" placeholder="CVV"
                                            required>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="card-holder" class="form-label ">Card Holder Name</label>
                                    <input type="text" class="form-control siz-inp" id="card-holder"
                                        placeholder="Card Holder Name" required>
                                </div>

                            </form>
                        </div>
                        <div class="card siz-pyp  ">
                            <div class="card-body">
                                <div class="pypl">
                                    <div><input type="radio"></div>
                                    <div>
                                        <h5>paypal</h5>
                                        <p>Western wear typically incorporates one Western wear typically <br>
                                            incorporates one

                                            Western wear typically incorporates one Western wear</p>
                                    </div>
                                    <div>
                                        <img src="assets/paypal.png" class="pypimg" >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4 mt-5">
                    <div>
                        <div class="card card-2 crd-wdth">
                            <div class="card-body bg-primarwhite">
                                <div class="align-5">
                                    <div class="w-25"><img src="assets/laptop.jpg" alt="" class="w-100  "></div>
                                    <div>
                                        <h5>DELL INSPIRON</h5>
                                        <h5>$68,999</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-2 crd-wdth">
                            <div class="card-body bg-white">
                                <div class="align-5">
                                    <div class="w-25"><img src="assets/watch.jpg" alt="" class="w-100  "></div>
                                    <div>
                                        <h5>Noise Pulsefit</h5>
                                        <h5>$1899</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="hr-3">
                        <h5 class="ml-3">have a voucher?</h5>
                        <hr class="hr-3">
                        <div class="alin-lf-1 align-1">
                            <div>
                                <p>SUBTOTAL</p>
                            </div>
                            <div>
                                <p>$70,898</p>
                            </div>
                        </div>
                        <div class=" alin-lf-1 align-2">
                            <div>
                                <p>shipping</p>
                            </div>
                            <div>
                                <p>free</p>
                            </div>
                        </div>
                        <div class="  alin-lf-1 align-3">
                            <div>
                                <p>GST%</p>
                            </div>
                            <div>
                                <p>$112</p>
                            </div>
                        </div>
                        <hr class="hr-3">
                        <div class="alin-lf-1 align-4">
                            <div>
                                <p class="txt-p">total</p>
                            </div>
                            <div>
                                <p class="txt-p">$71,010</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class=" p-4 bg-colo-shp pyp-btn">
            <span class="p-5">
                <button class="btn btn-primary width p-3">next</button>
            </span>
            <span>
                <button class="btn btn-secondary width p-3">cancel</button>
            </span>
        </div>
    </section>
    <footer>
        <div class=" container-fluid sec-foot-mn">
            <div class="sec-foot-1 pt-4">
                <div class="">
                    <ul class="sec-fm-ul">
                        <li class="lin-ht"><a class="nav-link text-white" href="#">home</a></li class="lin-ht">
                        <li class="lin-ht"><a class="nav-link text-white" href="#">about</a></li class="lin-ht">
                        <li class="lin-ht"><a class="nav-link text-white" href="#">shop</a></li class="lin-ht">
                        <li class="lin-ht"><a class="nav-link text-white" href="#">help</a></li class="lin-ht">
                    </ul>
                </div>
            </div>
            <div class="ft-mn-2">
                <div><img src="assets/logo.png" alt="" class="ft-img-sc-2"></div>
                <div>
                    <h2 class="mt-1">ECOLUS</h2>
                </div>
            </div>
        </div>
    </footer>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="test.js"></script>

</html>




<section class="container-fluid bg-colo-shp" id="account-details">
  <div class="align-ct p-5 ">
      <div>
          <h2 class="ml-3">
              shopping card
              <hr class="hr-2">

          </h2>
      </div>
      <div>
          <h2 class="  m-lf">
              summary
              <hr class="hr-3">
          </h2>
      </div>
  </div>
  <div class="p-5  alig-top-2">
      <div class="row">
          <div class="col-8">
              <div>
                  <div class="container mt-5">
                     
                      <form>
                          <div class="pymt">
                              <div class="mb-1">
                                  <label for="card-number" class="form-label">Card Number</label>
                                  <input type="text" class="form-control w-100" id="card-number"
                                      placeholder="Card Number" required>
                              </div>
                              <div class="w-auto">
                                  <label for="expiry-date" class="form-label">Expiry Date</label>
                                  <input type="text" class="form-control " id="expiry-date" placeholder="MM/YY"
                                      required>
                              </div>
                              <div class="">
                                  <label for="cvv" class="form-label ">CVV</label>
                                  <input type="text" class="form-control w-50" id="cvv" placeholder="CVV"
                                      required>
                              </div>
                          </div>

                          <div class="mb-3">
                              <label for="card-holder" class="form-label ">Card Holder Name</label>
                              <input type="text" class="form-control siz-inp" id="card-holder"
                                  placeholder="Card Holder Name" required>
                          </div>

                      </form>
                  </div>
                  <div class="card siz-pyp  ">
                      <div class="card-body">
                          <div class="pypl">
                              <div><input type="radio"></div>
                              <div>
                                  <h5>paypal</h5>
                                  <p>Western wear typically incorporates one Western wear typically <br>
                                      incorporates one

                                      Western wear typically incorporates one Western wear</p>
                              </div>
                              <div>
                                  <img src="assets/paypal.png" class="pypimg" >
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <div class="col-4 mt-5">
              <div>
                  <div class="card card-2 crd-wdth">
                      <div class="card-body bg-primarwhite">
                          <div class="align-5">
                              <div class="w-25"><img src="assets/laptop.jpg" alt="" class="w-100  "></div>
                              <div>
                                  <h5>DELL INSPIRON</h5>
                                  <h5>$68,999</h5>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="card card-2 crd-wdth">
                      <div class="card-body bg-white">
                          <div class="align-5">
                              <div class="w-25"><img src="assets/watch.jpg" alt="" class="w-100  "></div>
                              <div>
                                  <h5>Noise Pulsefit</h5>
                                  <h5>$1899</h5>
                              </div>
                          </div>
                      </div>
                  </div>
                  <hr class="hr-3">
                  <h5 class="ml-3">have a voucher?</h5>
                  <hr class="hr-3">
                  <div class="alin-lf-1 align-1">
                      <div>
                          <p>SUBTOTAL</p>
                      </div>
                      <div>
                          <p>$70,898</p>
                      </div>
                  </div>
                  <div class=" alin-lf-1 align-2">
                      <div>
                          <p>shipping</p>
                      </div>
                      <div>
                          <p>free</p>
                      </div>
                  </div>
                  <div class="  alin-lf-1 align-3">
                      <div>
                          <p>GST%</p>
                      </div>
                      <div>
                          <p>$112</p>
                      </div>
                  </div>
                  <hr class="hr-3">
                  <div class="alin-lf-1 align-4">
                      <div>
                          <p class="txt-p">total</p>
                      </div>
                      <div>
                          <p class="txt-p">$71,010</p>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
</section>