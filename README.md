## Título do Repositório:

**Enquetes Descentralizadas: Um Smart Contract Simples em Solidity**

## Descrição do Projeto:

Este projeto apresenta um contrato inteligente (`smart contract`) desenvolvido em Solidity para a implementação de um sistema básico de enquetes na blockchain Ethereum. O objetivo principal é demonstrar os fundamentos da criação de enquetes onde os votos são registrados de forma transparente e imutável.

**Principais Características:**

* **Criação de Enquetes:** Permite que qualquer usuário da blockchain crie uma nova enquete, definindo um título claro e oferecendo múltiplas opções de voto (entre 2 e 10).
* **Registro de Votos:** Os participantes podem votar em uma das opções disponíveis em uma enquete ativa. O contrato garante que cada endereço vote apenas uma vez por enquete, prevenindo votos duplicados.
* **Encerramento de Enquetes:** O criador da enquete tem a autoridade para encerrá-la, finalizando a votação e impedindo o registro de novos votos.
* **Consulta de Resultados:** O contrato oferece uma função para visualizar os detalhes de uma enquete específica, incluindo seu título, status (ativa ou encerrada), a descrição de cada opção de voto e a contagem atual de votos para cada opção.
* **Transparência e Imutabilidade:** Por ser um `smart contract` na blockchain Ethereum, todas as ações (criação de enquetes, registro de votos, encerramento) são transparentes e os dados registrados são imutáveis, garantindo a integridade do processo de votação.
* **Emissão de Eventos:** O contrato emite eventos para cada ação significativa, como a criação de uma nova enquete (`EnqueteCriada`), o registro de um voto (`VotoRegistrado`) e o encerramento de uma enquete (`EnqueteEncerrada`). Isso facilita o rastreamento e a auditoria das atividades.

**Potenciais Casos de Uso:**

Embora este seja um exemplo simples, os princípios podem ser aplicados em diversos cenários que exigem votação transparente e segura, como:

* Tomada de decisões em organizações descentralizadas (DAOs).
* Votações informais em comunidades online.
* Pesquisas de opinião descentralizadas.
* Sistemas de governança em projetos `blockchain`.

**Considerações:**

Este projeto serve como um ponto de partida. Implementações mais avançadas poderiam incluir funcionalidades como prazos para votação, diferentes métodos de votação (voto ponderado, voto secreto), delegação de votos e integração com sistemas de identidade descentralizada.

Em resumo, este `smart contract` de enquetes oferece uma solução fundamental para a criação e gerenciamento de votações simples de forma descentralizada e transparente na `blockchain` Ethereum.
