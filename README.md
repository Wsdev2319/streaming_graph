# 🎬 Streaming Graph — Sistema de Recomendação com Neo4j

    Este projeto cria um **grafo de conhecimento** para um serviço de **streaming de filmes e séries**, com o objetivo de estruturar relacionamentos entre **usuários, filmes, séries, atores, diretores e gêneros**, permitindo futuras implementações de **sistemas de recomendação inteligentes**.

---

## 🧠 Visão Geral do Projeto

    A proposta é utilizar o **Neo4j** como banco de dados orientado a grafos, representando de forma natural as conexões entre entidades.  
    O grafo é alimentado por um **script Python**, que executa comandos **Cypher** para criar nós, restrições e relacionamentos.
    
    O modelo base inclui:
    - **Usuários** (`User`)
    - **Filmes** (`Movie`)
    - **Séries** (`Series`)
    - **Atores** (`Actor`)
    - **Diretores** (`Director`)
    - **Gêneros** (`Genre`)
    
    E os relacionamentos:
    - `:WATCHED` — usuários que assistiram algo (com nota/rating)
    - `:ACTED_IN` — ator que atuou em um filme/série
    - `:DIRECTED` — diretor responsável pela obra
    - `:IN_GENRE` — gênero ao qual pertence o filme ou série
    
    ---

## 🧩 Estrutura do Grafo

    Exemplo de parte da rede:
    
    (User)-[:WATCHED]->(Movie)-[:IN_GENRE]->(Genre)
    ↳ (Actor)-[:ACTED_IN]->(Movie)
    ↳ (Director)-[:DIRECTED]->(Movie)

---

## ⚙️ Tecnologias Utilizadas

    - 🐍 **Python 3.10+**
    - 🧠 **Neo4j 5+**
    - 📦 **Biblioteca oficial do Neo4j para Python (`neo4j`)**
    - 💡 Linguagem de consulta **Cypher**

---

## 🚀 Como Executar o Projeto

### 1️⃣ Clonar o repositório

      git clone https://github.com/Wsdev2319/streaming_graph.git
      cd streaming_graph

2️⃣ Instalar dependências
      Certifique-se de ter o pip instalado e execute:
      pip install neo4j

3️⃣ Configurar o Neo4j
      Inicie o Neo4j Desktop ou o Neo4j Aura.
      
      Crie um banco local e anote:
      
      URI (ex: neo4j://127.0.0.1:7687)
      
      Usuário (ex: neo4j)
      
      Senha (ex: 12161819)

4️⃣ Executar o script Python
    python create_graph.py
    (ou o nome do arquivo que contém o código principal)
    
    Ao final, você verá:
    grafo criado com sucesso!

🔍 Funcionalidades Criadas pelo Script
      Criação automática de constraints únicas para evitar duplicação.
      
      Inserção de nós iniciais de filmes, séries, atores, diretores e gêneros.
      
      Criação de relacionamentos realistas entre os elementos.
      
      Geração automática de usuários (1 a 10) com avaliações (rating) nos conteúdos assistidos.

📊 Exemplo de Consulta Cypher
      Filmes assistidos por determinado usuário:
      
      MATCH (u:User {id: 1})-[:WATCHED]->(m:Movie)
      RETURN u.name, m.title, m.year;
      
      Recomendações baseadas em gênero:
      MATCH (u:User {id: 1})-[:WATCHED]->(:Movie)-[:IN_GENRE]->(g:Genre)<-[:IN_GENRE]-(rec:Movie)
      WHERE NOT (u)-[:WATCHED]->(rec)
      RETURN rec.title AS Recomendado, g.name AS Genero
      LIMIT 5;

🧑‍💻 Autor
    Wesley Souza
    Desenvolvedor Python | Engenharia de Software | Modelagem de Dados | Inteligência Artificial
    📫 GitHub: Wsdev2319

🛠️ Licença
    Este projeto é de uso educacional e livre para estudo, modificação e aprimoramento.
    Sinta-se à vontade para contribuir ou criar forks.
    
    “Dados bem conectados contam histórias poderosas — e o Neo4j é o contador ideal.”riação de relacionamentos realistas entre os elementos.
    
