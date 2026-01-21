=== meet_hierophant ===
// NPC: O HIEROFANTE DA MALHA
// Guardião do Node Central

Você entra no Node Central. Uma figura imponente aguarda no centro da sala.

Seus olhos brilham em ultravioleta. Circuitos de dados correm por seu corpo como veias.

HIEROFANTE: Sincronizador. {first_meeting: Bem-vindo ao meu domínio. | Você retorna.}

* [Quem é você?]
    -> ask_identity
* [O que é este lugar?]
    -> ask_node
* {mission_find_architect} [A VOZ me enviou.]
    -> mission_briefing
* [Sair]
    -> END

=== ask_identity ===
HIEROFANTE: Eu sou o guardião deste Node. O último Hierofante funcional da EZ-Fundation.

HIEROFANTE: Minha função é manter a integridade estrutural da Malha neste setor.

~ first_meeting = false

-> meet_hierophant

=== ask_node ===
HIEROFANTE: Este é o Node Alfa-7. Um dos poucos setores estáveis que restam.

HIEROFANTE: Aqui, a física ainda funciona. A gravidade responde aos comandos. O tempo flui linear.

HIEROFANTE: Mas lá fora... {he pauses} ...o caos reina.

-> meet_hierophant

=== mission_briefing ===
HIEROFANTE: Ah, sim. O Protocolo EZ. Ele ainda funciona, então.

HIEROFANTE: Muito bem. Preciso de sua ajuda, Sincronizador.

HIEROFANTE: O Setor 7 está sob ataque. Echos corrompidos estão tentando desfragmentar o Node.

* [Vou ajudar.]
    -> accept_mission
* [Por que eu deveria?]
    -> ask_reward
* [Não é meu problema.]
    -> refuse_mission

=== accept_mission ===
HIEROFANTE: Excelente. Sua determinação é admirável.

HIEROFANTE: Vá até o Setor 7. Elimine os Echos. Estabilize o Node.

~ mission_sector7_active = true
~ eb_reward_pending = 2500

HIEROFANTE: Retorne quando terminar. Há recompensas para quem serve a Malha.

-> END

=== ask_reward ===
HIEROFANTE: {eb_balance < 1000: Vejo que você é pragmático. Bom. | Sempre há um preço, não é?}

HIEROFANTE: Complete a missão e receba 2500 Entropy Bits.

HIEROFANTE: Além disso... {he leans closer} ...acesso ao Mercado Negro.

* [Aceito.]
    -> accept_mission
* [Ainda não.]
    -> meet_hierophant

=== refuse_mission ===
HIEROFANTE: {coldly} Então você é apenas mais um parasita.

HIEROFANTE: Vá. Mas lembre-se: na Malha, quem não contribui... é deletado.

~ architect_reputation -= 10

-> END

=== mission_complete ===
// Chamado quando o jogador completa Setor 7

HIEROFANTE: Você retorna vitorioso. Impressionante.

HIEROFANTE: O Setor 7 está estabilizado. A Malha agradece.

~ eb_balance += 2500
~ mission_sector7_complete = true
~ architect_reputation += 25

HIEROFANTE: Sua recompensa foi transferida. E agora...

HIEROFANTE: Tenho uma proposta mais... lucrativa.

* [Estou ouvindo.]
    -> heist_introduction
* [Preciso descansar.]
    -> END

=== heist_introduction ===
HIEROFANTE: Há um Node rival. Setor Omega-3. Eles estão compilando um artefato raro.

HIEROFANTE: Uma Lâmina Binária de Órion. Valor estimado: 50,000 EB.

HIEROFANTE: {architect_reputation >= 50: Confio em você. | Você parece capaz.} Roube-a para mim.

HIEROFANTE: Você fica com 40%. Eu com 60%. Negócio justo.

* [Aceito o heist.]
    ~ heist_omega3_active = true
    HIEROFANTE: Perfeito. Use o Painel de Comando para iniciar a Incursão de Malha.
    -> END
* [Muito arriscado.]
    HIEROFANTE: Covardia não constrói impérios, Sincronizador.
    -> meet_hierophant

=== END ===
-> END
