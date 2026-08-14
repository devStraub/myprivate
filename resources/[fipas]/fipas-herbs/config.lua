Config = {}

Config.Debug = false
Config.TargetDistance = 1.8
Config.ActionDuration = 4000
Config.MinimumServerDuration = 2500
Config.DefaultCooldownSeconds = 120

Config.Plants = {
    { model = 'rdr_bush_dry_thin_ba_sim', name = 'Mirtilo', rewards = { 'blueberry', 'blueberry_seed' }, min = 1, max = 3 },
    { model = 's_indiantobacco01x', name = 'Tabaco-indiano', rewards = { 'indian_tobacco' }, min = 1, max = 3 },
    { model = 'crp_cotton_bd_sim', name = 'Algodao', rewards = { 'cotton' }, min = 1, max = 4 },
    { model = 'rdr_bush_ficus_aa_sim', name = 'Oregano', rewards = { 'oregano' }, min = 1, max = 3 },
    { model = 'rdr_bush_bram_aa_sim', name = 'Manjericao', rewards = { 'basil' }, min = 1, max = 3 },
    { model = 'rdr_bush_thick_aa_sim', name = 'Agarita', rewards = { 'agarita' }, min = 1, max = 3 },
    { model = 'rdr_bush_lrg_aa_sim', name = 'Tomilho-silvestre', rewards = { 'creeping_thyme' }, min = 1, max = 3 },
    { model = 'rdr_bush_bram_dead_aa_sim', name = 'Asclepia', rewards = { 'milkweed' }, min = 1, max = 3 },
    { model = 'rdr_bush_brush_grn_aa_sim', name = 'Alho-silvestre', rewards = { 'crows_garlic' }, min = 1, max = 3 },
    { model = 'p_sap_poplar_ab_sim', name = 'Macis-ingles', rewards = { 'english_mace' }, min = 1, max = 2 },
    { model = 'rdr_bush_thorn_aa_sim', name = 'Salvia-beija-flor', rewards = { 'hummingbird_sage' }, min = 1, max = 3 },
    { model = 'rdr_bush_creosotebush', name = 'Salvia-oleandro', rewards = { 'oleander_sage' }, min = 1, max = 2 },
    { model = 'rdr2_bush_desertbroom', name = 'Salvia-do-deserto', rewards = { 'desert_sage' }, min = 1, max = 3 },
    { model = 'rdr_bush_sumac_aa_sim', name = 'Ginseng-americano', rewards = { 'american_ginseng' }, min = 1, max = 2 },
    { model = 'rdr_bush_mang_aa_sim', name = 'Ginseng-do-alasca', rewards = { 'alaskan_ginseng' }, min = 1, max = 2 },
    { model = 'rdr_bush_leafy_aa_sim', name = 'Framboesa-vermelha', rewards = { 'red_raspberry' }, min = 1, max = 4 },
    { model = 'p_tree_apple_01', name = 'Maca', rewards = { 'apple' }, min = 1, max = 4 },
    { model = 'crp_wheat_dry_aa_sim', name = 'Graos', rewards = { 'grain' }, min = 1, max = 4 },
    { model = 'rdr_bush_agave_aa_sim', name = 'Agave', rewards = { 'agave' }, min = 1, max = 3 },
    { model = 'rdr_bush_scrub_aa_sim', name = 'Salvia-vermelha', rewards = { 'red_sage' }, min = 1, max = 3 },
    { model = 'blackcurrant_p', name = 'Groselha-preta', rewards = { 'black_currant' }, min = 1, max = 4 },
    { model = 'rdr_bush_aloe_aa_sim', name = 'Erva-amarga', rewards = { 'bitter_weed' }, min = 1, max = 3 },
    { model = 'rdr2_bush_desertironwood', name = 'Arando-perene', rewards = { 'evergreen_huckleberry' }, min = 1, max = 4 },
    { model = 'rdr_bush_cat_tail_aa_sim', name = 'Taboa', rewards = { 'bulrush' }, min = 1, max = 4 },
    { model = 'p_sap_poplar_aa_sim', name = 'Glicinia', rewards = { 'wisteria' }, min = 1, max = 3 },
    { model = 'rdr2_bush_scruboak', name = 'Ruibarbo-silvestre', rewards = { 'wild_rhubarb', 'wintergreen_berry' }, min = 1, max = 3 },
    { model = 'crp_sugarcane_ac_sim', name = 'Cana-de-acucar', rewards = { 'sugar' }, min = 1, max = 4 },
}

Config.Items = {
    blueberry = { label = 'Mirtilo', weight = 40 }, blueberry_seed = { label = 'Semente de mirtilo', weight = 10 },
    indian_tobacco = { label = 'Tabaco-indiano', weight = 40 }, cotton = { label = 'Algodao', weight = 30 },
    oregano = { label = 'Oregano', weight = 20 }, basil = { label = 'Manjericao', weight = 20 },
    agarita = { label = 'Agarita', weight = 30 }, creeping_thyme = { label = 'Tomilho-silvestre', weight = 20 },
    milkweed = { label = 'Asclepia', weight = 25 }, crows_garlic = { label = 'Alho-silvestre', weight = 20 },
    english_mace = { label = 'Macis-ingles', weight = 20 }, hummingbird_sage = { label = 'Salvia-beija-flor', weight = 20 },
    oleander_sage = { label = 'Salvia-oleandro', weight = 25 }, desert_sage = { label = 'Salvia-do-deserto', weight = 20 },
    american_ginseng = { label = 'Ginseng-americano', weight = 25 }, alaskan_ginseng = { label = 'Ginseng-do-alasca', weight = 25 },
    red_raspberry = { label = 'Framboesa-vermelha', weight = 35 }, apple = { label = 'Maca', weight = 100 },
    grain = { label = 'Graos', weight = 40 }, agave = { label = 'Agave', weight = 80 },
    red_sage = { label = 'Salvia-vermelha', weight = 20 }, black_currant = { label = 'Groselha-preta', weight = 35 },
    bitter_weed = { label = 'Erva-amarga', weight = 20 }, evergreen_huckleberry = { label = 'Arando-perene', weight = 35 },
    bulrush = { label = 'Taboa', weight = 35 }, wisteria = { label = 'Glicinia', weight = 25 },
    wild_rhubarb = { label = 'Ruibarbo-silvestre', weight = 50 }, wintergreen_berry = { label = 'Baga-de-gualteria', weight = 35 },
    sugar = { label = 'Cana-de-acucar', weight = 80 },
}
