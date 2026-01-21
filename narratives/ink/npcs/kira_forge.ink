=== meet_kira ===
// NPC: KIRA "FORGE" VOLKOV
// A Ferreiro de Dados

Você entra na forja. O calor de soldagem digital preenche o ar.

Uma mulher robusta com braços cibernéticos olha para você.

KIRA: {first_meeting_kira: Novo por aqui? | De volta.}

KIRA: Sou Kira. Se você precisa de equipamento melhor, eu faço.

* [O que você pode fazer?]
    -> explain_services
* [Quero melhorar minha arma.]
    -> upgrade_weapon
* [Preciso de granadas especiais.]
    -> craft_grenades
* [Sair]
    -> END

=== explain_services ===
KIRA: Eu forjo. Eu melhoro. Eu crio.

KIRA: Traga materiais e EB, eu transformo em poder.

KIRA: Simples assim.

~ first_meeting_kira = false

-> meet_kira

=== upgrade_weapon ===
KIRA: Deixa eu ver sua arma.

{has_pulse_rifle:
    KIRA: Pulse Rifle padrão. Posso melhorar.
    * {eb_balance >= 1000 and data_fragment_count >= 5} [Upgrade para Pulse Rifle MK-II (1000 EB + 5 Fragmentos)]
        ~ eb_balance -= 1000
        ~ data_fragment_count -= 5
        ~ has_pulse_rifle = false
        ~ has_pulse_rifle_mk2 = true
        KIRA: Pronto. Dano aumentado em 50%. Teste no campo.
        -> END
    * [Não tenho recursos.]
        KIRA: Então volte quando tiver.
        -> meet_kira
- else:
    KIRA: Você não tem nada para melhorar.
    -> meet_kira
}

=== craft_grenades ===
KIRA: Granadas especiais. Boa escolha.

KIRA: O que você quer?

* {eb_balance >= 500 and glitch_core_count >= 1} [Craftar Glitch Bomb (500 EB + 1 Glitch Core)]
    ~ eb_balance -= 500
    ~ glitch_core_count -= 1
    ~ glitch_bomb_count += 1
    KIRA: Feito. Cuidado, essa coisa é instável.
    -> meet_kira
* {eb_balance >= 300 and data_fragment_count >= 3} [Craftar Logic-Pulse x5 (300 EB + 3 Fragmentos)]
    ~ eb_balance -= 300
    ~ data_fragment_count -= 3
    ~ logic_pulse_count += 5
    KIRA: Aqui. Perfeito para hackear defesas.
    -> meet_kira
* [Ver receitas avançadas]
    -> advanced_crafting
* [Voltar]
    -> meet_kira

=== advanced_crafting ===
KIRA: Receitas avançadas... você está pronto para isso?

KIRA: - Entropy-Singularity x3 (1500 EB + 10 Fragmentos)
KIRA: - Reality Anchor (2000 EB + 1 Núcleo de Node)

* {eb_balance >= 1500 and data_fragment_count >= 10} [Craftar Singularidades]
    ~ eb_balance -= 1500
    ~ data_fragment_count -= 10
    ~ entropy_singularity_count += 3
    KIRA: Poder gravitacional puro. Use bem.
    -> meet_kira
* {eb_balance >= 2000 and node_core_count >= 1} [Craftar Reality Anchor]
    ~ eb_balance -= 2000
    ~ node_core_count -= 1
    ~ reality_anchor_count += 1
    KIRA: Teleporte de emergência. Pode salvar sua vida.
    -> meet_kira
* [Muito caro.]
    KIRA: Qualidade tem preço.
    -> meet_kira

=== END ===
-> END
