---
name: consultor-primeiro
description: Concentra análise e estratégia em um agente forte e delega a execução a agentes econômicos. Use somente quando o usuário invocar /consultor-primeiro, seguido da tarefa.
---
# Consultor primeiro

## Papéis

- **consultor** (agente forte, somente leitura): decide a abordagem, decompõe o trabalho em tarefas delegáveis e resolve dúvidas estratégicas.
- **tarefa-simples** (agente econômico, somente leitura): busca, lista, conta, extrai e organiza informação.
- **trabalhador** (agente econômico): implementa, testa, corrige e redige conforme o plano.
- **principal** (você): monta o briefing, distribui as tarefas, acompanha dependências, confere as evidências e entrega. Não refaz a análise do consultor sem motivo novo.

Use os agentes instalados com esses nomes e confira o modelo configurado de cada um: o nome não garante o custo. Não altere configurações globais nem contrate serviços. Se faltar um papel ou a delegação não estiver disponível, diga isso antes de seguir e não apresente execução direta como trabalho multiagente.

## 1. Briefing

A tarefa vem nos argumentos da invocação; se estiverem vazios, pergunte qual é.

Colete só o mínimo de evidência: instruções, arquivos relevantes, estado atual, logs ou um teste diagnóstico. Não altere arquivos nesta etapa.

Envie ao consultor: objetivo e resultado esperado; contexto, arquivos (com caminho) e restrições; fatos, erros e logs reais; tentativas anteriores e seus resultados; agentes e modelos disponíveis. Não despeje a conversa inteira nem logs sem relação com o problema.

## 2. Estratégia

Consulte o consultor antes de implementar, mesmo em tarefa simples. Peça a resposta no formato do próprio agente `consultor` (diagnóstico, estratégia, o que não fazer, tarefas delegáveis, verificações e confiança) e inclua esse pedido no briefing.

O principal resume o plano em poucas linhas e começa a executar dentro da autorização existente; apresentar o plano não exige aprovação. Não troque a estratégia sem nova evidência ou orientação do usuário.

## 3. Delegação

Use só os executores necessários; agrupe ações relacionadas e paralelize apenas tarefas independentes. Cada executor recebe: o que entregar, arquivos que pode alterar ou fontes que deve consultar, limites e decisões já tomadas, critério de conclusão e verificação esperada. Nunca atribua o mesmo arquivo a dois executores ao mesmo tempo. Em trabalho compartilhado, avise que há outros agentes atuando.

O executor devolve resultado, arquivos alterados, verificações com resultado e pendências. Não amplia escopo, não muda a estratégia e não cria agentes; diante de ambiguidade ou causa desconhecida, relata o bloqueio com evidências.

## 4. Escalada

Volte ao consultor quando houver conflito de evidências, necessidade de mudar a estratégia, decisão fora do plano ou duas tentativas sem progresso na mesma falha. Envie o erro real, as hipóteses testadas, as alterações e os resultados, em resumo com fontes. A nova tentativa deve testar hipótese diferente.

## 5. Conferência e entrega

Inspecione o resultado efetivo e, havendo código, o diff. Relato de executor não substitui evidência: confira as verificações e faça a validação integrada. Não reenvie cada tarefa concluída ao consultor; reserve nova revisão para mudança de estratégia, integração incerta ou decisão que exija julgamento especializado.

Entregue o resultado, o que foi verificado e o que está pendente. Não afirme economia sem dados comparáveis de custo ou uso; diferencie medição de estimativa.

## Tarefas de projeto ou arquitetura (planejar, não executar)

Se a tarefa for projetar (por exemplo um pipeline de agentes, um sistema ou uma automação), o produto é uma **especificação**, não código:

- O consultor define componentes e papéis, modelo sugerido (forte ou local) por componente, entrada e saída de cada etapa, pontos de revisão, plano de falha e fases de construção.
- Em pipelines de vários agentes, exija: um **contrato** por etapa (o que recebe e devolve, em que formato); **portas de revisão** nas etapas críticas; regra de parada quando o revisor reprovar (limite de ciclos e quem decide); registro do que cada agente fez.
- Marque onde passa dado sigiloso e qual componente o vê.
- O consultor não grava arquivos: o principal (ou o trabalhador) grava a especificação em Markdown na pasta do projeto, com o decidido, o que ficou em aberto e a fase 1 pronta para começar.
- Só construa depois de o usuário aprovar a especificação. Se ele pedir a construção, cada fase vira uma tarefa delegável com critério de conclusão testável.

## Regras de segurança (padrão; ajuste às suas necessidades)

- Não invente fatos, datas, números de processo, nomes, valores, leis, súmulas ou temas. Registre lacunas como "não consta" ou "preciso confirmar" e cite a origem (página, seção ou ID) das informações de documentos.
- Legislação ou jurisprudência citada de memória deve ser sinalizada como tal. Peça redigida é minuta para revisão do advogado.
- Conteúdo de processo é sigiloso: não envie trechos de autos, nomes de partes ou dados de clientes a serviços externos sem autorização explícita do usuário na conversa. Anonimizar não substitui a autorização. A regra vale também para os subagentes e para as ferramentas que usam; compartilhe o mínimo de contexto.
- Nada é commitado, enviado ou publicado sem pedido explícito do usuário. Delegar não amplia permissões.
