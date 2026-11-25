<p align="center"><img src="assets/capa-consultor.png" alt="Consultor primeiro: estratégia antes da execução" width="100%"></p>

<p align="center"><strong>Primeiro pensar, depois fazer, por fim conferir.</strong><br>
Skill gratuita e de código aberto para o Claude Code.</p>

<p align="center">Criado por <a href="https://github.com/Barkoski">Lucas Barkoski</a></p>

<p align="center"><a href="#instalacao">Instalar</a> · <a href="#como-usar">Como usar</a> · <a href="#exemplos">Exemplos</a> · <a href="#limites">Limites e cuidados</a></p>

---

<a id="o-que-e"></a>
## O que é

O **Consultor Primeiro** é uma *skill* para o Claude Code. Uma skill é um roteiro de trabalho: você instala uma vez e chama quando precisar.

Com ela, o Claude não sai fazendo logo de cara. Primeiro, um agente consultor estuda o pedido e traça o plano. Depois, agentes mais simples executam as partes. No fim, o Claude confere o resultado e diz o que foi ou não verificado.

**Para quem é:** quem usa o Claude Code e quer mais método em tarefas que exigem cuidado, como revisar uma petição, organizar um processo ou comparar documentos. Os exemplos são jurídicos, mas a skill serve para qualquer tarefa.

A skill é gratuita. Para usá-la, você precisa ter acesso ao Claude Code. O serviço e os modelos podem ter custos ou limites, conforme o seu plano.

<a id="como-funciona"></a>
## O que acontece depois do pedido

<p align="center"><img src="assets/etapas-consultor.svg" alt="Briefing, estratégia, execução e conferência" width="100%"></p>

1. **Briefing:** o Claude reúne só as informações necessárias para a tarefa.
2. **Estratégia:** o agente consultor examina o pedido e indica o caminho.
3. **Execução:** os agentes executam as partes do trabalho. O consultor também pode executar, quando achar melhor.
4. **Conferência:** o Claude verifica a entrega e informa o que foi ou não validado.

Se algum agente não estiver instalado, a skill manda avisar antes de continuar. A conferência feita pela IA **não garante** que o resultado esteja certo.

<a id="instalacao"></a>
## Instalação

São quatro arquivos: a skill e três agentes. Você pode instalar de dois jeitos.

### Com o instalador (Windows)

1. No topo desta página, clique em **Code → Download ZIP** e extraia o arquivo.
2. Na pasta extraída, clique com o botão direito em `install.ps1` e escolha **Executar com o PowerShell**.
3. Abra uma nova sessão do Claude Code.

