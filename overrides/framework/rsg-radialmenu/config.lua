lib.locale()

Config = {}

-- settings
Config.EnableExtraMenu = false
Config.Keybind = 'F6'
Config.HoldToOpen = true

Config.MenuItems = {
    [1] = {
        id = 'horse',
        title = locale('radial.title_01'),
        icon = 'horse-head',
        items = {
            {
                id = 'horselantern',
                title = locale('radial.title_02'),
                icon = 'lightbulb',
                type = 'client',
                event = 'rsg-horses:client:equipHorseLantern',
                shouldClose = true
            },
        },
    },
    [2] = {
        id = 'user',
        title = locale('radial.title_03'),
        icon = 'user',
        items = {
            {
                id = 'walkstyles',
                title = locale('radial.title_04'),
                icon = 'person-walking',
                items = {
                    {
                        id = 'normal',
                        title = locale('radial.title_05'),
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:normal',
                        shouldClose = true
                    },
                    {
                        id = 'angry',
                        title = locale('radial.title_06'),
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:angry',
                        shouldClose = true
                    },
                    {
                        id = 'war_veteran',
                        title = locale('radial.title_07'),
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:war_veteran',
                        shouldClose = true
                    },
                    {
                        id = 'gold_panner',
                        title = locale('radial.title_08'),
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:gold_panner',
                        shouldClose = true
                    },
                    {
                        id = 'lost_Man',
                        title = locale('radial.title_09'),
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:lost_Man',
                        shouldClose = true
                    },
                    {
                        id = 'murfree',
                        title = locale('radial.title_10'),
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:murfree',
                        shouldClose = true
                    },
                    {
                        id = 'primate',
                        title = locale('radial.title_11'),
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:primate',
                        shouldClose = true
                    },
                }
            },
            {
                id = 'jobs',
                title = locale('radial.title_12'),
                icon = 'circle-user',
                type = 'command',
                event = 'myjobs',
                shouldClose = true
            },
            {
                id = 'pvptoggle',
                title = locale('radial.title_13'),
                icon = 'hand-holding-hand',
                type = 'client',
                event = 'rsg-essentials:client:pvpToggle',
                shouldClose = true
            }, 
            {
                id= 'adressbook',
                title = locale('radial.title_14'),
                icon = 'address-book',
                type = 'client',
                event = 'rsg-telegram:client:OpenAddressbook',
                shouldClose = true
            },
            {
                id = 'sethorsename',
                title = locale('radial.title_15'),
                icon = 'globe',
                type = 'command',
                event = 'sethorsename',
                shouldClose = true
            },
            {
                id = 'searchplayer',
                title = locale('radial.title_16'),
                icon = 'magnifying-glass',
                type = 'command',
                event = 'searchplayer',
                shouldClose = true
            },
        },
    },
    [3] = {
        id = 'clothing',
        title = locale('radial.title_17'),
        icon = 'shirt',
        items = {
            {
                id = 'dress',
                title = locale('radial.title_18'),
                icon = 'person-dress',
                type = 'command',
                event = 'dress',
                shouldClose = true
            },
            {
                id = 'undress',
                title = locale('radial.title_19'),
                icon = 'person-half-dress',
                type = 'command',
                event = 'undress',
                shouldClose = true
            },
            {
                id = 'onoffhat',
                title = locale('radial.title_20'),
                icon = 'hat-cowboy',
                type = 'command',
                event = 'hat',
                shouldClose = true
            },
            {
                id = 'onoffvest',
                title = locale('radial.title_21'),
                icon = 'vest',
                type = 'command',
                event = 'vest',
                shouldClose = true
            },
            {
                id = 'onoffboots',
                title = locale('radial.title_22'),
                icon = 'shoe-prints',
                type = 'command',
                event = 'boots',
                shouldClose = true
            },
            {
                id = 'onoffpants',
                title = locale('radial.title_23'),
                icon = 'socks',
                type = 'command',
                event = 'pants',
                shouldClose = true
            },
            {
                id = 'onoffshirt',
                title = locale('radial.title_24'),
                icon = 'shirt',
                type = 'command',
                event = 'shirt',
                shouldClose = true
            },
            {
                id = 'onoffgunbelt',
                title = locale('radial.title_25'),
                icon = 'gun',
                type = 'command',
                event = 'gunbelt',
                shouldClose = true
            },
            {
                id = 'onoffmask',
                title = locale('radial.title_26'),
                icon = 'masks-theater',
                type = 'command',
                event = 'mask',
                shouldClose = true
            },
            {
                id = 'onoffcoat',
                title = locale('radial.title_27'),
                icon = 'vest-patches',
                type = 'command',
                event = 'coat',
                shouldClose = true
            },
            {
                id = 'onoffclosedcoat',
                title = locale('radial.title_28'),
                icon = 'vest-patches',
                type = 'command',
                event = 'closedcoat',
                shouldClose = true
            },
        },
    },
    [4] = {
         id = 'loadskin',
         title = locale('radial.title_29'),
         icon = 'recycle',
         type = 'command',
         event = 'loadskin',
         shouldClose = true
    },
    [5] = {
         id = 'playerinfo',
         title = locale('radial.title_30'),
         icon = 'book',
         type = 'command',
         event = 'info',
         shouldClose = true
    }
}

