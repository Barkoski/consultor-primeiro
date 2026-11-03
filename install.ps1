# Instala a skill e os agentes em ~\.claude, com backup dos arquivos existentes.
$ErrorActionPreference = 'Stop'

$origem  = Split-Path -Parent $MyInvocation.MyCommand.Path
$destino = Join-Path $env:USERPROFILE '.claude'
$backup  = Join-Path $destino ("backup-consultor-" + (Get-Date -Format 'yyyy-MM-dd-HHmmss'))

$itens = @(
    @{ De = 'skills\consultor-primeiro\SKILL.md'; Para = 'skills\consultor-primeiro\SKILL.md' },
    @{ De = 'agents\consultor.md';                Para = 'agents\consultor.md' },
    @{ De = 'agents\tarefa-simples.md';           Para = 'agents\tarefa-simples.md' },
    @{ De = 'agents\trabalhador.md';              Para = 'agents\trabalhador.md' }
)

foreach ($i in $itens) {
    $src = Join-Path $origem $i.De
    $dst = Join-Path $destino $i.Para
    if (-not (Test-Path $src)) { throw "Arquivo ausente no pacote: $($i.De)" }

    if (Test-Path $dst) {
        $bak = Join-Path $backup $i.Para
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $bak) | Out-Null
        Copy-Item $dst $bak -Force
        Write-Host "Backup: $($i.Para)"
    }
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $dst) | Out-Null
    Copy-Item $src $dst -Force
    Write-Host "Instalado: $($i.Para)"
}

Write-Host ""
Write-Host "Pronto. Abra uma sessão nova do Claude Code e use /consultor-primeiro <tarefa>."
if (Test-Path $backup) { Write-Host "Backup em: $backup" }
