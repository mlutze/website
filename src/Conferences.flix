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
        link = None
    }
}