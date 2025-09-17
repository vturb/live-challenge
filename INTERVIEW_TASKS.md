# Interview Tasks for Ruby on Rails Candidates

Este projeto contém tarefas práticas para entrevistas técnicas Rails. Cada tarefa é projetada para ser completada em 10-15 minutos e testa conhecimentos específicos do Rails.

## Configuração do Ambiente

O projeto está configurado para funcionar no GitHub Codespaces:
1. Abra o projeto no GitHub Codespaces
2. O ambiente será configurado automaticamente com PostgreSQL e Redis
3. Execute: `bundle install && rails db:create && rails db:migrate && rails db:seed`
4. Execute: `rails server` para iniciar a aplicação

### Credenciais de Teste
- **Email**: admin@example.com
- **Senha**: password123

Outros usuários: john@example.com, jane@example.com, bob@example.com, alice@example.com (senha: password123)

## Tarefas Disponíveis

### Tarefa 1: Implementação de Comentários (15 minutos)

**Objetivo**: Implementar um sistema básico de comentários nos posts.

**O que já está implementado**:
- Modelo Comment com validações
- Associações User/Post/Comment
- Exibição de comentários aprovados na view show

**O que o candidato deve implementar**:
1. Controller `CommentsController` com actions `create`, `update`, `destroy`
2. Formulário para adicionar comentário na view `posts/show.html.erb`
3. Validações adequadas e tratamento de erros
4. Implementar aprovação/rejeição de comentários (opcional)

**Avalia**:
- Conhecimento de nested routes (`/posts/:post_id/comments`)
- Strong parameters
- Validações ActiveRecord
- Tratamento de erros e flash messages
- Redirecionamentos apropriados

**Arquivos a modificar**:
- `app/controllers/comments_controller.rb` (criar)
- `app/views/posts/show.html.erb` (adicionar formulário)
- `config/routes.rb` (já configurado)

### Tarefa 2: Busca Avançada de Posts (12 minutos)

**Objetivo**: Melhorar a funcionalidade de busca existente.

**O que já está implementado**:
- Scope básico de busca por título e conteúdo
- Formulário de busca na index

**O que o candidato deve implementar**:
1. Busca por autor (nome do usuário)
2. Filtro por data (posts dos últimos 30 dias, por exemplo)
3. Ordenação por relevância ou data
4. Paginação (usando gem como Kaminari ou Pagy)

**Avalia**:
- Scopes ActiveRecord complexos
- Queries eficientes (evitar N+1)
- Parâmetros de filtro
- Interface de usuário intuitiva

**Arquivos a modificar**:
- `app/models/post.rb` (adicionar scopes)
- `app/controllers/posts_controller.rb` (melhorar index)
- `app/views/posts/index.html.erb` (formulário avançado)

### Tarefa 3: API Endpoint para Posts (15 minutos)

**Objetivo**: Criar endpoint JSON para listar e criar posts.

**O que o candidato deve implementar**:
1. Namespace API v1 nas routes
2. Controller `Api::V1::PostsController` com actions `index`, `show`, `create`
3. Autenticação via token simples (header Authorization)
4. Serialização JSON adequada
5. Tratamento de erros JSON

**Avalia**:
- Design RESTful de APIs
- Namespacing e versionamento
- Autenticação de API
- Serialização (JSON views ou gem como Alba/JBuilder)
- Códigos de status HTTP apropriados

**Arquivos a criar**:
- `app/controllers/api/v1/posts_controller.rb`
- `app/views/api/v1/posts/` (JSON views)
- Atualizar `config/routes.rb`

### Tarefa 4: Validações e Nested Attributes (10 minutos)

**Objetivo**: Implementar formulário com nested attributes para Post + Tags.

**O que o candidato deve implementar**:
1. Modelo `Tag` com `has_and_belongs_to_many :posts`
2. Migration para a tabela de junção
3. Nested attributes no formulário de Post
4. Validações customizadas
5. Exibição de tags na view

**Avalia**:
- Relacionamentos many-to-many
- Nested attributes e accepts_nested_attributes_for
- Validações customizadas
- Strong parameters complexos
- Fields_for em formulários

### Tarefa 5: Performance e N+1 (8 minutos)

**Objetivo**: Otimizar queries existentes.

**O que o candidato deve fazer**:
1. Identificar problema N+1 na listagem de posts
2. Implementar includes/joins apropriados
3. Adicionar counter_cache para comentários
4. Implementar cache fragment na view

**Avalia**:
- Identificação de problemas de performance
- Eager loading (includes, joins, preload)
- Counter cache
- Fragment caching
- Conhecimento de ferramentas de profiling

## Critérios de Avaliação

### Conhecimentos Técnicos (60%)
- **ActiveRecord**: Queries, scopes, validações, relacionamentos
- **Controllers**: RESTful design, strong parameters, filtros
- **Views**: ERB, helpers, formulários, partials
- **Routing**: Resources, namespaces, nested routes
- **Security**: Autenticação, autorização, CSRF

### Práticas de Desenvolvimento (25%)
- **Conventions**: Seguir convenções Rails
- **Code Quality**: Código limpo e organizado
- **Error Handling**: Tratamento adequado de erros
- **Testing**: Conhecimento de RSpec/MiniTest (opcional)

### Problem Solving (15%)
- **Approach**: Metodologia para resolver problemas
- **Questions**: Qualidade das perguntas feitas
- **Debugging**: Capacidade de identificar e corrigir erros
- **Time Management**: Completar tarefas no tempo estipulado

## Instruções para Entrevistadores

### Antes da Entrevista
1. Clone o repositório e teste localmente
2. Prepare o GitHub Codespace
3. Tenha as credenciais de teste disponíveis
4. Defina qual tarefa será utilizada (baseado no nível do candidato)

### Durante a Entrevista
1. **Introdução (2 min)**: Explique o projeto e a tarefa
2. **Execução (12-15 min)**: Candidato implementa a solução
3. **Discussão (3-5 min)**: Revise o código e discuta alternativas

### Dicas de Observação
- Como o candidato estrutura o código?
- Faz perguntas relevantes sobre requisitos?
- Conhece atalhos e convenções Rails?
- Testa o código conforme desenvolve?
- Como trata erros e edge cases?

### Red Flags
- Não seguir convenções Rails
- Ignorar validações de segurança
- Código não funcional
- Não fazer perguntas sobre requisitos ambíguos
- Não testar a implementação

## Extensões Opcionais

### Para Sênior/Staff
- Implementar cache distribuído
- Otimizações de banco de dados
- Microserviços e APIs
- Performance monitoring
- Background jobs com Sidekiq

### Para Full-Stack
- Hotwire/Stimulus para interatividade
- CSS/JavaScript customizado
- Responsive design
- Acessibilidade (WCAG)

## Troubleshooting

### Problemas Comuns
- **Codespace não inicializa**: Verifique .devcontainer/devcontainer.json
- **Database connection error**: PostgreSQL pode demorar para iniciar
- **Asset pipeline issues**: Execute `rails assets:precompile`
- **Gem conflicts**: Execute `bundle update`

### Comandos Úteis
```bash
# Reset do banco
rails db:drop db:create db:migrate db:seed

# Debug de routes
rails routes

# Console Rails
rails console

# Testes
rails test
# ou
rspec
```