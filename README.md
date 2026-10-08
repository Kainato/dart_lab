# 💙 Dart Lab

Coleção de resoluções de problemas de estudo de algoritmo desenvolvidas em **Dart**. O objetivo deste repositório é praticar a sintaxe da linguagem, lógica de programação, estruturas de dados e algoritmos.

![Linguagem](https://img.shields.io/badge/Linguagem-Dart-blue?logo=dart)

## 📊 Estatísticas

### 📁 Pasta Beecrowd

| Problemas Resolvidos | Nível 1 | Nível 2 | Nível 3 | Nível 4 | Nível 5 | Nível 6 | Nível 7 | Nível 8 | Nível 9 |
| -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- |
| 27 / 2443 | 17 🩵 | 6 🧡 | 1 💚 | 1 ❤️ | 2 🤎 | 0 💜 | 0 🩷 | 0 🖤 | 0 💙 |

---

## 📁 Estrutura do Projeto

O projeto é estruturado como um aplicativo Dart em linha de comando padrão:

```text
.
├── bin/          # Pontos de entrada executáveis das soluções
├── lib/          # Resoluções de questões agrupadas por sites
│   └── beecrowd/ # Resoluções de problemas do Beecrowd
│       └── level_n/
│           └── NNNN/
│               ├── NNNN.dart    # Solução do problema
│               └── NNNN.md      # Explicação do problema e solução
|   └── extras/   # Resoluções de outras ideias
└── test/         # Testes unitários para validar o funcionamento das soluções
```

> **Nota:** Em caso de múltiplas soluções para o mesmo problema, arquivos adicionais podem ser criados (ex: `1000_v2.dart`, `1000_otimizado.dart`).

## 🚀 Como Executar os Códigos

1. Clone o repositório para a sua máquina:

```bash
git clone https://github.com/seu-usuario/dart_lab.git
```

2. Entre no seu repositório

```bash
cd dart_lab
```

3. Execute o arquivo desejado com o interpretador ou compilador da linguagem

```bash
dart run dart_training.dart # Caminho do arquivo na pasta "bin"
```

## 📌 Boas Práticas Adotadas

- **Organização por Problema:** Cada problema tem sua própria pasta, facilitando a localização e manutenção.
- **Documentação Integrada:** Cada solução inclui um arquivo `.md` com a descrição completa do problema.
- **Nomeação Clara:** Problemas identificados por números de 4 dígitos (ex: `0001`, `1001`, `2345`).
- **Código Limpo:** Soluções sem comentários de enunciado no código-fonte, mantendo apenas comentários explicativos do algoritmo.
- **Busca por Eficiência:** Soluções focadas em menor complexidade de tempo O(N) e de memória.
- **Estrutura Consistente:** Organização por nível de dificuldade (`level_1` a `level_5`).
