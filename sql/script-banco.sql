
DROP SEQUENCE sq_id_usuario;

DROP TABLE config_alimentacao;
DROP TABLE config_exercicio;
DROP TABLE exercicios;
DROP TABLE nivel_estresse;
DROP TABLE receitas;
DROP TABLE usuario;

CREATE SEQUENCE sq_id_usuario START WITH 1 INCREMENT BY 1;

CREATE TABLE config_alimentacao (
    calorias_diarias       NUMBER(4) NOT NULL,
    qtd_refeicoes          NUMBER(1) NOT NULL,
    restricoes_alimentares VARCHAR2(255 CHAR) NOT NULL,
    id_usuario             NUMBER(10) NOT NULL
);

ALTER TABLE config_alimentacao ADD CONSTRAINT config_alimentacao_pk PRIMARY KEY ( id_usuario );

CREATE TABLE config_exercicio (
    id_usuario     NUMBER(10) NOT NULL,
    horario_inicio DATE NOT NULL,
    horario_fim    DATE NOT NULL
);

ALTER TABLE config_exercicio ADD CONSTRAINT config_exercicio_pk PRIMARY KEY ( id_usuario );

CREATE TABLE exercicios (
    nome_exercicio VARCHAR2(50) NOT NULL,
    desc_exercicio VARCHAR2(255 CHAR) NOT NULL,
    link_video     VARCHAR2(100 CHAR) NOT NULL,
    tipo_exercicio VARCHAR2(50) NOT NULL
);

ALTER TABLE exercicios ADD CONSTRAINT exercicios_pk PRIMARY KEY ( nome_exercicio );

CREATE TABLE nivel_estresse (
    nivel_stress VARCHAR2(30 CHAR) NOT NULL,
    dt_medicao   DATE NOT NULL,
    id_usuario   NUMBER(10) NOT NULL
);

ALTER TABLE nivel_estresse ADD CONSTRAINT nivel_estresse_pk PRIMARY KEY ( id_usuario );

CREATE TABLE receitas (
    nome_receita VARCHAR2(50 CHAR) NOT NULL,
    ingredientes VARCHAR2(511 CHAR) NOT NULL,
    preparo      VARCHAR2(511 CHAR) NOT NULL,
    link_video   VARCHAR2(511 CHAR) NOT NULL
);

ALTER TABLE receitas ADD CONSTRAINT receitas_pk PRIMARY KEY ( nome_receita );

CREATE TABLE usuario (
    id_usuario       NUMBER(10) NOT NULL,
    nome_usuario     VARCHAR2(50 BYTE) NOT NULL,
    cpf_usuario      NVARCHAR2(11) NOT NULL,
    email_usuario    VARCHAR2(255 CHAR) NOT NULL,
    altura_cm        NUMBER(3) NOT NULL,
    peso_usuario     NUMBER(4, 1) NOT NULL,
    telefone_usuario NVARCHAR2(13),
    senha_usuario    VARCHAR2(64) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE usuario ADD CONSTRAINT cpf_usuario_uk UNIQUE ( cpf_usuario );

ALTER TABLE usuario ADD CONSTRAINT email_usuario_uk UNIQUE ( email_usuario );

ALTER TABLE config_alimentacao
    ADD CONSTRAINT config_alimentracao_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE config_exercicio
    ADD CONSTRAINT config_exercicios_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE nivel_estresse
    ADD CONSTRAINT estresse_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );


