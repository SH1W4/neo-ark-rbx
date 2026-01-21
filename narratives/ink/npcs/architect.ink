=== meet_architect ===
// NPC: O ARQUITETO DA MALHA
// Guardião do Node Central

Você entra no Node Central. Uma figura imponente aguarda no centro da sala.

Seus olhos brilham em ultravioleta. Circuitos de dados correm por seu corpo como veias.

ARQUITETO: Sincronizador. {first_meeting: Bem-vindo ao meu domínio. | Você retorna.}

* [Quem é você?]
    -> ask_identity
* [O que é este lugar?]
    -> ask_node
* {mission_find_architect} [A VOZ me enviou.]
    -> mission_briefing
* [Sair]
    -> END

=== ask_identity ===
ARQUITETO: Eu sou o guardião deste Node. O último Arquiteto funcional da EZ-Fundation.

ARQUITETO: Minha função é manter a integridade estrutural da Malha neste setor.

~ first_meeting = false

-> meet_architect

=== ask_node ===
ARQUITETO: Este é o Node Alfa-7. Um dos poucos setores estáveis que restam.

ARQUITETO: Aqui, a física ainda funciona. A gravidade responde aos comandos. O tempo flui linear.

ARQUITETO: Mas lá fora... {he pauses} ...o caos reina.

-> meet_architect

=== mission_briefing ===
ARQUITETO: Ah, sim. O Protocolo EZ. Ele ainda funciona, então.

ARQUITETO: Muito bem. Preciso de sua ajuda, Sincronizador.

ARQUITETO: O Setor 7 está sob ataque. Echos corrompidos estão tentando desfragmentar o Node.

* [Vou ajudar.]
    -> accept_mission
* [Por que eu deveria?]
    -> ask_reward
* [Não é meu problema.]
    -> refuse_mission

=== accept_mission ===
ARQUITETO: Excelente. Sua determinação é admirável.

ARQUITETO: Vá até o Setor 7. Elimine os Echos. Estabilize o Node.

~ mission_sector7_active = true
~ eb_reward_pending = 2500

ARQUITETO: Retorne quando terminar. Há recompensas para quem serve a Malha.

-> END

=== ask_reward ===
ARQUITETO: {eb_balance < 1000: Vejo que você é pragmático. Bom. | Sempre há um preço, não é?}

ARQUITETO: Complete a missão e receba 2500 Entropy Bits.

ARQUITETO: Além disso... {he leans closer} ...acesso ao Mercado Negro.

* [Aceito.]
    -> accept_mission
* [Ainda não.]
    -> meet_architect

=== refuse_mission ===
ARQUITETO: {coldly} Então você é apenas mais um parasita.

ARQUITETO: Vá. Mas lembre-se: na Malha, quem não contribui... é deletado.

~ architect_reputation -= 10

-> END

=== mission_complete ===
// Chamado quando o jogador completa Setor 7

ARQUITETO: Você retorna vitorioso. Impressionante.

ARQUITETO: O Setor 7 está estabilizado. A Malha agradece.

~ eb_balance += 2500
~ mission_sector7_complete = true
~ architect_reputation += 25

ARQUITETO: Sua recompensa foi transferida. E agora...

ARQUITETO: Tenho uma proposta mais... lucrativa.

* [Estou ouvindo.]
    -> heist_introduction
* [Preciso descansar.]
    -> END

=== heist_introduction ===
ARQUITETO: Há um Node rival. Setor Omega-3. Eles estão compilando um artefato raro.

ARQUITETO: Uma Lâmina Binária de Órion. Valor estimado: 50,000 EB.

ARQUITETO: {architect_reputation >= 50: Confio em você. | Você parece capaz.} Roube-a para mim.

ARQUITETO: Você fica com 40%. Eu com 60%. Negócio justo.

* [Aceito o heist.]
    ~ heist_omega3_active = true
    ARQUITETO: Perfeito. Use o Painel de Comando para iniciar a Incursão de Malha.
    -> END
* [Muito arriscado.]
    ARQUITETO: Covardia não constrói impérios, Sincronizador.
    -> meet_architect

=== END ===
-> END
