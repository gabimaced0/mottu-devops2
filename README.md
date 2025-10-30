# Mottu Backend - DevOps Tools & Cloud Computing

Repositório exclusivo para a entrega da Sprint 4 da disciplina **DevOps Tools & Cloud Computing**.

Integrantes
- Fernando Henrique Vilela Aguiar — RM557525
- Gabrielly Campos Macedo — RM558962
- Rafael Macoto Magalhães — RM554992

Este backend Java permite gerenciar motos com integração ao **Azure SQL Database** e deploy em **Azure Container Instance (ACI)**, com imagem armazenada no **Azure Container Registry (ACR)**.

---

## Descrição da Solução

Aplicação Java com API REST que realiza CRUD completo sobre a entidade **Moto**, permitindo cadastrar, listar, editar e excluir motos da base de dados. O backend foi containerizado e publicado no Azure.

---

## Benefícios para o Negócio

- Automatiza o controle de motos da empresa
- Centraliza informações em banco na nuvem
- Garante escalabilidade e portabilidade com Docker + Azure
- Permite deploy rápido sem infraestrutura complexa (via ACI)

---

## Banco de Dados em Nuvem (Azure SQL)

- Banco: `db-mottu`
- Server: `rm558962`
- Usuário: `mottuuser`
- Conexão: configurada via variável de ambiente `SPRING_DATASOURCE_URL`
- Conexão JDBC (exemplo):

```properties
jdbc:sqlserver://rm558962.database.windows.net:1433;database=db-mottu;user=mottuuser@rm558962;password=SENHA_AQUI;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;
```

## Como rodar

Passos:
1. Criar o Banco de Dados SQL na Azure

2. Criar Azure Container Registry (ACR)

3. Clonar repositório
`https://github.com/RafaMacoto/SprintJavaPz.git`

4. Fazer Login no Azure
`az login`

5. Abra o Docker Desktop

6. Fazer login no ACR
`az acr login --name mottuacr`

7. Buildar e subir a imagem (TERMINAL)
`docker build -t mottuacr.azurecr.io/mottu-backend:latest .`
`docker push mottuacr.azurecr.io/mottu-backend:latest`

8. Criar Azure Container Instance (ACI)
`Imagem: mottuacr.azurecr.io/mottu-backend:latest`
`Origem: Azure Container Registry`
`Porta:8080`

10. Acesse a URL pública do container + endpoint da sua API

## Testes

```
Criar usuário
http://<>IP-PUBLICO:8080/users
{
	"nome": "Gabrielly Macedo", 
 	"email": "gabrielly.cmacedo@gmail.com", 
	"role": "ADMIN", 
	"senha": "senhaSegura123"
}
{
	"nome": "Bianca Gamo", 
 	"email": "bianca.gamo@gmail.com", 
	"role": "ADMIN", 
	"senha": "senhaSegura123"
}

Logar 
http://<>IP-PUBLICO:8080/login
{"email": "gabrielly.cmacedo@gmail.com", "password": "senhaSegura123"}

Criar ala
http://<IP-PUBLICO>:8080/alas
{"nome": "DISPONIVEL"}
{"nome": "MANUTENCAO"}

Criar moto
http://<IP-PUBLICO>:8080/motos
{
	"modelo": "Honda CG 160",
	"status": "DISPONIVEL",
	"posicao": "Sao Paulo",
	"problema": null,
	"placa": "ABC-1234",
	"alaId": 1
}
{
	"modelo": "NMAX 160",
	"status": "DISPONIVEL",
	"posicao": "Sao Paulo",
	"problema": null,
	"placa": "DPR-1234",
	"alaId": 1
}

Uptade na NMAX para MANUTENÇÃO
http://<IP-PUBLICO>:8080/motos/{id}
{
	"modelo": "NMAX 160",
	"status": "MANUTENCAO",
	"posicao": "Sao Paulo",
	"problema": null,
	"placa": "DPR-1234",
	"alaId": 2
}

Excluir Moto
http://<IP-PUBLICO>:8080/motos/{id}
```

