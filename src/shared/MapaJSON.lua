return [[
{
  "id": "labyrinth_alpha",
  "dimensoes": {"w": 20, "h": 20},
  "setores": [
    {"id": "spawn_sector", "tipo": "safe_zone", "bounds": {"x":2, "y":2, "largura":4, "altura":4}},
    {"id": "corridor_main", "tipo": "corridor", "bounds": {"x":6, "y":3, "largura":8, "altura":2}},
    {"id": "artifact_chamber", "tipo": "danger_zone", "bounds": {"x":14, "y":2, "largura":5, "altura":5}},
    {"id": "side_room", "tipo": "loot_zone", "bounds": {"x":8, "y":6, "largura":4, "altura":4}}
  ],
  "tiles": [
    {"x": 2, "y": 2, "tileId": "parede"}, {"x": 3, "y": 2, "tileId": "parede"}, {"x": 4, "y": 2, "tileId": "parede"}, {"x": 5, "y": 2, "tileId": "parede"},
    {"x": 2, "y": 2, "tileId": "parede"}, {"x": 2, "y": 3, "tileId": "chao"}, {"x": 2, "y": 4, "tileId": "chao"}, {"x": 2, "y": 5, "tileId": "getty"},
    {"x": 3, "y": 3, "tileId": "spawn"}, {"x": 3, "y": 4, "tileId": "chao"}, {"x": 4, "y": 3, "tileId": "chao"}, {"x": 4, "y": 4, "tileId": "chao"},
    {"x": 5, "y": 3, "tileId": "porta"}, {"x": 5, "y": 4, "tileId": "parede"},
    
    {"x": 6, "y": 3, "tileId": "chao"}, {"x": 7, "y": 3, "tileId": "chao"}, {"x": 8, "y": 3, "tileId": "chao"}, {"x": 9, "y": 3, "tileId": "chao"},
    {"x": 10, "y": 3, "tileId": "chao"}, {"x": 11, "y": 3, "tileId": "chao"}, {"x": 12, "y": 3, "tileId": "chao"}, {"x": 13, "y": 3, "tileId": "porta"},
    
    {"x": 14, "y": 2, "tileId": "parede"}, {"x": 15, "y": 2, "tileId": "parede"}, {"x": 16, "y": 2, "tileId": "parede"}, {"x": 17, "y": 2, "tileId": "parede"}, {"x": 18, "y": 2, "tileId": "parede"},
    {"x": 14, "y": 3, "tileId": "parede"}, {"x": 15, "y": 3, "tileId": "chao"}, {"x": 16, "y": 3, "tileId": "chao"}, {"x": 17, "y": 3, "tileId": "chao"}, {"x": 18, "y": 3, "tileId": "parede"},
    {"x": 14, "y": 4, "tileId": "parede"}, {"x": 15, "y": 4, "tileId": "chao"}, {"x": 16, "y": 4, "tileId": "boss"}, {"x": 17, "y": 4, "tileId": "chao"}, {"x": 18, "y": 4, "tileId": "parede"},
    {"x": 14, "y": 5, "tileId": "parede"}, {"x": 15, "y": 5, "tileId": "chao"}, {"x": 16, "y": 5, "tileId": "chao"}, {"x": 17, "y": 5, "tileId": "chao"}, {"x": 18, "y": 5, "tileId": "parede"},
    {"x": 14, "y": 6, "tileId": "parede"}, {"x": 15, "y": 6, "tileId": "parede"}, {"x": 16, "y": 6, "tileId": "parede"}, {"x": 17, "y": 6, "tileId": "parede"}, {"x": 18, "y": 6, "tileId": "parede"},

    {"x": 8, "y": 4, "tileId": "porta"},
    {"x": 8, "y": 6, "tileId": "parede"}, {"x": 9, "y": 6, "tileId": "parede"}, {"x": 10, "y": 6, "tileId": "parede"}, {"x": 11, "y": 6, "tileId": "parede"},
    {"x": 8, "y": 7, "tileId": "parede"}, {"x": 9, "y": 7, "tileId": "loja"}, {"x": 10, "y": 7, "tileId": "chao"}, {"x": 11, "y": 7, "tileId": "parede"},
    {"x": 8, "y": 8, "tileId": "parede"}, {"x": 9, "y": 8, "tileId": "chao"}, {"x": 10, "y": 8, "tileId": "chao"}, {"x": 11, "y": 8, "tileId": "parede"},
    {"x": 8, "y": 9, "tileId": "parede"}, {"x": 9, "y": 9, "tileId": "parede"}, {"x": 10, "y": 9, "tileId": "parede"}, {"x": 11, "y": 9, "tileId": "parede"}
  ]
}
]]
