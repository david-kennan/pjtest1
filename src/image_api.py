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

@app.route('/')
@bottle.view("index")
def index():
    return dict()

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