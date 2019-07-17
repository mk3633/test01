// JavaScript Document
$(document).ready(function(){
  $(".gnb>ul>li>a").on("mouseenter",function(){
    //$(this).parent().children(".submenu").show();
    $(this).parent().children(".submenu").show();
  });
  $(".submenu").on("mouseenter",function(){
    $(this).show();
  });
  $(".submenu").on("mouseleave",function(){
    $(this).hide();
  });
  $(".gnb>ul>li>a").on("mouseleave",function(){
    $(".submenu").hide();
  });

  //main-tab
  $(".today-btn-date .btn>li>a").on("mouseenter",function(){
    $(this).parent().children("a").addClass("active");
    //$(".date>ul>li>a").addClass("on");
  $(this).on("mouseleave",function(){
    $(this).parent().children("a").removeClass("active");
    return false;
  });
});

var i=0;

$(".pink").on("click",function(){
  i=1;
  if(i==1){
    $(".date ul li a").on("mouseenter",function(){
      $(this).removeClass("on2");
      $(this).removeClass("on3");
      $(this).addClass("on");
    });
    $(".date ul li a").on("mouseleave",function(){
      $(this).removeClass("on");
    });
  }else{
    i=0;
  }
});
$(".green").on("click",function(){
  i=2;
  if(i==2){
    $(".date ul li a").on("mouseenter",function(){
      $(this).removeClass("on");
      $(this).removeClass("on3");
      $(this).addClass("on2");
    });
    $(".date ul li a").on("mouseleave",function(){
      $(this).removeClass("on2");
    });
  }else{
    i=0;
  }
});
$(".blue").on("click",function(){
  i=3;
  if(i==3){
    $(".date ul li a").on("mouseenter",function(){
      $(this).removeClass("on");
      $(this).removeClass("on2");
      $(this).addClass("on3");
    });
    $(".date ul li a").on("mouseleave",function(){
      $(this).removeClass("on3");
    });
  }else{
    i=0;
  }
});

  //program hover
  $(".program01>.p01-1>div>a").on("mouseenter",function(){
    //$(this).parent().children(".submenu").show();
    $(this).parent().children(".p-hover").show();
  });
  $(".p-hover").on("mouseenter",function(){
    $(this).show();
  });
  $(".p-hover").on("mouseleave",function(){
    $(this).hide();
  });
  $(".program01>.p01-1>div>a").on("mouseleave",function(){
    $(".p-hover").hide();
  });

  $(".program01>.p01-2>div>a").on("mouseenter",function(){
    $(this).parent().children(".p-hover").show();
  });
  $(".p-hover").on("mouseenter",function(){
    $(this).show();
  });
  $(".p-hover").on("mouseleave",function(){
    $(this).hide();
  });
  $(".program01>.p01-2>div>a").on("mouseleave",function(){
    $(".p-hover").hide();
  });

  $(".program02>.p01-1>div>a").on("mouseenter",function(){
    $(this).parent().children(".p-hover").show();
  });
  $(".p-hover").on("mouseenter",function(){
    $(this).show();
  });
  $(".p-hover").on("mouseleave",function(){
    $(this).hide();
  });
  $(".program02>.p02-1>div>a").on("mouseleave",function(){
    $(".p-hover").hide();
  });

  $(".program02>.p01-2>div>a").on("mouseenter",function(){
    $(this).parent().children(".p-hover").show();
  });
  $(".p-hover").on("mouseenter",function(){
    $(this).show();
  });
  $(".p-hover").on("mouseleave",function(){
    $(this).hide();
  });
  $(".program02>.p02-2>div>a").on("mouseleave",function(){
    $(".p-hover").hide();
  });

  //exhibition hover
  //$(".exhibition>.img>a>img").on("mouseenter",function(){
    //$(this).parent().children(".submenu").show();
    //$(this).parent().children(".e-hover").show();
  //});
  //$(".e-hover").on("mouseenter",function(){
    //$(this).show();
  //});
  //$(".e-hover").on("mouseleave",function(){
    //$(this).hide();
  //});
  //$(".exhibition>.img>a>img").on("mouseleave",function(){
    //$(".e-hover").hide();
  //});

  $(".morebox").show();
  $(".today-img2").hide();
  $(".morebox a").on("click",function(){
    if($(".today-img2").css("display")=="none"){
      //없는 상황
      $(".today-img2").slideDown(); //show
      $(".search").animate({top:"600px"},500);
      $(".center-visual-wrap").animate({top:"300px"},500);
      $(".program-wrap").animate({top:"300px"},500);
      $(".exhibition-wrap").animate({top:"300px"},500);
      $(".notice-sns-wrap").animate({top:"300px"},500);
      $("#footer").animate({top:"300px"},500);
      $(".morebox").hide();
      $(".morebox-close a").show();
    }else{
      //있는 상황
    }
    return false;
  });
  $(".morebox-close a").on("click",function(){

    $(".today-img2").slideUp(); //hide
    $(".search").animate({top:"320px"},500);
    $(".center-visual-wrap").animate({top:"0"},500);
    $(".program-wrap").animate({top:"0"},500);
    $(".exhibition-wrap").animate({top:"0"},500);
    $(".notice-sns-wrap").animate({top:"0"},500);
    $("#footer").animate({top:"0"},500);
    $(".morebox-close a").hide();
    $(".morebox").show();
    return false;
  });


  //sub-more
  $(".sub-morebox").show();
  $(".sub-right2").hide();
  $(".sub-morebox").on("click",function(){
    if($(".sub-right2").css("display")=="none"){
      //없는 상황
      $(".sub-right2").slideDown(); //show
      //$("#footer").animate({top:"0"},500);
      $(".sub-morebox").hide();
      $(".sub-morebox-close a").show();
    }else{
      //있는 상황
    }
    return false;
  });
  $(".sub-morebox-close a").on("click",function(){

    $(".sub-right2").slideUp(); //hide
    //$("#footer").animate({top:"0"},500);
    $(".sub-morebox-close a").hide();
    $(".sub-morebox").show();
    return false;
  });











//visual carousel
$(".visual").owlCarousel({
  items:1,
  loop:true,
  autoplay:true,
  autoplayTimeout:3000,
  autoplayHoverPause:true,
  nav:true,
  mouseDrag:false
});

//center visual
$(".center-visual").owlCarousel({
  items:1,
  loop:true,
  autoplay:true,
  autoplayTimeout:5000,
  autoplayHoverPause:true,
  nav:false,
  mouseDrag:false
});

//program carusel
$(".program").owlCarousel({
  items:1,
  loop:true,
  autoplay:true,
  autoplayTimeout:5000,
  autoplayHoverPause:true,
  nav:true,
  mouseDrag:false
});

//exhibition carusel
var owl = $('.exhibition');
owl.owlCarousel({
  items:6,
  loop:true,
  //margin:10,
  autoplay:true,
  autoplayTimeout:1000,
  autoplayHoverPause:true

});


});
