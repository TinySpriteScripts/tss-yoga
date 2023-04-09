local Translations = {
    Notification = {
        info = "Info",
        warning = "Warning",
        success = "Success",
        error = "Error",
    },
    info = {

    },
    warning = {

    },
    success = {

    },
    error = {
        
    },
    target = {
        TargetLabel = "Stretch",
    },
    location = {
        label1 = "Yoga Class 1",
        label2 = "Yoga Class 2",
        label3 = "Yoga Class 3",
    },
    prog = {
        cancelled = "Cancelled",
    },
    clientdebug = {
        debug1 = "^1Debug:^7 Blip created for: ^5%{one}^7",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})