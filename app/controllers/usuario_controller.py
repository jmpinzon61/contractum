from app.models.usuarios import Usuario


def get_all_usuarios():
    return Usuario.query.all()