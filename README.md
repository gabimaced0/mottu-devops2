# Mottu Backend - DevOps Tools & Cloud Computing

Repositório exclusivo para a entrega da Sprint 4 da disciplina **DevOps Tools & Cloud Computing**.

Integrantes - 2TDSPZ
- Fernando Henrique Vilela Aguiar — RM557525
- Gabrielly Campos Macedo — RM558962
- Rafael Macoto Magalhães — RM554992

Este backend Java permite gerenciar motos com integração ao **Azure SQL Database**. O deploy é automatizado através de um pipeline de **CI/CD** para o **Azure Web App**, utilizando uma imagem armazenada no **Azure Container Registry (ACR)**.

---

## Descrição da Solução

Aplicação Java com API REST que realiza um CRUD completo sobre a entidade **Moto**, permitindo cadastrar, listar, editar e excluir motos. A solução foi implantada no **Azure Web App para Contêineres**, utilizando um pipeline de **CI/CD (Integração Contínua e Entrega Contínua)** para automatizar os processos de build e deploy a partir do repositório.

---

## Benefícios para o Negócio

- Automatiza o controle de motos da empresa
- Centraliza informações em banco na nuvem
- Garante escalabilidade e portabilidade com Docker + Azure
- Permite deploy rápido sem infraestrutura complexa (via ACI)

---

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