Config.JobInteractions = {
    ['medic'] = {
        {
            id = 'medicbutton',
            title = locale('radial.title_31'),
            icon = 'exclamation',
            type = 'client',
            event = 'rsg-radialmenu:client:SendMedicEmergencyAlert',
            shouldClose = true
        },
        {
            id = 'revivep',
            title = locale('radial.title_32'),
            icon = 'user-doctor',
            type = 'client',
            event = 'rsg-medic:client:RevivePlayer',
            shouldClose = true
        },
        {
            id = 'treatwounds',
            title = locale('radial.title_33'),
            icon = 'bandage',
            type = 'client',
            event = 'rsg-medic:client:TreatWounds',
            shouldClose = true
        }
    },
    ['vallaw'] = {
        {
            id = 'policebutton',
            title = locale('radial.title_31'),
            icon = 'exclamation',
            type = 'client',
            event = 'rsg-radialmenu:client:SendLawmanEmergencyAlert',
            shouldClose = true
        },
        {
            id = 'handcuff',
            title = locale('radial.title_34'),
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:cuffplayer',
            shouldClose = true
        },
        {
            id = 'escort',
            title = locale('radial.title_35'),
            icon = 'user-group',
            type = 'client',
            event = 'rsg-lawman:client:escortplayer',
            shouldClose = true
        },
        {
            id = 'jailplayer',
            title = locale('radial.title_36'),
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:jailplayer',
            shouldClose = true
        },
        {
            id = 'lawbadge',
            title = locale('radial.title_37'),
            icon = 'id-badge',
            type = 'command',
            event = 'lawbadge',
            shouldClose = true
        },
        {
            id = 'lawmdt',
            title = locale('radial.title_38'),
            icon = 'book-open',
            type = 'command',
            event = 'mdt',
            shouldClose = true
        },
    },
    ['rholaw'] = {
        {
            id = 'policebutton',
            title = locale('radial.title_31'),
            icon = 'exclamation',
            type = 'client',
            event = 'rsg-radialmenu:client:SendLawmanEmergencyAlert',
            shouldClose = true
        },
        {
            id = 'handcuff',
            title = locale('radial.title_34'),
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:cuffplayer',
            shouldClose = true
        },
        {
            id = 'escort',
            title = locale('radial.title_35'),
            icon = 'user-group',
            type = 'client',
            event = 'rsg-lawman:client:escortplayer',
            shouldClose = true
        },
        {
            id = 'jailplayer',
            title = locale('radial.title_36'),
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:jailplayer',
            shouldClose = true
        },
        {
            id = 'lawbadge',
            title = locale('radial.title_37'),
            icon = 'id-badge',
            type = 'command',
            event = 'lawbadge',
            shouldClose = true
        },
        {
            id = 'lawmdt',
            title = locale('radial.title_38'),
            icon = 'book-open',
            type = 'command',
            event = 'mdt',
            shouldClose = true
        },
    },
    ['blklaw'] = {
        {
            id = 'policebutton',
            title = locale('radial.title_31'),
            icon = 'exclamation',
            type = 'client',
            event = 'rsg-radialmenu:client:SendLawmanEmergencyAlert',
            shouldClose = true
        },
        {
            id = 'handcuff',
            title = locale('radial.title_34'),
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:cuffplayer',
            shouldClose = true
        },
        {
            id = 'escort',
            title = locale('radial.title_35'),
            icon = 'user-group',
            type = 'client',
            event = 'rsg-lawman:client:escortplayer',
            shouldClose = true
        },
        {
            id = 'jailplayer',
            title = locale('radial.title_36'),
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:jailplayer',
            shouldClose = true
        },
        {
            id = 'lawbadge',
            title = locale('radial.title_37'),
            icon = 'id-badge',
            type = 'command',
            event = 'lawbadge',
            shouldClose = true
        },
        {
            id = 'lawmdt',
            title = locale('radial.title_38'),
            icon = 'book-open',
            type = 'command',
            event = 'mdt',
            shouldClose = true
        },
    },
    ['strlaw'] = {
        {
            id = 'policebutton',
            title = locale('radial.title_31'),
            icon = 'exclamation',
            type = 'client',
            event = 'rsg-radialmenu:client:SendLawmanEmergencyAlert',
            shouldClose = true
        },
        {
            id = 'handcuff',
            title = locale('radial.title_34'),
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:cuffplayer',
            shouldClose = true
        },
        {
            id = 'escort',
            title = locale('radial.title_35'),
            icon = 'user-group',
            type = 'client',
            event = 'rsg-lawman:client:escortplayer',
            shouldClose = true
        },
        {
            id = 'jailplayer',
            title = locale('radial.title_36'),
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:jailplayer',
            shouldClose = true
        },
        {
            id = 'lawbadge',
            title = locale('radial.title_37'),
            icon = 'id-badge',
            type = 'command',
            event = 'lawbadge',
            shouldClose = true
        },
        {
            id = 'lawmdt',
            title = locale('radial.title_38'),
            icon = 'book-open',
            type = 'command',
            event = 'mdt',
            shouldClose = true
        },
    },
    ['stdenlaw'] = {
        {
            id = 'policebutton',
            title = locale('radial.title_31'),
            icon = 'exclamation',
            type = 'client',
            event = 'rsg-radialmenu:client:SendLawmanEmergencyAlert',
            shouldClose = true
        },
        {
            id = 'handcuff',
            title = locale('radial.title_34'),
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:cuffplayer',
            shouldClose = true
        },
        {
            id = 'escort',
            title = locale('radial.title_35'),
            icon = 'user-group',
            type = 'client',
            event = 'rsg-lawman:client:escortplayer',
            shouldClose = true
        },
        {
            id = 'jailplayer',
            title = locale('radial.title_36'),
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:jailplayer',
            shouldClose = true
        },
        {
            id = 'lawbadge',
            title = locale('radial.title_37'),
            icon = 'id-badge',
            type = 'command',
            event = 'lawbadge',
            shouldClose = true
        },
        {
            id = 'lawmdt',
            title = locale('radial.title_38'),
            icon = 'book-open',
            type = 'command',
            event = 'mdt',
            shouldClose = true
        },
    },
}
