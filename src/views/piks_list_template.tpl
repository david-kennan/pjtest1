<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>My PikJoy Album</title>
    <link rel="stylesheet" type="text/css" href="/docroot/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/docroot/css/theme.css">
    <link rel="stylesheet" type="text/css" href="/docroot/css/blueimp-gallery.min.css">
    <link rel="stylesheet" type="text/css" href="/docroot/css/blueimp-gallery-indicator.css">
    <link href="//fonts.googleapis.com/css?family=Roboto:100,400,300,700" rel="stylesheet" type="text/css">
    <link rel="icon" href="/docroot/img/pikjoy-favicon-16.png" sizes="16x16">
    <link rel="icon" href="/docroot/img/pikjoy-favicon-32.png" sizes="32x32">
    <link rel="icon" href="/docroot/img/pikjoy-favicon-48.png" sizes="48x48">

    <meta property="og:title" content="Anand's Birthday Bash" />
    <meta property="og:description" content="One Crazy night!!" />
    <meta property="og:type" content="og:website" />
    <meta property="fb:app_id" content="1677396915813926" />
    <meta property="og:image" content="{{piks[1] if len(piks) else piks[0]}}" />

    <style type="text/css" media="screen">
        .share-row {
            text-align: center;
            padding-bottom: 12px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="header" style="text-align: center;">
            <img src="/docroot/img/pikjoy-logo.png" style="display: inline;" alt="">
        </div>
        <div class="row share-row">
            <div class="fb-share-button" data-layout="button" ></div>
        </div>
        <div class="row">
            <div id="gallery">
                %for pik in piks:
                    <div class="col-md-3">
                        <a href="{{pik}}" title="Image" data-gallery>
                            <div class="img-container" style="background-image: url('{{pik}}')"></div>
                        </a>
                    </div>
                %end
            </div>
        </div>
    </div>
    <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" style="display: none;">
        <div class="slides"></div>
        <a class="next">›</a>
        <a class="prev">‹</a>
        <a class="close">&#9747;</a>
        <ol class="indicator"></ol>
        <a class="share"></a>
    </div>
</body>

<script src="/docroot/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/docroot/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/docroot/js/jquery.blueimp-gallery.min.js" type="text/javascript" charset="utf-8"></script>

<script>
    // GA
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-25934905-2', 'auto');
  ga('send', 'pageview');

</script>

<script>
    // FB
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1677396915813926',
      xfbml      : true,
      version    : 'v2.4'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<script>
  $(".fb-custom-share-button").click( function() {
    FB.ui(
    {
      method: 'feed',
      name: 'This is the content of the "name" field.',
      link: "view.pikjoy.com/" + location.pathname,
      picture: 'http://www.hyperarts.com/external-xfbml/share-image.gif',
      caption: 'This is the content of the "caption" field.',
      description: 'This is the content of the "description" field, below the caption.',
      message: ''
    });
  });
</script>
</html>