<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    
    <style>
    html *{
    -webkit-font-smoothing: antialiased;
}

h3{
    font-weight: 300!important;
    font-size: 25px !important;
}

h4{
    font-size: 18px !important;
    font-weight: 300 !important;
}


footer{
    margin-top:100px;
    color: #555;
    background: #fff;
    padding: 25px;
    font-weight: 300;
    
}

.card.card-carousel {
    border: 0;
    margin-bottom: 30px;
    margin-top: 30px;
    border-radius: 6px ;
    color: rgba(0,0,0,.87);
    background: #fff;
    width: 100%;
    box-shadow: 0 2px 2px 0 rgba(0,0,0,.14), 0 3px 1px -2px rgba(0,0,0,.2), 0 1px 5px 0 rgba(0,0,0,.12);
}

.card.card-carousel img{
    border-radius: 6px;
}



.carousel-indicators {
    position: absolute;
    right: 0;
    bottom: 10px;
    left: 0;
    z-index: 15;
    display: flex;
    justify-content: center;
    padding-left: 0;
    margin-right: 15%;
    margin-left: 15%;
    list-style: none;
}

.carousel .carousel-indicators {
    bottom: 5px;
}

.carousel .carousel-indicators li {
    display: inline-block;
    width: 10px;
    height: 10px;
    text-indent: -999px;
    cursor: pointer;
    border: 1px solid #fff;
    border-radius: 10px;
    background: #fff;
    box-shadow: 0 2px 2px 0 rgba(0,0,0,.14), 0 3px 1px -2px rgba(0,0,0,.12), 0 1px 5px 0 rgba(0,0,0,.2);
    border-radius: 2px;
}

.carousel .carousel-indicators .active{
    margin: 11px 10px; 
} 

.carousel .carousel-indicators li {
    margin: 11px 10px;
}

.carousel .carousel-indicators .active {
    margin-top: 10px;
    transform: scale(1.5);
    box-shadow: 0 4px 5px 0 rgba(0,0,0,.14), 0 1px 10px 0 rgba(0,0,0,.12), 0 2px 4px -1px rgba(0,0,0,.2);
}

.carousel-inner {
    position: relative;
    width: 100%;
    overflow: hidden;
}

.carousel-item {
    position: relative;
    display: none;
    align-items: center;
    width: 100% !important;
    transition: transform .6s ease;
    backface-visibility: hidden;
    perspective: 1000px;
}

.carousel-item.active {
    display: block;
}

.carousel .carousel-caption {
    padding-bottom: 45px;
}

.carousel .carousel-caption .material-icons {
    position: relative;
    top: 5px;
}

.carousel .carousel-control-next .material-icons{
    z-index: 5;
    display: inline-block;
    font-size: 50px;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    height: 50px;
    margin: auto;
}

.carousel .carousel-control-prev .material-icons {
    z-index: 5;
    display: inline-block;
    font-size: 50px;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    height: 50px;
    margin: auto;
}
.footer p{
    margin-bottom: 0;
}
footer p a{
    color: #555;
    font-weight: 400;
}

footer p a:hover{
    color: #9f26aa;
    text-decoration: none;
}
    
    </style>
</head>

<body>
    <div class="container">
        <div class="title">
            <h3 class="mt-5">Carousel</h3>
        </div>
        
        <div class="section" id="carousel">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mr-auto ml-auto">

                    <!-- Carousel Card -->
                    <div class="card card-raised card-carousel">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
                          <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
                          </ol>
                          <div class="carousel-inner">
                            <div class="carousel-item active">
                              <img class="d-block w-100" src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg.jpg"
                              alt="First slide">
                              <div class="carousel-caption d-none d-md-block">
                                <h4>
                                    <i class="material-icons">location_on</i>
                                    Yellowstone National Park, United States
                                </h4>
                              </div>
                            </div>
                            <div class="carousel-item">
                              <img class="d-block w-100" src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg2.jpg"  alt="Second slide">
                              <div class="carousel-caption d-none d-md-block">
                                <h4>
                                    <i class="material-icons">location_on</i>
                                    Somewhere Beyond, United States
                                </h4>
                              </div>
                            </div>
                            <div class="carousel-item">
                              <img class="d-block w-100" src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg3.jpg" alt="Third slide">
                              <div class="carousel-caption d-none d-md-block">
                                <h4>
                                    <i class="material-icons">location_on</i>
                                    Yellowstone National Park, United States
                                </h4>
                              </div>
                            </div>
                          </div>
                          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <i class="material-icons">keyboard_arrow_left</i>
                            <span class="sr-only">Previous</span>
                          </a>
                          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <i class="material-icons">keyboard_arrow_right</i>
                            <span class="sr-only">Next</span>
                          </a>
                        </div>
                    </div>
                    <!-- End Carousel Card -->

                </div>
            </div>
        </div>
    </div>
    </div>
    
    
    
     <footer class="footer text-center ">
        <p>Made with <a href="https://demos.creative-tim.com/material-kit/index.html" target="_blank">Material Kit</a> by Creative Tim</p>
    </footer>
    
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>

</body>