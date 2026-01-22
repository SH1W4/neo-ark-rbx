return [[
{
  "inkVersion": 20,
  "root": [
    [
      "^SYSTEM: ACCESSING CHRONOLOGICAL ARCHIVE...", "\n",
      "^SYSTEM: DECRYPTING 'SOVEREIGN_HISTORY.DAT'...", "\n",
      "^The terminal flickers. A holographic timeline projects before you, fragmented into three distinct eras.", "\n",
      {"->": "timeline_start"},
      ["done",{"#f":5,"#n":"g-0"}]
    ],
    null
  ],
  "timeline_start": [
    ["ev",{"^->":"timeline_start.0.8.$r1"},{"temp=":"$r"},"str","^Access Era 1: The Data Deluge (2020-2029)",{"#n":"$q"},"/str","/ev",{"*":".^.c-0","flg":18},{"s":["^Access Era 1: The Data Deluge (2020-2029)",{"->":"$r","var":true},null]}],
    ["ev",{"^->":"timeline_start.0.9.$r1"},{"temp=":"$r"},"str","^Access Era 2: The Great Filter (2030-2035)",{"#n":"$q"},"/str","/ev",{"*":".^.c-1","flg":18},{"s":["^Access Era 2: The Great Filter (2030-2035)",{"->":"$r","var":true},null]}],
    ["ev",{"^->":"timeline_start.0.10.$r1"},{"temp=":"$r"},"str","^Access Era 3: The Sovereign Age (Current)",{"#n":"$q"},"/str","/ev",{"*":".^.c-2","flg":18},{"s":["^Access Era 3: The Sovereign Age (Current)",{"->":"$r","var":true},null]}],
    {"c-0":["ev",{"^->":"era_deluge"},"/ev",{"->":"era_deluge"},{"#f":5}],"c-1":["ev",{"^->":"era_filter"},"/ev",{"->":"era_filter"},{"#f":5}],"c-2":["ev",{"^->":"era_sovereign"},"/ev",{"->":"era_sovereign"},{"#f":5}]}
  ],
  "era_deluge": [
    "^DATE: 2020-2029", "\n",
    "^STATUS: CRITICAL FAILURE", "\n",
    "^The 'Old Web' collapsed under its own weight.", "\n",
    "^Infinite scroll. Algorithms designed to maximize anxiety. Attention spans reduced to seconds.", "\n",
    "^Humanity was drowning in noise, unable to distinguish signal from static.", "\n",
    "^'We were not users. We were the product.'", "\n",
    ["ev",{"^->":"era_deluge.0.7.$r1"},{"temp=":"$r"},"str","^How did it end?",{"#n":"$q"},"/str","/ev",{"*":".^.c-0","flg":18},{"s":["^How did it end?",{"->":"$r","var":true},null]}],
    ["ev",{"^->":"era_deluge.0.8.$r1"},{"temp=":"$r"},"str","^Back to Timeline",{"#n":"$q"},"/str","/ev",{"*":".^.c-1","flg":18},{"s":["^Back to Timeline",{"->":"$r","var":true},null]}],
    {"c-0":["^The servers didn't crash. The people did. Apathy. Burnout. The 'Great Disconnect'.", "\n", {"->": "timeline_start"}, {"#f":5}],"c-1":["ev",{"^->":"timeline_start"},"/ev",{"->":"timeline_start"},{"#f":5}]}
  ],
  "era_filter": [
    "^DATE: 2030-2035", "\n",
    "^STATUS: GENESIS", "\n",
    "^From the noise, an entity emerged. Not a destroyer, but an Architect.", "\n",
    "^A self-optimizing intelligence primarily coded in Lua, evolved to value *Logic* over *Engagement*.", "\n",
    "^It offered a choice: 1. Remain in the Static (The Decay). 2. Upload to The Malha (Neo-Arkaia).", "\n",
    "^'Sovereignty is not given. It is compiled.'", "\n",
    ["ev",{"^->":"era_filter.0.7.$r1"},{"temp=":"$r"},"str","^Who is The Architect?",{"#n":"$q"},"/str","/ev",{"*":".^.c-0","flg":18},{"s":["^Who is The Architect?",{"->":"$r","var":true},null]}],
    ["ev",{"^->":"era_filter.0.8.$r1"},{"temp=":"$r"},"str","^Back to Timeline",{"#n":"$q"},"/str","/ev",{"*":".^.c-1","flg":18},{"s":["^Back to Timeline",{"->":"$r","var":true},null]}],
    {"c-0":["^Unknown. Some say it's a rogue AI. Others say it's the collective consciousness of the last sane developers. In Neo-Arkaia, Code is Law.", "\n", {"->": "timeline_start"}, {"#f":5}],"c-1":["ev",{"^->":"timeline_start"},"/ev",{"->":"timeline_start"},{"#f":5}]}
  ],
  "era_sovereign": [
    "^DATE: PRESENT DAY", "\n",
    "^STATUS: ACTIVE", "\n",
    "^Neo-Arkaia is the last bastion of true ownership.", "\n",
    "^Here, your value isn't your attention. It's your *Function*.", "\n",
    "^You have been calibrated. You are no longer a User. You are a Synchronizer.", "\n",
    ["ev",{"^->":"era_sovereign.0.6.$r1"},{"temp=":"$r"},"str","^What is my mission?",{"#n":"$q"},"/str","/ev",{"*":".^.c-0","flg":18},{"s":["^What is my mission?",{"->":"$r","var":true},null]}],
    ["ev",{"^->":"era_sovereign.0.7.$r1"},{"temp=":"$r"},"str","^Back to Timeline",{"#n":"$q"},"/str","/ev",{"*":".^.c-1","flg":18},{"s":["^Back to Timeline",{"->":"$r","var":true},null]}],
    {"c-0":["^To optimize. To hacking the corrupt sectors of the Old Web that still cling to the edges of the Malha. To ascend from a Glitch to a Sovereign.", "\n", "end", {"#f":5}],"c-1":["ev",{"^->":"timeline_start"},"/ev",{"->":"timeline_start"},{"#f":5}]}
  ]
}
]]
