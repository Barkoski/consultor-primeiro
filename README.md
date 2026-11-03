# consultor-primeiro

Skill e agentes para o Claude Code que separam **pensar** de **executar**: um agente master (Fable, se o seu plano liberar; senão Opus) analisa, monta o plano e, quando julga necessário, também executa; agentes mais baratos (Sonnet e Haiku) executam o resto. O Claude principal coordena e confere o resultado.

Uso: digite `/consultor-primeiro` seguido da tarefa.

## O que vem aqui

| Arquivo | Papel | Modelo | Ferramentas |
|---|---|---|---|
| `skills/consultor-primeiro/SKILL.md` | Fluxo: briefing, estratégia, delegação, escalada, conferência | — | — |
| `agents/consultor.md` | Agente master: diagnóstico, estratégia, tabela de tarefas delegáveis; executa quando julga necessário | fable → opus (a skill tenta Fable e cai para Opus; padrão do arquivo: opus) | Read, Grep, Glob, Bash, Edit, Write |
| `agents/trabalhador.md` | Implementa, testa, corrige e redige | sonnet | Read, Grep, Glob, Bash, Edit, Write |
| `agents/tarefa-simples.md` | Busca, lista, conta e organiza (somente leitura) | haiku | Read, Grep, Glob, Bash |

## Instalação

### Sem terminal (recomendado)

1. No GitHub, clique em **Code → Download ZIP** e extraia.
2. Abra `C:\Users\<seu usuário>\.claude\` no Explorador de Arquivos (cole `%USERPROFILE%\.claude` na barra de endereço).
3. Copie a pasta `skills\consultor-primeiro` para dentro de `.claude\skills\` e os três arquivos de `agents\` para dentro de `.claude\agents\` (crie as pastas se não existirem).
4. Abra uma sessão nova do Claude Code.

Se já houver arquivos com os mesmos nomes, guarde uma cópia antes de sobrescrever.

### Com o script

Clique com o botão direito em `install.ps1` → **Executar com o PowerShell**, ou rode:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1
```

O script copia os arquivos para `~\.claude\` e, antes de sobrescrever, salva os existentes em `~\.claude\backup-consultor-<data-hora>\`. O bypass vale só para esse comando.

## Como usar

A skill é **universal**: ela não tem uma tarefa fixa. Você escreve a tarefa em linguagem natural depois de `/consultor-primeiro`, e o contexto (arquivos, área, restrições) define o que o consultor planeja e quem executa. Serve para código, jurídico, documentos, pesquisa, automações e projetos.

### Exemplo jurídico

```
/consultor-primeiro Preciso que você analise o processo em C:\Casos\caso-001\autos.pdf
(aposentadoria por tempo de contribuição, indeferida pelo INSS). Quero: cronologia dos
fatos relevantes, requisitos atendidos e não atendidos, provas que faltam, pontos fracos
da tese e o contra-argumento provável do INSS. Cite a página de cada informação.
Se faltar dado, diga "não consta". Entregue um relatório em Markdown e, se fizer sentido,
uma minuta de petição inicial para eu revisar.
```

Como o consultor trabalha aqui: lê o material, define a abordagem, entrega a análise e distribui o restante (por exemplo, `tarefa-simples` para extrair datas e páginas, `trabalhador` para redigir a minuta). O principal confere as citações antes de entregar. O resultado é minuta para revisão do advogado.

Cuidado com o sigilo: o conteúdo enviado é processado na nuvem do serviço do Claude. Use dados anonimizados ou apenas o que você decidiu conscientemente que pode ser processado.

Variações, no mesmo modelo:

```
/consultor-primeiro Analise este processo administrativo e me dê o resumo dos prazos
e das exigências pendentes, com a fonte de cada item.
```

### Exemplo de desenvolvimento

```
/consultor-primeiro Corrija o erro de login em C:\projetos\meu-app. O erro é: "401 ao
renovar o token". Já tentei limpar o cache e reiniciar o servidor. Rode os testes no fim
e me diga o que não foi verificado.
```

### Exemplo de projeto (só planejar)

```
/consultor-primeiro Projete um pipeline de agentes com 2 orquestradores, 1 revisor e
12 modelos locais. Entregue só a especificação.
```

### Dicas

- Dê objetivo, caminhos de arquivos, restrições e o que já foi tentado.
- Diga o formato do resultado (relatório, tabela, código, minuta).
- Em tarefas de projeto, o resultado é uma especificação em Markdown; a construção só começa depois que você aprova.

## Quando não usar

A skill **sempre** consulta o agente master (Fable ou Opus) antes de executar. Em tarefas triviais (renomear um arquivo, responder uma pergunta curta) isso custa mais do que fazer direto. Use-a para trabalho médio ou grande. A skill não mede nem garante economia.

## Sigilo e limitações

- Os subagentes rodam no mesmo serviço do Claude Code, na nuvem. As regras de sigilo do texto são instruções ao modelo, não uma barreira técnica: **não cole dados de clientes ou segredos** sem decidir conscientemente que podem ser processados.
- A skill pede que o modelo cite fonte, não invente fatos e trate peças como minutas. Isso reduz erros, mas não os elimina: confira sempre.
- O agente `consultor` também pode ser acionado fora da skill, pela descrição dele (falha repetida, decisão de arquitetura). Se quiser só a invocação explícita, apague a segunda frase da `description` dele.
- A skill só deve disparar quando você a invoca. A restrição está na `description`. Para travar tecnicamente, acrescente `disable-model-invocation: true` ao frontmatter da skill e confirme que `/consultor-primeiro` ainda funciona no seu aplicativo.
- A seção "Regras de segurança" da skill traz um padrão voltado a trabalho jurídico (não inventar, sigilo, minuta). Edite-a para o seu contexto.
- Modelos usados: aliases `opus`, `sonnet` e `haiku`, que precisam estar disponíveis no seu plano.

## Licença

MIT. Veja `LICENSE`.
