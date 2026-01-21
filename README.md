# 🕶️ NEO-ARKAIA: Protocolo Symbeon

**Neo-Arkaia** é um ecossistema de jogo sistêmico e scifi construído para Roblox, utilizando o poder do **Rojo** para um fluxo de trabalho de engenharia profissional.

## 🚀 Arquitetura do Projeto

O projeto segue a estrutura padrão Rojo para máxima modularidade:

- `src/server`: Lógica autoritativa do servidor (DataStore, NPCs, Economia).
- `src/client`: Interfaces de usuário (HUD, Diálogos) e efeitos visuais locais.
- `src/shared`: Módulos compartilhados e definições de dados (Ink Runtime, Combat System).
- `narratives/`: Histórias branching escritas em **Ink.js** e compiladas para Luau.

## 🛠️ Setup de Desenvolvimento

### Pré-requisitos
- [Rojo](https://rojo.space/) (v7.0+)
- [Roblox Studio](https://www.roblox.com/create)
- [Visual Studio Code](https://code.visualstudio.com/)

### Como Rodar
1. No terminal, execute o servidor Rojo:
   ```bash
   rojo serve
   ```
2. No Roblox Studio, abra o plugin do Rojo e clique em **Connect**.
3. Os arquivos em `src/` serão sincronizados automaticamente com o Studio.

## 🌌 Visão Geral: Protocolo Symbeon
Este repositório é o núcleo da infraestrutura tecnológica de Neo-Arkaia, integrando economia de "Idle Yield", sistemas de Heist cross-server e uma narrativa profunda baseada na arqueologia digital do projeto AION.

---
**Desenvolvido por [Symbeon Labs] com Antigravity Engine.**
