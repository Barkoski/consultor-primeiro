<p align="center"><img src="assets/capa-consultor.png" alt="Consultor primeiro: estratégia antes da execução, conferência antes da entrega" width="100%"></p>

<p align="center"><strong>Uma equipe de agentes, organizada para pensar, executar e conferir.</strong></p>

<p align="center">Skill gratuita e de código aberto para o Claude Code<br>por <a href="https://github.com/Barkoski">Lucas Barkoski</a></p>

<p align="center"><a href="#instalação"><strong>Instalar a skill</strong></a> &nbsp; · &nbsp; <a href="#como-funciona">Como funciona</a> &nbsp; · &nbsp; <a href="#exemplos">Ver exemplos</a> &nbsp; · &nbsp; <a href="#limites-e-cuidados">Limites e cuidados</a></p>

---

## O que é?

O **Consultor Primeiro** é uma instrução pronta para o Claude Code trabalhar de forma mais organizada. Ele é uma *skill*: pense nela como um roteiro de trabalho que você instala uma vez e usa sempre que precisar.

Você faz o pedido em português normal. A ferramenta orienta o Claude a primeiro pensar no caminho, depois fazer o trabalho e, por fim, conferir a entrega.

**Um exemplo:** você pede para revisar uma petição. O consultor analisa o que precisa ser verificado; os agentes necessários examinam a peça; e o responsável pela sessão confere o resultado e apresenta os pontos de atenção. A revisão do advogado continua indispensável.

**A skill é gratuita e tem código aberto.** Para usá-la, é necessário ter acesso ao Claude Code. O serviço e os modelos podem ter custos ou limites, conforme o plano e a configuração de cada pessoa.

## Como usar

Depois de [instalar](#instalação), abra uma nova sessão do Claude Code. Digite `/consultor-primeiro`, dê um espaço e escreva seu pedido. Por exemplo:

```text
/consultor-primeiro Revise a petição que está na pasta Documentos.
Aponte os argumentos que precisam de mais provas e o que devo conferir.
```

Pronto! Para ajudar, diga **o que você quer**, **onde estão os arquivos** e **como deseja receber o resultado**. Se estiver falando sobre um documento, indique o arquivo correto e peça que a resposta cite as páginas ou os IDs.

## O que acontece depois do pedido?

<p align="center"><img src="assets/etapas-consultor.svg" alt="Briefing, estratégia, execução e conferência" width="100%"></p>

1. **Entender:** o Claude reúne as informações necessárias para a tarefa.
2. **Planejar:** um agente consultor examina o pedido e indica como abordá-lo.
3. **Fazer:** os agentes necessários executam as partes do trabalho. O consultor também pode executar uma tarefa.
4. **Conferir:** o agente principal verifica a entrega e informa o que foi ou não validado.

Os agentes são instruções para diferentes funções dentro do Claude Code. Se algum deles não estiver disponível, a skill orienta informar isso antes de continuar. A conferência da IA **não garante** que o resultado esteja correto.

## Exemplos para copiar e adaptar

Substitua as referências aos arquivos pelos documentos que você pretende usar. Antes de compartilhar dados de clientes, leia os [cuidados com sigilo](#limites-e-cuidados).

### Entender um processo

```text
/consultor-primeiro Leia o PDF que indiquei e faça uma linha do tempo do
processo. Para cada acontecimento, informe a data, o que aconteceu e a
página ou o ID do documento. Se uma informação não estiver clara, avise.
```

### Revisar uma petição antes do protocolo

```text
/consultor-primeiro Revise a petição que indiquei. Veja se os fatos narrados
estão apoiados nos documentos, aponte argumentos frágeis e diga o que o INSS
ou o juiz poderiam questionar. Não invente informações e cite as fontes.
```

### Conferir o que falta para um pedido

```text
/consultor-primeiro Leia os documentos que indiquei e faça uma tabela com:
o que cada documento comprova, o que ainda precisa ser esclarecido e quais
documentos podem estar faltando. Informe a página ou o ID de cada fonte.
```

### Organizar um processo administrativo do INSS

```text
/consultor-primeiro Organize o processo administrativo que indiquei. Resuma
o pedido, os documentos apresentados, as exigências e a decisão do INSS.
Cite a página ou o ID de cada informação e destaque o que não consta.
```

### Preparar uma minuta para revisão

```text
/consultor-primeiro Com base apenas nos documentos indicados e na análise
já feita, prepare uma minuta para minha revisão. Não invente fatos nem fontes.
Marque com [VERIFICAR] o que depender da minha confirmação.
```

### Comparar o que dizem dois documentos

```text
/consultor-primeiro Compare os dois documentos que indiquei. Mostre em uma
tabela os pontos em que concordam, as diferenças e o que precisa ser
confirmado. Indique a página ou o ID de cada informação.
```

### Usar fora do trabalho jurídico

```text
/consultor-primeiro Leia os arquivos da pasta que indiquei e organize uma
lista com o nome de cada documento e um resumo curto do seu conteúdo.
Informe se algum arquivo não puder ser lido.
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

<details>
<summary><strong>Detalhes para quem quer saber como os agentes são configurados</strong></summary>

| Agente | Função | Modelo configurado |
| --- | --- | --- |
| Consultor | Analisa, orienta e também pode executar | Opus; a skill orienta tentar Fable primeiro quando disponível |
| Trabalhador | Executa tarefas como redação, correções e testes | Sonnet |
| Tarefa simples | Busca e organiza informações, sem editar arquivos | Haiku |
| Principal | Organiza, acompanha e confere o trabalho | Modelo da sessão |

A disponibilidade depende do ambiente e do plano. A skill não mede nem garante economia.

</details>

## Arquivos e documentação

- [Instruções da skill](skills/consultor-primeiro/SKILL.md)
- [Agente consultor](agents/consultor.md) · [Trabalhador](agents/trabalhador.md) · [Tarefa simples](agents/tarefa-simples.md)
- [Instalador com backup](install.ps1) · [Licença MIT](LICENSE)

---

Criado por [Lucas Barkoski](https://github.com/Barkoski).
