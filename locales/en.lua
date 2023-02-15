local Translations = {
    target = {
        TargetLabel = 'Stretch',
    },
    clientdebug = {
        debug1 = '^1Debug:^7 Blip created for: ^5%{one}^7',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})