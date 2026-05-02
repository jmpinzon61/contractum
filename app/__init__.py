from flask import Flask
from app.models.database import db
from app.config.settings import Config

def create_app():
    app = Flask(__name__)

    app.config.from_object(Config)

    db.init_app(app)

    with app.app_context():
        db.create_all()

    @app.route("/")
    def home():
        return "Flask funcionando correctamente"

    from app.routes.usuario_routes import usuario_bp
    app.register_blueprint(usuario_bp)

    return app