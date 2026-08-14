local Translations = {
    client = { lang_1 = 'adicione aqui' },
    server = { lang_1 = 'adicione aqui' },
}

if GetConvar('rsg_locale', 'en') == 'pt-br' then
    Lang = Locale:new({ phrases = Translations, warnOnMissing = true, fallbackLang = Lang })
end