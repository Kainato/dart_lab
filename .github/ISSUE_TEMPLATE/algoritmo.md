---
name: Algoritmo Beecrowd
about: Documentar um novo problema de algoritmo do site Beecrowd para resolver
title: "[ALGORITMO]"
labels: algorithm, beecrowd
assignees: ""
---

## [CÓDIGO DO PROBLEMA] - [TÍTULO DO PROBLEMA]

## 📌 Descrição

[Descrição sucinta do objetivo do algoritmo, contextualizando a necessidade e o problema a ser resolvido.]

## 📋 Regras do Negócio

1. **[Nome da Regra/Etapa 1]:** [Detalhamento da condição, lógica, limite ou cálculo.]
2. **[Nome da Regra/Etapa 2]:**

A. **[Condição A]:** [Resultado ou comportamento esperado]

B. **[Condição B]:** [Resultado ou comportamento esperado]

## 📥 Estrutura de Entrada

[Descrição do fluxo de leitura.]

- **[Elemento/Cabeçalho]:** [Descrição dos tipos de dados e limites, e.g., 1 \le N \le 100].
- **[Corpo/Linhas seguintes]:** [Formato dos dados processados].
- **[Critério de parada]:** [Condição para encerrar a leitura, se houver].

## 📤 Estrutura de Saída

- [Descrição do formato esperado de resposta.]
- [Detalhamento de padrão de texto, caracteres específicos ou formatação].

## 🧪 Exemplo de Teste

### Entrada

[Inserir aqui o exemplo de entrada dado pelo problema]

### Saída Esperada

[Inserir aqui o exemplo de saída esperada dado pelo problema]

## ✅ Critérios de Aceite

### Estrutura de Diretórios e Arquivos

- **Código-fonte (`lib/`):** A resolução deve ser armazenada em `lib/beecrowd/level_[dificuldade]/[código_numerico_do_problema]/`, contendo obrigatoriamente:
  - Script em Dart (`.dart`) com a implementação da solução.
  - Arquivo Markdown (`.md`) com a descrição do problema e a explicação detalhada da abordagem adotada seguindo uma estrutura fixa.
    - [Código do Problema] - [Título do Problema]
      - Contexto
      - Entrada
      - Saída
      - Exemplo de entrada
      - Exemplo de saída
    - Forma de Resolução
      - Pensamento do problema
      - Abordagem da solução
      - Exemplo passo a passo
      - Implementação em dart
      - Complexidade
- **Testes Unitários (`test/`):** A suíte de testes deve seguir a mesma árvore de diretórios em `test/beecrowd_test/level_[dificuldade]/[código_numerico_do_problema]/`, contendo:
  - O arquivo de teste automatizado correspondente.
  - A documentação/explicação da estratégia de teste aplicada seguindo uma estrutura fixa.
    - Teste do problema [Código do Problema] - [Título do Problema]
      - Objetivo do teste
      - Estrutura do teste
      - Resultado esperado

### Comportamento e Processamento

- O algoritmo deve processar corretamente o fluxo de dados de entrada e saída: `[descrever comportamento global de entrada/saída]`.
- A implementação deve seguir as boas práticas de Clean Code e diretrizes de desenvolvimento em Dart.

### Validação Técnica

- `[Condição de validação técnica essencial "n", ex: Cobertura mínima de testes, tratamento de edge cases, etc.]`