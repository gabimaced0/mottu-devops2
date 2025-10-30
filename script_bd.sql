CREATE TABLE usuario (
                         id SERIAL PRIMARY KEY,
                         nome VARCHAR(100) NOT NULL,
                         email VARCHAR(100) NOT NULL UNIQUE,
                         role VARCHAR(50) NOT NULL,
                         senha VARCHAR(255) NOT NULL
);


CREATE TABLE ala (
                     id SERIAL PRIMARY KEY,
                     nome VARCHAR(255) NOT NULL
);


CREATE TABLE moto (
                      id SERIAL PRIMARY KEY,
                      modelo VARCHAR(255) NOT NULL,
                      status VARCHAR(50),
                      posicao VARCHAR(255),
                      problema VARCHAR(255),
                      placa VARCHAR(50),
                      ala_id BIGINT,
                      CONSTRAINT fk_ala
                          FOREIGN KEY(ala_id)
                              REFERENCES ala(id)
                              ON DELETE SET NULL
);