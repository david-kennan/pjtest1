<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PikJoy - {{folder}}</title>
    <link rel="stylesheet" type="text/css" href="/docroot/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/docroot/css/theme.css">
    <link rel="stylesheet" type="text/css" href="/docroot/css/blueimp-gallery.min.css">
    <link rel="icon" href="/docroot/img/pikjoy-favicon-16.png" sizes="16x16">
    <link rel="icon" href="/docroot/img/pikjoy-favicon-32.png" sizes="32x32">
    <link rel="icon" href="/docroot/img/pikjoy-favicon-48.png" sizes="48x48">
</head>
<body>
    <div class="container-fluid">
        <div class="header" style="text-align: center;">
            <img src="/docroot/img/pikjoy-logo.png" style="display: inline;" alt="">
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
        <a class="next"></a>
        <a class="prev"></a>
        <a class="close"></a>
        <ol class="indicator"></ol>
        <a class="share"></a>
    </div>
</body>

<script src="/docroot/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/docroot/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/docroot/js/jquery.blueimp-gallery.min.js" type="text/javascript" charset="utf-8"></script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-25934905-2', 'auto');
  ga('send', 'pageview');

</script>
</html>