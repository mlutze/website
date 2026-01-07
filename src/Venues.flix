mod Data.Venues {
    use Data.Linked
    use Data.Venue
    use Data.VenueType

    pub def popl2022(): Venue = {
        title = "POPL",
        year = 2022,
        website = Some("https://popl22.sigplan.org/"),
        tpe = VenueType.Conference
    }

    pub def ecoop2023(): Venue = {
        title = "ECOOP",
        year = 2023,
        website = Some("https://2023.ecoop.org/"),
        tpe = VenueType.Conference
    }

    pub def icfp2023(): Venue = {
        title = "ICFP",
        year = 2023,
        website = Some("https://icfp23.org"),
        tpe = VenueType.Conference
    }

    pub def plateau2024(): Venue = {
        title = "PLATEAU",
        year = 2024,
        website = Some("https://2024.plateau-workshop.org/"),
        tpe = VenueType.Workshop
    }

    pub def pldi2024(): Venue = {
        title = "PLDI",
        year = 2024,
        website = Some("https://pldi24.sigplan.org/"),
        tpe = VenueType.Conference
    }

    pub def popl2025(): Venue = {
        title = "POPL",
        year = 2025,
        website = Some("https://popl25.sigplan.org/"),
        tpe = VenueType.Conference
    }

    pub def oopsla2025(): Venue = {
        title = "OOPSLA",
        year = 2025,
        website = Some("https://2025.splashcon.org/track/OOPSLA"),
        tpe = VenueType.Conference
    }

    pub def ftfjp2025(): Venue = {
        title = "FTfJP",
        year = 2025,
        website = Some("https://2025.ecoop.org/home/FTfJP-2025"),
        tpe = VenueType.Workshop
    }

    pub def farm2025(): Venue = {
        title = "FARM",
        year = 2025,
        website = Some("https://2025.splashcon.org/track/splash-2025-farm"),
        tpe = VenueType.Workshop
    }

    pub def tfp2026(): Venue = {
        title = "TFP",
        year = 2026,
        website = Some("https://trendsfp.github.io/2026"),
        tpe = VenueType.Conference
    }

    pub def wits2026(): Venue = {
        title = "WITS",
        year = 2026,
        website = Some("https://popl26.sigplan.org/home/wits-2026"),
        tpe = VenueType.Workshop
    }

    pub def scala2026(): Venue = {
        title = "Scala Workshop",
        year = 2026,
        website = Some("https://conf.researchr.org/home/scala-2026"),
        tpe = VenueType.Workshop
    }

    pub def oopsla2026(): Venue = {
        title = "OOPSLA",
        year = 2026,
        website = Some("https://2026.splashcon.org/track/oopsla-2026"),
        tpe = VenueType.Conference
    }
}