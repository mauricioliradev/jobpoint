# JobPoint

Desafio técnico para a vaga de RoR;

## Tabs

- [Desafio](#Desafio)
- [Decisões](#Decisões)
- [Instalação](#Instalação)

# Desafio

- Tela de login

- Tela de cadastro

- Controle de sessão via login

- Tela para apontar hora (chegada na empresa, hora de almoço, saída da empresa)

- Tela de histórico de apontamentos do usuário

- Arquivo de DUMP do Mysql, para recriar o banco de dados em outro ambiente

- Design responsivo

- Um readme.txt explicando como fazer funcionar o seu sistema



*Webapp - Sistema web, que roda em um navegador, com design responsivo voltado para celulares.



Todo o desafio deve ser desenvolvido em Ruby on Rails MVC e Mysql. Não se preocupe em fazer um sistema super lindo. O que será avaliado é como você estrutura seu código e seus conhecimentos de algoritmo. Os requisitos do sistema estão escritos de maneira bem rasa de propósito. É importante para gente ver como é sua linha de raciocínio e como você transforma informação em código ;)


# Decisões

Como primeiro passo foi feito o planejamento da aplicação em relação a suas entidades e relacionamentos, ficando com o seguinte modelo de dados:

![Alt text](doc/job_point_v1.jpeg?raw=true "DER")


A solução foi implementada com as seguintes ferramentes:

- Ruby 2.5.0
- Rails 5.2.3
- Mysql
- Bootstrap 4
- Jquery

O sistema foi pensado de forma que cada cada usuário ao logar tenha acesso somente ao seu historíco. Mas poderia ser implementado também a autorização, tendo assim perfis de usuários específicos para acessar o histórico de todos os usuários.

Sobre o controle de ponto a validação implementada foi somente para restringir a criação de um mesmo tipo de ponto no mesmo dia, por exemplo registrar o ponto de entrada mais de uma vez no dia. Outra alternativa que poderia ser implementada era definir o tipo de ponto(Entrada, Almoço, Saída) automaticamente de acordo com o horário atual, sem o usuário informar o tipo manualmente.

Demonstração em produção: https://jobpoints.herokuapp.com

# Instalação

 ### 1. Clonar o repositório

```
git clone https://github.com/mauricioliradev/jobpoint.git
```
### 2. Alterar arquivos de configuração local

- 2.1 Configurar Mysql local
```
├── app
│   ├── config
│   │   └── database.yml

default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: 
  password: 
  socket: /var/run/mysqld/mysqld.sock

development:
  <<: *default
  database: jobpoints
```
### 3. Comandos basicos

- 3.1 Criar estrutura de dados
```
rails db:create

rails db:migrate
```
- 3.2 Instalar dependencias
```
bundle install

yarn install
```
- 3.3 Subir servidor local
```
rails s

```
