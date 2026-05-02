CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    contraseña TEXT,
    rol TEXT NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE contratos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    contenido TEXT,
    estado TEXT DEFAULT "borrador",
    created_by INTEGER,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES usuarios(id)
);

CREATE TABLE contrato_participantes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    contrato_id INTEGER NOT NULL,
    usuario_id INTEGER NOT NULL,
    role_en_contrato TEXT NOT NULL,
    estado TEXT DEFAULT "pendiente",
    FOREIGN KEY (contrato_id) REFERENCES contratos(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE firmas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    contrato_id INTEGER NOT NULL,
    usuario_id INTEGER NOT NULL,
    firmas_hash TEXT NOT NULL,
    firmas_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contrato_id) REFERENCES contratos(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE auditoria_registros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    contrato_id INTEGER NOT NULL,
    accion TEXT NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (contrato_id) REFERENCES contratos(id)
);

CREATE TABLE blockchain (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    contrato_id INTEGER NOT NULL,
    codigo_hash TEXT NOT NULL,
    anterior_hash TEXT DEFAULT "0",
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contrato_id) REFERENCES contratos(id)
);

INSERT INTO usuarios (nombre, email, contraseña, rol)
VALUES ("Juan Perez", "juan@test.com", "123456", "admin");

SELECT * FROM usuarios;

INSERT INTO contratos (titulo,contenido, created_by) 
VALUES ("Contrato A","contenido del contrato A", 1);

SELECT * from contratos;

INSERT INTO contrato_participantes (contrato_id, usuario_id, role_en_contrato)
VALUES (1, 1, "firmante");

SELECT * FROM contrato_participantes;

INSERT INTO firmas (contrato_id, usuario_id, firmas_hash)
VALUES (1, 1, "hash_de_la_firma");

SELECT * FROM firmas;

INSERT INTO auditoria_registros (usuario_id, contrato_id, accion)
VALUES (1, 1, "creacion");

SELECT * FROM auditoria_registros;

INSERT INTO blockchain (contrato_id, codigo_hash, anterior_hash)
VALUES (1, "hash_del_contrato", "hash_anterior");

SELECT * FROM blockchain;  

-- DELETE FROM usuarios WHERE id = 1;
-- DELETE FROM contratos WHERE id = 1; 
-- DELETE FROM contrato_participantes WHERE id = 1;
-- DELETE FROM firmas WHERE id = 1;
-- DELETE FROM auditoria_registros WHERE id = 1;
-- DELETE FROM blockchain WHERE id = 1;


    