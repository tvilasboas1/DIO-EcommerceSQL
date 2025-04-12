📊 Modelo de Banco de Dados para E-Commerce
📝 Descrição do Projeto
Este repositório contém o modelo conceitual e script SQL de um banco de dados para sistema de e-commerce, desenvolvido como parte do desafio do Bootcamp. O esquema foi refinado com as especificações exigidas, garantindo flexibilidade e integridade dos dados.

🔍 Contexto do Modelo Conceitual
O modelo foi projetado para atender às necessidades básicas de um e-commerce, com destaque para:

Principais Entidades e Melhorias Implementadas
Clientes (PJ e PF): Implementação de herança com tabelas separadas para pessoa jurídica e física, garantindo que uma conta só possa ser de um tipo

Pagamentos: Suporte a múltiplos métodos de pagamento por cliente

Entregas: Sistema completo de rastreamento com status e código único

Pedidos: Gestão completa do ciclo de vida do pedido

🛠 Estrutura do Repositório
Copy
ecommerce-db-model/
├── scripts/
│   ├── ecommerce_model.sql  # Script completo de criação do banco
│   └── sample_data.sql      # Dados de exemplo (opcional)
├── assets/
│   ├── diagrama_er.png      # Diagrama completo do modelo
│   └── diagrama_er.pdf      # Versão em alta resolução
└── docs/
    ├── requisitos.md        # Especificações do desafio
    └── decisões_design.md   # Justificativas de design
🎯 Objetivos Alcançados
Implementação de herança para clientes PJ/PF

Suporte a múltiplos métodos de pagamento

Sistema de rastreamento de entregas

Normalização adequada das tabelas

Documentação clara do modelo

▶ Como Utilizar
Execute o script principal:

bash
Copy
mysql -u usuario -p < scripts/ecommerce_model.sql
Para carregar dados de exemplo:

bash
Copy
mysql -u usuario -p ecommerce_db < scripts/sample_data.sql
📊 Diagrama do Modelo
Diagrama Entidade-Relacionamento

🤝 Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para:

Reportar issues

Sugerir melhorias

Enviar pull requests

📄 Licença
Este projeto está licenciado sob a MIT License.
