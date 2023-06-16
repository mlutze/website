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
}