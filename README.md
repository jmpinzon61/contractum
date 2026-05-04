<p align="center">
  <img src="https://cdn.worldvectorlogo.com/logos/flask.svg" width="120" style="background:white; padding:10px; border-radius:10px;"/>
  &nbsp;&nbsp;
  <img src="https://upload.wikimedia.org/wikipedia/commons/d/d7/SQLAlchemy.svg" width="160" style="background:white; padding:10px; border-radius:10px;"/>
</p>

---

# Stack del proyecto

| Tecnología | Versión | Rol |
|---|---|---|
| **Flask** | 3.1.3 | Framework web principal, maneja rutas y lógica del servidor |
| **Flask-SQLAlchemy** | 3.1.1 | Integración de SQLAlchemy con Flask |
| **SQLAlchemy** | 2.0.49 | ORM para definir modelos y hacer queries a la base de datos |
| **Jinja2** | 3.1.6 | Motor de plantillas HTML |
| **Werkzeug** | 3.1.8 | Utilidades WSGI que usa Flask internamente |
| **SQLite** | — | Base de datos local para desarrollo (no necesita instalación aparte) |
| **GitHub** | — | Control de versiones y colaboración del equipo |

---

# Instalación de dependencias

Antes de correr cualquier cosa, necesitamos instalar las dependencias del proyecto. Todas están listadas en el archivo `requirements.txt` que ya está en el repositorio.

**Paso 1 — Clona el repo y entra a la carpeta:**

```bash
git clone <url-del-repo>
cd nombre-del-proyecto
```

**Paso 2 — Instala todas las dependencias de una sola vez:**

```bash
pip install -r requirements.txt
```

Esto instalará Flask, SQLAlchemy y todo lo que el proyecto necesita para correr.

---

# ¿Qué hace SQLAlchemy aquí?

SQLAlchemy es el corazón de nuestra capa de datos. En lugar de escribir SQL directamente, definimos los **modelos como clases de Python** y SQLAlchemy se encarga de traducirlos a la base de datos.

Por ejemplo, cuando definimos un modelo `Contrato`, SQLAlchemy crea automáticamente la tabla correspondiente en SQLite. Esto nos permite:

- Crear, leer, actualizar y eliminar registros con código Python puro.
- Cambiar fácilmente de SQLite (desarrollo) a PostgreSQL o MySQL (producción) sin tocar la lógica.
- Mantener el esquema de la base de datos versionado junto con el código.

Para inicializar la base de datos por primera vez:

```bash
flask shell
```

```python
# Dentro del shell de Flask
from app import db
db.create_all()
exit()
```

Esto genera el archivo `.db` con todas las tablas definidas en los modelos.

---

# Extensiones recomendadas en VS Code

Para que puedan trabajar cómodamente con el backend y la base de datos, instalen estas extensiones:

| Extensión | Publisher | Para qué sirve |
|---|---|---|
| **Python** | Microsoft | Ejecutar y depurar código Python |
| **Pylance** | Microsoft | Autocompletado e inferencia de tipos |
| **Python Debugger** | Microsoft | Depuración paso a paso con breakpoints |
| **Python Environments** | Microsoft | Gestión de entornos virtuales |
| **SQLite** | alexcvzz | Explorar y consultar la base de datos directamente |
| **SQLTools** | Matheus Teixeira | Conexión y manejo de bases de datos |
| **SQLTools SQLite** | Matheus Teixeira | Driver específico para SQLite |

Con estas extensiones van a poder abrir el archivo `.db`, ver las tablas, correr queries y validar que el backend está escribiendo datos correctamente — todo sin salir de VS Code.

---

# Correr el proyecto

Una vez con las dependencias instaladas y el entorno virtual activado:

```bash
python run.py
```

Por defecto levanta en `http://127.0.0.1:5000`. La configuración del puerto y el modo debug están definidos directamente en `run.py`.

# Estructura del proyecto (referencia rápida)

```
contractum/
├── app/
│   ├── config/
│   │   └── settings.py          # Configuración general de la app
│   ├── controllers/
│   │   └── usuario_controller.py # Lógica de negocio por entidad
│   ├── models/
│   │   ├── database.py          # Instancia de SQLAlchemy y conexión
│   │   └── usuarios.py          # Modelo de la tabla usuarios
│   ├── routes/
│   │   └── usuario_routes.py    # Definición de endpoints REST
│   ├── services/                # Servicios reutilizables (lógica externa)
│   ├── static/                  # Archivos estáticos (CSS, JS, imágenes)
│   ├── templates/               # Plantillas HTML (Jinja2)
│   ├── views/                   # Vistas del frontend (próxima etapa)
│   └── __init__.py              # Inicialización del módulo Flask
├── database/
│   └── AppBd.session.sql        # Sesión activa de la base de datos
├── requirements.txt             # Dependencias del proyecto
├── run.py                       # Punto de entrada para correr la app
└── README.md                    # Este archivo
```

---
