mod Data.Conferences {
    use Data.Linked
    use Data.Conference

    pub def popl2022(): Linked[Conference] = {
        value = {
            title = "POPL",
            year = 2022
        },
        link = Some("https://popl22.sigplan.org/")
    }

    pub def ecoop2023(): Linked[Conference] = {
        value = {
            title = "ECOOP",
            year = 2023
        },
        link = Some("https://2023.ecoop.org/")
    }

    pub def icfp2023(): Linked[Conference] = {
        value = {
            title = "ICFP",
            year = 2023
        },
        link = Some("https://icfp23.org")
    }

    pub def plateau2024(): Linked[Conference] = {
        value = {
            title = "PLATEAU",
            year = 2024
        },
        link = None
    }

    pub def pldi2024(): Linked[Conference] = {
        value = {
            title = "PLDI",
            year = 2024
        },
        link = Some("https://pldi24.sigplan.org/")
    }

    pub def popl2025(): Linked[Conference] = {
        value = {
            title = "POPL",
            year = 2025
        },
        link = Some("https://popl25.sigplan.org/")
    }

    pub def oopsla2025(): Linked[Conference] = {
        value = {
            title = "OOPSLA",
            year = 2025
        },
        link = Some("https://2025.splashcon.org/track/OOPSLA")
    }

    pub def ftfjp2025(): Linked[Conference] = {
        value = {
            title = "FTfJP",
            year = 2025
        },
        link = Some("https://2025.ecoop.org/home/FTfJP-2025")
    }

    pub def tfp2026(): Linked[Conference] = {
        value = {
            title = "TFP",
            year = 2026
        },
        link = Some("https://trendsfp.github.io/2026")
    }
}