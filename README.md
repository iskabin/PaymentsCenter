
# Instruções de instalação e execução
O projeto está dividido em duas partes: Backend (**Rails + GraphQL** / `~/PaymentsCenterServer`) e Frontend (**React** / `~/PaymentsCenterClient`).

## Instalando o Backend

### 1) Instalar o Ruby on Rails
Dependendo do seu sistema operacional, a forma de instalação do Ruby on Rails são diferentes, portanto siga o [guia](https://guides.rubyonrails.org/install_ruby_on_rails.html) para seu sistema.

Em resumo, o guia te pedirá para:
1) Instalar as dependências do Ruby e do Rails;
2) Instalar o gerenciador de versionamento Mise;
3) Instalar a linguagem Ruby globalmente utilizando o Mise;
4) Instalar o pacote (Gem) do Rails.

Para checar se o Ruby e o Rails foram instalados corretamente, execute os comandos `ruby --version` e `rails --version`.

Para este projeto, utilizaremos as versões >=3.4.4 do Ruby, e >=8.0.2 do Rails.
### 2) Instalando as dependências do projeto
Em seu CLI, navegue até o diretório `~/PaymentsCenterServer` e execute o comando `bundle install`.

### 3) Criar o banco de dados
Ainda em `~/PaymentsCenterServer`, execute o comando `rails db:migrate`.

### 4) Popular o banco de dados com dados iniciais
Em `~/PaymentsCenterServer`, execute o comando `rails db:seed`.

## Instalando o Frontend

### 1) Instalar o NPM e o Node
Dependendo do seu sistema operacional, a forma de instalação do NPM e o Node são diferentes, portanto siga o [guia](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) para seu sistema.
Em resumo, o guia te pedirá para:
1) Instalar um sistema de gerenciamento de versões de Node;
2) Instalar o Node utilizando o sistema de gerenciamento de versões escolhido.

Para checar se o NPM e o Node foram instalados corretamente, execute os comandos `npm -v` e `node -v`.

Para este projeto, utilizaremos as versões 10.9.2 do NPM, e 22.16.0 do Node.

### 2) Instalar as dependências do projeto
Em seu CLI, navegue até o diretório `~/PaymentsCenterClient` e execute o comando `npm install`.

## Executando o projeto

### 1) Executar o Backend
Para executar o Backend, navegue até o diretório `~/PaymentsCenterServer` e execute o comando `rails s`.
A interface para uso do GraphQL estará disponível em `localhost:3000/graphiql`.

### 2) Executar o Frontend
Para executar o Frontend, navegue até o diretório `~/PaymentsCenterClient` e execute o comando `npm run dev`.
A aplicação estará disponível em `localhost:5173`.

## Organização do projeto
### Organização do Backend (`~/PaymentsCenterServer`)
O **modelo de dados** consiste nas seguintes classes, que podem ser encontradas no diretório `~/PaymentsCenterServer/app/models`:
 - Customer: representação de um cliente.
 - Product: representação de um produto.
 - Subscription: representação de uma assinatura.
 - Order: representação de um pedido.
 - Payment: representação de um pagamento.
 - ChargeableItem: representação de um produto que faz parte de um pedido ou uma assinatura.

Esse modelo é representado num banco de dados SQLite, criado por meio de migrações que estão no diretório `~PaymentsCenterServer/db/migrate`, que geram o esquema de banco dados `~PaymentsCenterServer/db/schema.rb`.

A **API** foi construída utilizando a implementação do [GraphQL para Ruby](https://graphql-ruby.org/), e seu controlador se encontra em `~/PaymentsCenterServer/app/controllers/graphql_controller.rb`.
Essa implementação possui 3 importantes categorias de classes: **tipos** GraphQL, **mutations** e **queries**.

 - Os **tipos** formam o esquema de dados do GraphQL, e representam os objetos do modelo de dados da aplicação e outros campos que podem ser abstraídos e retornados nas queries, que não necessariamente existam da mesma forma no modelo de aplicação. Esses tipos podem ser encontrados no diretório `~/PaymentsCenterServer/app/graphql/types`.
- As **mutations** representam as chamadas na API que realizam algum tipo mudança de estado na aplicação, seja em memória ou no banco, o equivalente aos métodos `POST`, `PUT`, `PATCH` ou `DELETE` numa API Rest. Essas mutations podem ser encontradas no diretório `~/PaymentsCenterServer/app/graphql/mutations`.
- As **queries** representam as chamadas na API que buscam dados no estado atual da aplicação, equivalente ao método `GET` numa API Rest. Essas queries podem ser encontradas no diretório `~/PaymentsCenterServer/app/graphql/queries`.

As chamadas que estão disponíveis na aplicação são:
- Queries:
	- getCustomers: retorna a lista de clientes.
	- getOrders: retorna a lista de pedidos.
	- getSubscriptions: retorna a lista de assinaturas.
	- getProducts: retorna a lista de produtos.
	- getPayments: retorna a lista de pagamentos, podendo filtrar por status e tipo de cobrança.
- Mutations:
	- createCustomer: cria um novo cliente.
	- createPayment: cria um novo pagamento.

Um exemplo de consulta por pagamentos que busca todos os pagamentos pendentes na interface do GraphQL seria:

    query GetPayments {
      getPayments (status: "pending") {
        id
        status
        payableId
        payableType
        value
        payable {
          ... on Subscription {
            customerId
            id
            status
            createdAt
            customer {
             	name
          	}
            items {
              id
              productId
              value
              product {
                name
              }
            } 
          }
          ... on Order {
            customerId
            id
            status
            createdAt
            customer {
              name
            }
            items {
              id
              productId
              value
              product {
                name
              }
            } 
          }
        }
      }
    }

### Organização do Frontend (`~/PaymentsCenterClient`)
A aplicação web React conta com uma tela (`~/PaymentsCenterClient/src/routes/index.tsx`) que possui uma tabela listando os pagamentos, que podem ser filtrados por status ou tipo de cobrança. Esses pagamentos são populados por meio de uma chamada GraphQL facilitada pelo ApolloClient ao serviço `getPayments` do nosso backend.
O modelo de dados no frontend está no diretório `~/PaymentsCenterClient/src/types`, e os componentes utilizados estão no diretório `~/PaymentsCenterClient/src/components`, divididos entre componentes padrão shadcn (`/ui`) e componentes customizados para a aplicação (`/custom`).