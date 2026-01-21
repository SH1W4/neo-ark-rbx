=== meet_lyra ===
// NPC: LYRA "PATHFINDER" CHEN
// A Cartógrafa da Malha

Você encontra uma jovem com um visor holográfico cobrindo os olhos. Mapas digitais flutuam ao seu redor.

LYRA: {first_meeting_lyra: Opa! Um Sincronizador novo! | Ei, você de novo!}

LYRA: Sou a Lyra. Cartógrafa profissional da Malha.

* [O que você faz?]
    -> explain_role
* [Tem mapas para vender?]
    -> shop_maps
* {tutorial_complete} [Preciso de ajuda para navegar.]
    -> navigation_tutorial
* [Tchau.]
    -> END

=== explain_role ===
LYRA: Eu mapeio Nodes! Cada servidor é um mundo diferente, sabe?

LYRA: Alguns têm física estranha. Outros têm tesouros escondidos.

LYRA: Meu trabalho é encontrar e catalogar tudo.

~ first_meeting_lyra = false

-> meet_lyra

=== shop_maps ===
LYRA: Claro! Tenho vários Nodes mapeados.

{eb_balance >= 500:
    LYRA: Vejo que você tem recursos. Que tal o Mapa do Setor Fantasma?
    * [Comprar Mapa do Setor Fantasma (500 EB)]
        ~ eb_balance -= 500
        ~ has_phantom_sector_map = true
        LYRA: Transação completa! Cuidado lá, é perigoso.
        -> END
    * [Ver outros mapas]
        -> other_maps
- else:
    LYRA: Hmm... você está meio quebrado. Volte quando tiver mais EB.
    -> meet_lyra
}

=== other_maps ===
LYRA: Tenho também:
LYRA: - Mapa do Vazio Cristalino (1000 EB)
LYRA: - Mapa do Node Perdido Omega-7 (2500 EB)
LYRA: - Coordenadas do Boss Mundial (5000 EB)

* {eb_balance >= 1000} [Comprar Vazio Cristalino]
    ~ eb_balance -= 1000
    ~ has_crystal_void_map = true
    LYRA: Boa escolha! Há rumores de artefatos lá.
    -> END
* {eb_balance >= 2500} [Comprar Omega-7]
    ~ eb_balance -= 2500
    ~ has_omega7_map = true
    LYRA: {whispers} Esse é especial. Tem segredos antigos.
    -> END
* {eb_balance >= 5000} [Comprar Coordenadas do Boss]
    ~ eb_balance -= 5000
    ~ has_boss_coordinates = true
    LYRA: NULLVOID-OMEGA... boa sorte, vai precisar.
    -> END
* [Voltar]
    -> meet_lyra

=== navigation_tutorial ===
LYRA: Ah, quer aprender a pular entre Nodes?

LYRA: É simples! Use o Painel de Comando e selecione "Salto de Malha".

LYRA: Mas cuidado: cada salto consome EB. E alguns Nodes são hostis.

~ navigation_tutorial_complete = true

-> meet_lyra

=== END ===
-> END
