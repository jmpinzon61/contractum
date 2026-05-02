from flask import Blueprint, jsonify
from app.controllers.usuario_controller import get_all_usuarios

usuario_bp = Blueprint('usuario_bp', __name__)

@usuario_bp.route("/usuarios", methods=["GET"])
def listar_usuarios():
    usuarios = get_all_usuarios()

    return jsonify([{
        'id': usuario.id,
        'nombre': usuario.nombre,
        'email': usuario.email,
        'contraseña': usuario.contraseña,
        'rol': usuario.rol,
        'created_at': usuario.created_at
    } for usuario in usuarios])
