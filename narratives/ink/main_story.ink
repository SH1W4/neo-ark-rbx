=== prologue ===
System: NEURAL LINK ESTABLISHED.
System: SYNC RATE: 100%.
System: WELCOME TO NEO-ARKAIA.

Você desperta em uma plataforma flutuante. O céu é um glitch roxo infinito.
Diante de você, uma figura imponente se materializa.

-> meet_architect

=== meet_architect ===
ARQUITETO: Sincronizador. Você finalmente acordou.
ARQUITETO: A Malha estava instável sem você.

* [Onde estou?]
    -> ask_location
* [Quem é você?]
    -> ask_identity
* [O que devo fazer?]
    -> ask_mission

=== ask_location ===
ARQUITETO: Você está no Node Central. O último bastião de ordem no caos digital.
ARQUITETO: Todo o resto... foi consumido pelos Echos.
-> meet_architect

=== ask_identity ===
ARQUITETO: Sou Kairos-7. O Arquiteto deste setor.
ARQUITETO: Minha função é preservar o que resta da humanidade.
-> meet_architect

=== ask_mission ===
ARQUITETO: Echos estão corrompendo a estrutura de dados.
ARQUITETO: Sua missão é simples: Cace-os. Estabilize os Nodes. Sobreviva.
ARQUITETO: Vá até o arsenal. Fale com Kira. Ela vai te equipar.

~ activate_quest("talk_to_kira")
-> END
