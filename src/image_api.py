import os
import logging
import bottle

app = application = bottle.Bottle()

IMAGES_PATH = "/var/www/piks"

@app.route('/pik/thumb/<folder>/<guest>/<filename>')
def server_static(folder, guest, filename):
    return bottle.static_file(filename, root=os.path.join(IMAGES_PATH, folder, guest))
    
@app.route("/<folder>/<guest>")
@bottle.view("piks_list_template")
def list_piks(folder, guest):
    piks = []
    try:        
        for (dirpath, dirnames, filenames) in os.walk(os.path.join(IMAGES_PATH, folder, guest)):
            piks.extend(["/".join(("/pik/thumb", folder, guest, f)) for f in filenames if not f.startswith('.')])
    except ValueError:
        logging.getLogger().exception("Could not walk path %s %s", folder, guest)
        raise

    # bottle.TEMPLATES.clear()

    return dict(piks=piks, folder=folder)

#@app.route('/')
# def index():
#     return '''
#     <img src='/docroot/img/pikjoy-logo.png'>
#     <script>
#       (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
#       (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
#       m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
#       })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

#       ga('create', 'UA-25934905-2', 'auto');
#       ga('send', 'pageview');

#     </script>
#     '''

# Error Handlers
@app.error(500)
def error_handler_500(error):
    return str(error)


if __name__ == '__main__':
    @app.route('/docroot/<folder:path>/<filename>')
    def docroot_static(folder, filename):
        return bottle.static_file(filename, root=os.path.join("../docroot", folder))

    import sys
    logging.basicConfig(stream=sys.stdout, level=logging.INFO)

    app.run(port="8989", debug=True)