return [[
{
  "inkVersion": 20,
  "root": [
    [
      "^System: NEURAL LINK ESTABLISHED.", "\n",
      "^System: SYNC RATE: 100%.", "\n",
      "^System: WELCOME TO NEO-ARKAIA.", "\n",
      "^Você desperta em uma plataforma flutuante. O céu é um glitch roxo infinito.", "\n",
      "^Diante de você, uma figura imponente se materializa.", "\n",
      {"->": "meet_architect"},
      ["done",{"#f":5,"#n":"g-0"}]
    ],
    null
  ],
  "meet_architect": [
    "^ARQUITETO: Sincronizador. Você finalmente acordou.", "\n",
    "^ARQUITETO: A Malha estava instável sem você.", "\n",
    ["ev",{"^->":"meet_architect.0.2.$r1"},{"temp=":"$r"},"str","^Onde estou?",{"#n":"$q"},"/str","/ev",{"*":".^.c-0","flg":18},{"s":["^Onde estou?",{"->":"$r","var":true},null]}],
    ["ev",{"^->":"meet_architect.0.3.$r1"},{"temp=":"$r"},"str","^Quem é você?",{"#n":"$q"},"/str","/ev",{"*":".^.c-1","flg":18},{"s":["^Quem é você?",{"->":"$r","var":true},null]}],
    ["ev",{"^->":"meet_architect.0.4.$r1"},{"temp=":"$r"},"str","^O que devo fazer?",{"#n":"$q"},"/str","/ev",{"*":".^.c-2","flg":18},{"s":["^O que devo fazer?",{"->":"$r","var":true},null]}],
    {"c-0":["ev",{"^->":"ask_location"},"/ev",{"->":"ask_location"},{"#f":5}],"c-1":["ev",{"^->":"ask_identity"},"/ev",{"->":"ask_identity"},{"#f":5}],"c-2":["ev",{"^->":"ask_mission"},"/ev",{"->":"ask_mission"},{"#f":5}]}
  ],
  "ask_location": [
    "^ARQUITETO: Você está no Node Central. O último bastião de ordem no caos digital.", "\n",
    "^ARQUITETO: Todo o resto... foi consumido pelos Echos.", "\n",
    {"->": "meet_architect"},
    ["done",{"#f":5}]
  ],
  "ask_identity": [
    "^ARQUITETO: Sou Kairos-7. O Arquiteto deste setor.", "\n",
    "^ARQUITETO: Minha função é preservar o que resta da humanidade.", "\n",
    {"->": "meet_architect"},
    ["done",{"#f":5}]
  ],
  "ask_mission": [
    "^ARQUITETO: Echos estão corrompendo a estrutura de dados.", "\n",
    "^ARQUITETO: Sua missão é simples: Cace-os. Estabilize os Nodes. Sobreviva.", "\n",
    "^ARQUITETO: Vá até o arsenal. Fale com Kira. Ela vai te equipar.", "\n",
    "ev", "str", "^talk_to_kira", "/str", {"x()": "activate_quest"}, "pop", "\n",
    "end",
    ["done",{"#f":5}]
  ]
}
]]