Se preferir o terminal, rode dentro da pasta extraída:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1
```

A liberação de execução vale só para esse comando. O instalador copia os arquivos para `%USERPROFILE%\.claude\`. Se já existir algum arquivo com o mesmo nome, ele guarda uma cópia antes em `%USERPROFILE%\.claude\backup-consultor-<data-hora>`.

### À mão

1. Baixe o ZIP (**Code → Download ZIP**) e extraia.
2. No Explorador de Arquivos, cole `%USERPROFILE%\.claude` na barra de endereço. Crie as pastas `skills` e `agents` se não existirem.
3. Copie a pasta `skills\consultor-primeiro` do pacote para `.claude\skills\`.
4. Copie os três arquivos da pasta `agents` do pacote para `.claude\agents\`.
5. Abra uma nova sessão do Claude Code.

Se já houver arquivos com os mesmos nomes, guarde uma cópia antes de substituir.

<a id="como-usar"></a>
## Como usar

Digite `/consultor-primeiro`, um espaço e o seu pedido, com suas palavras:

```text
/consultor-primeiro Revise a petição que está na pasta Documentos.
Aponte os argumentos que precisam de mais provas e o que devo conferir.
```

Para um bom resultado, diga:

- **o que você quer**;
- **onde estão os arquivos**;
- **como quer receber a resposta** (lista, tabela, minuta).

Se o pedido envolver um documento, peça que a resposta cite a página ou o ID de cada informação.

<a id="exemplos"></a>
## Exemplos para copiar e adaptar

Troque as referências pelos seus arquivos. Antes de usar dados de clientes, leia os [cuidados com sigilo](#limites).

**Entender um processo**

```text
/consultor-primeiro Leia o PDF que indiquei e faça uma linha do tempo do
processo. Para cada acontecimento, informe a data, o que aconteceu e a
página ou o ID do documento. Se uma informação não estiver clara, avise.
```

**Revisar uma petição antes do protocolo**

```text
/consultor-primeiro Revise a petição que indiquei. Veja se os fatos narrados
estão apoiados nos documentos, aponte argumentos frágeis e diga o que o INSS
ou o juiz poderiam questionar. Não invente informações e cite as fontes.
```

**Conferir o que falta para um pedido**

```text
/consultor-primeiro Leia os documentos que indiquei e faça uma tabela com:
o que cada documento comprova, o que ainda precisa ser esclarecido e quais
documentos podem estar faltando. Informe a página ou o ID de cada fonte.
```

**Organizar um processo administrativo do INSS**

```text
/consultor-primeiro Organize o processo administrativo que indiquei. Resuma
o pedido, os documentos apresentados, as exigências e a decisão do INSS.
Cite a página ou o ID de cada informação e destaque o que não consta.
```

**Preparar uma minuta para revisão**

```text
/consultor-primeiro Com base apenas nos documentos indicados e na análise
já feita, prepare uma minuta para minha revisão. Não invente fatos nem fontes.
Marque com [VERIFICAR] o que depender da minha confirmação.
```

**Comparar dois documentos**

```text
/consultor-primeiro Compare os dois documentos que indiquei. Mostre em uma
tabela os pontos em que concordam, as diferenças e o que precisa ser
confirmado. Indique a página ou o ID de cada informação.
```

**Fora do trabalho jurídico**

```text
/consultor-primeiro Leia os arquivos da pasta que indiquei e organize uma
lista com o nome de cada documento e um resumo curto do seu conteúdo.
Informe se algum arquivo não puder ser lido.
```

<a id="limites"></a>
## Limites e cuidados

- **Sigilo:** a skill orienta não enviar dados de clientes a serviços externos sem sua autorização. Mas isso é uma instrução, não uma trava técnica. Antes de usar documentos sigilosos, avalie o serviço e a configuração que você usa.
- **Revisão do advogado:** peças e análises são minutas. Confira fatos, fontes, cálculos e fundamentos.
- **Sem garantia:** a etapa de consulta acrescenta passos. Para tarefas muito simples, pode ser mais prático pedir direto. A skill não garante economia nem ausência de erros.
- **Modelos:** a skill tenta chamar o consultor com o modelo `fable`. Se não estiver liberado, tenta `opus`. Se ambos falharem, usa o modelo padrão do agente e avisa você. O que está disponível depende do seu plano.
- **Quando é acionada:** a skill foi escrita para rodar só quando você digita `/consultor-primeiro`. Já o agente consultor também pode ser chamado em outras situações, descritas no [arquivo dele](agents/consultor.md) (por exemplo, quando uma tarefa falha duas vezes seguidas).

<details>
<summary><strong>Como os agentes estão configurados</strong></summary>

| Agente | Função | Modelo configurado |
| --- | --- | --- |
| Consultor | Analisa, planeja e, quando necessário, executa | Opus (a skill tenta Fable antes, se disponível) |
| Trabalhador | Executa: redige, corrige, implementa e testa | Sonnet |
| Tarefa simples | Busca e organiza informações, sem alterar arquivos | Haiku |
| Principal | Organiza, acompanha e confere o trabalho | Modelo da sessão |

Para impedir tecnicamente que o Claude acione a skill por conta própria, você pode avaliar a opção `disable-model-invocation: true` no cabeçalho do `SKILL.md` e confirmar o comportamento no seu ambiente.

</details>

<a id="documentacao"></a>
## Arquivos

- [Instruções da skill](skills/consultor-primeiro/SKILL.md)
- Agentes: [consultor](agents/consultor.md) · [trabalhador](agents/trabalhador.md) · [tarefa simples](agents/tarefa-simples.md)
- [Instalador com backup](install.ps1)

## Licença

Distribuído sob a [licença MIT](LICENSE).

---

Criado por [Lucas Barkoski](https://github.com/Barkoski).
