# Análise de Vendas e Gestão de Estoque

**Projeto de portfólio | SQL, Excel e Power BI**

## Contexto
Uma loja fictícia de produtos de limpeza e acessórios precisa acompanhar vendas, faturamento, desempenho dos produtos e níveis de estoque. O objetivo é transformar registros operacionais em informações úteis para a tomada de decisão.

> Todos os dados deste projeto são fictícios e foram criados exclusivamente para fins educacionais.

## Objetivos
- Calcular faturamento e ticket médio.
- Identificar produtos e categorias com melhor desempenho.
- Acompanhar a evolução mensal das vendas.
- Identificar itens abaixo do estoque mínimo.
- Estimar a margem bruta por produto.
- Analisar formas de pagamento.

## Estrutura do projeto
```text
portfolio_analise_vendas_estoque/
├── dados/
│   ├── produtos.csv
│   ├── vendas.csv
│   └── itens_venda.csv
├── sql/
│   ├── 01_criar_tabelas.sql
│   └── 02_consultas_analise.sql
└── README.md
```

## Modelo de dados
- **produtos:** cadastro, categoria, custo, preço e estoque.
- **vendas:** data, cliente e forma de pagamento.
- **itens_venda:** produtos, quantidades e preços praticados em cada venda.

Relacionamentos:
- `vendas` 1:N `itens_venda`
- `produtos` 1:N `itens_venda`

## Como executar
1. Instale o [DB Browser for SQLite](https://sqlitebrowser.org/).
2. Crie um banco SQLite novo.
3. Abra e execute `sql/01_criar_tabelas.sql`.
4. Importe os três arquivos CSV da pasta `dados` para suas respectivas tabelas. Os arquivos usam ponto e vírgula como separador.
5. Abra `sql/02_consultas_analise.sql` e execute as consultas.

## Perguntas de negócio
1. Qual foi o faturamento total no período?
2. Quais produtos venderam mais unidades?
3. Qual categoria gerou maior faturamento?
4. Quais produtos precisam de reposição?
5. Quais produtos apresentaram maior margem bruta estimada?
6. Qual foi o ticket médio das vendas?
7. Como o faturamento evoluiu mês a mês?

## Próximas melhorias
- Criar dashboard no Power BI com indicadores e filtros.
- Desenvolver uma análise complementar no Excel.
- Adicionar controle histórico de entradas e saídas de estoque.
- Investigar sazonalidade e padrões de compra.

## Competências demonstradas
SQL (JOIN, GROUP BY, agregações, subconsultas e LEFT JOIN), modelagem relacional básica, análise exploratória e interpretação de indicadores de negócio.

## Observação metodológica
A margem bruta é uma estimativa calculada pela diferença entre o preço registrado na venda e o custo unitário cadastrado. O estoque atual é um retrato fictício e não é atualizado automaticamente pelas vendas.
