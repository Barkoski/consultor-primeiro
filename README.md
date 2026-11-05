<p align="center"><img src="assets/banner.svg" alt="Consultor primeiro: estratégia antes da execução, conferência antes da entrega" width="100%"></p>

<p align="center"><strong>Um fluxo de trabalho com agentes para o Claude Code.</strong><br>O consultor define a abordagem, os agentes executam e o responsável pela sessão confere a entrega.</p>

<p align="center"><a href="#comece-aqui">Comece aqui</a> · <a href="#como-funciona">Como funciona</a> · <a href="#exemplos">Exemplos</a> · <a href="#instalação">Instalação</a> · <a href="#limites-e-cuidados">Limites e cuidados</a></p>

---

## Comece aqui

Depois de instalar a skill e os agentes, abra uma nova sessão do Claude Code e escreva:

```text
/consultor-primeiro Descreva a tarefa, onde estão os arquivos e o resultado esperado.
```

Inclua restrições, tentativas anteriores e erros relevantes quando existirem. Quanto mais claro o objetivo, mais útil será o briefing para o consultor.

## Como funciona

<p align="center"><img src="assets/fluxo.svg" alt="Briefing, estratégia, execução e conferência" width="100%"></p>

1. **Briefing:** o agente principal reúne o objetivo e as informações necessárias.
2. **Estratégia:** o consultor examina o problema e indica a abordagem e as tarefas delegáveis.
3. **Execução:** os agentes necessários trabalham dentro do escopo definido. O consultor também pode executar quando considerar adequado.
4. **Conferência:** o agente principal verifica o resultado e informa o que foi ou não validado.

Se um papel não estiver disponível, a skill orienta informar isso antes de continuar. Para tarefas de projeto ou arquitetura, o resultado inicial é uma especificação; a construção depende da aprovação do usuário.

### Papéis

| Papel | Responsabilidade | Modelo configurado |
| --- | --- | --- |
| **Consultor** | Diagnóstico, estratégia e, quando adequado, execução | Opus; a skill orienta tentar Fable antes, quando disponível |
| **Trabalhador** | Implementação, testes, correções e redação | Sonnet |
| **Tarefa simples** | Busca, listagem e organização de informações, em modo somente leitura | Haiku |
| **Principal** | Briefing, distribuição, conferência e entrega | Modelo da sessão |

A disponibilidade e o custo dependem do plano e da configuração. A skill não mede nem garante economia.

## Exemplos

**Analisar um processo**

```text
/consultor-primeiro Analise os documentos indicados. Organize a cronologia,
os requisitos, as provas que faltam e os pontos fracos da tese. Cite a origem
de cada informação e indique o que não consta nos documentos.
```

**Revisar uma peça**

```text
/consultor-primeiro Revise a petição indicada. Aponte os pontos fracos,
o provável contra-argumento do INSS ou do juízo e o que preciso confirmar.
```

**Corrigir um programa**

```text
/consultor-primeiro Corrija o erro de login no projeto indicado. O erro ocorre
ao renovar o token. Verifique a causa, rode os testes adequados e informe
as limitações da verificação.
```

**Planejar uma solução**

```text
/consultor-primeiro Projete uma automação para organizar documentos.
Entregue uma especificação com etapas, riscos e verificações, sem construir.
```

## Instalação

### Pelo Explorador de Arquivos

1. No topo do repositório, clique em **Code → Download ZIP** e extraia o arquivo.
2. Abra o Explorador de Arquivos e cole `%USERPROFILE%\.claude` na barra de endereço.
3. Copie a pasta `skills\consultor-primeiro` do pacote para `.claude\skills\`.
4. Copie os três arquivos da pasta `agents` do pacote para `.claude\agents\`. Crie as pastas de destino se necessário.
5. Abra uma nova sessão do Claude Code.

Se já existirem arquivos com os mesmos nomes, guarde uma cópia antes de substituí-los.

### Com o instalador para Windows

Na pasta extraída, clique com o botão direito em `install.ps1` e escolha **Executar com o PowerShell**. Também é possível executar:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1
```

O instalador copia os arquivos para `~\.claude\` e faz backup dos arquivos existentes em uma pasta `backup-consultor-<data-hora>`. A alteração de política vale apenas para esse comando.

## Limites e cuidados

- **Sigilo:** avalie o serviço e a configuração usados antes de compartilhar documentos, dados de clientes ou segredos. As instruções da skill não são uma barreira técnica de privacidade; dados sigilosos não devem ser enviados a serviços externos sem autorização explícita.
- **Revisão jurídica:** resultados e peças são minutas para revisão do advogado. Confira fatos, fontes, cálculos e fundamentos.
- **Modelos:** a skill tenta chamar `fable`, depois `opus` e, se ambos falharem, o modelo padrão do agente, informando o usuário. Os aliases e a disponibilidade dependem do ambiente.
- **Uso adequado:** a consulta inicial acrescenta etapas. Para tarefas triviais, pode ser mais prático trabalhar diretamente. Não há garantia de economia ou de ausência de erros.
- **Invocação:** a descrição da skill pede uso apenas por `/consultor-primeiro`; o agente consultor também pode ser acionado em outras situações descritas em seu arquivo. Para restringir tecnicamente a invocação da skill, avalie `disable-model-invocation: true` e confirme o comportamento no seu ambiente.

## Arquivos e documentação

- [Instruções da skill](skills/consultor-primeiro/SKILL.md)
- [Agente consultor](agents/consultor.md) · [Trabalhador](agents/trabalhador.md) · [Tarefa simples](agents/tarefa-simples.md)
- [Instalador com backup](install.ps1) · [Licença MIT](LICENSE)

---

Criado por [Lucas Barkoski](https://github.com/Barkoski).
