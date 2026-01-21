=== meet_vex ===
// NPC: VEX "THE BROKER"
// Mercador do Mercado Negro

Uma figura encapuzada emerge das sombras. Seu rosto é obscurecido por glitches visuais.

VEX: {whispers} Sincronizador...

VEX: {first_meeting_vex: Bem-vindo ao meu... estabelecimento. | Você retorna. Bom.}

* [O que você vende?]
    -> show_inventory
* [Quero vender artefatos.]
    -> sell_artifacts
* [Tem contratos disponíveis?]
    -> show_contracts
* [Sair]
    -> END

=== show_inventory ===
VEX: Tenho... itens raros. Coisas que a Fundação não aprova.

VEX: Mas tudo tem um preço.

* {eb_balance >= 5000} [Comprar Exo-Armadura Tática (5000 EB)]
    ~ eb_balance -= 5000
    ~ has_exo_armor = true
    VEX: Excelente escolha. Proteção premium.
    -> END
* {eb_balance >= 2000} [Comprar Vortex Cannon (2000 EB)]
    ~ eb_balance -= 2000
    ~ has_vortex_cannon = true
    VEX: Poder destrutivo... delicioso.
    -> END
* {eb_balance >= 500} [Comprar Glitch Bomb x3 (500 EB)]
    ~ eb_balance -= 500
    ~ glitch_bomb_count += 3
    VEX: Use com sabedoria. Ou não. Não me importo.
    -> meet_vex
* [Ver itens lendários]
    -> legendary_shop
* [Voltar]
    -> meet_vex

=== legendary_shop ===
VEX: Ah... você quer o bom material.

VEX: {vex_reputation >= 50: Para clientes especiais, tenho ofertas especiais. | Estes são... caros.}

* {eb_balance >= 15000 and vex_reputation >= 50} [Comprar Mesh-Weave Stealth Suit (15000 EB)]
    ~ eb_balance -= 15000
    ~ has_stealth_suit = true
    VEX: {impressed} Você é sério. Respeito isso.
    ~ vex_reputation += 10
    -> END
* {eb_balance >= 25000} [Comprar Fragmento de Realidade (25000 EB)]
    ~ eb_balance -= 25000
    ~ reality_fragment_count += 1
    VEX: Uma segunda chance... literalmente.
    -> END
* [Muito caro.]
    VEX: {coldly} Então não desperdice meu tempo.
    -> meet_vex

=== sell_artifacts ===
VEX: Mostre o que você tem.

{stolen_artifact_count > 0:
    VEX: Ah... itens roubados. Minha especialidade.
    VEX: Pago 150% do valor de mercado. Sem perguntas.
    * [Vender todos os artefatos roubados]
        ~ eb_balance += (stolen_artifact_count * 1500)
        ~ stolen_artifact_count = 0
        ~ vex_reputation += 5
        VEX: Prazer fazer negócios.
        -> meet_vex
- else:
    VEX: Você não tem nada de valor para mim.
    -> meet_vex
}

=== show_contracts ===
VEX: Contratos... sim. Trabalhos sujos que pagam bem.

VEX: Interessado?

* [Ver contratos disponíveis]
    -> list_contracts
* [Não agora.]
    -> meet_vex

=== list_contracts ===
VEX: Tenho três ofertas:

VEX: 1. Eliminar um Sincronizador rival. Recompensa: 3000 EB.
VEX: 2. Roubar dados de um Node protegido. Recompensa: 5000 EB.
VEX: 3. Sabotar uma compilação em progresso. Recompensa: 7500 EB.

* [Aceitar Contrato 1]
    ~ contract_assassinate_active = true
    ~ vex_reputation += 5
    VEX: Excelente. Elimine o alvo. Não me decepcione.
    -> END
* [Aceitar Contrato 2]
    ~ contract_steal_data_active = true
    VEX: Discreto e eficiente. Gosto disso.
    -> END
* [Aceitar Contrato 3]
    ~ contract_sabotage_active = true
    VEX: {grins} Caos... meu favorito.
    -> END
* [Recusar todos]
    VEX: Covarde. Ou sábio. Difícil dizer.
    -> meet_vex

=== END ===
-> END
