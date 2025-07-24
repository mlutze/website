mod Data.Conferences {
    use Data.Linked
    use Data.Conference

    pub def popl2022(): Conference = {
        title = "POPL",
        year = 2022,
        website = Some("https://popl22.sigplan.org/")
    }

    pub def ecoop2023(): Conference = {
        title = "ECOOP",
        year = 2023,
        website = Some("https://2023.ecoop.org/")
    }

    pub def icfp2023(): Conference = {
        title = "ICFP",
        year = 2023,
        website = Some("https://icfp23.org")
    }

    pub def plateau2024(): Conference = {
        title = "PLATEAU",
        year = 2024,
        website = Some("https://2024.plateau-workshop.org/")
    }

    pub def pldi2024(): Conference = {
        title = "PLDI",
        year = 2024,
        website = Some("https://pldi24.sigplan.org/")
    }

    pub def popl2025(): Conference = {
        title = "POPL",
        year = 2025,
        website = Some("https://popl25.sigplan.org/")
    }

    pub def oopsla2025(): Conference = {
        title = "OOPSLA",
        year = 2025,
        website = Some("https://2025.splashcon.org/track/OOPSLA")
    }

    pub def ftfjp2025(): Conference = {
        title = "FTfJP",
        year = 2025,
        website = Some("https://2025.ecoop.org/home/FTfJP-2025")
    }

    pub def farm2025(): Conference = {
        title = "FARM",
        year = 2025,
        website = Some("https://2025.splashcon.org/track/splash-2025-farm")
    }

    pub def tfp2026(): Conference = {
        title = "TFP",
        year = 2026,
        website = Some("https://trendsfp.github.io/2026")
    }
}