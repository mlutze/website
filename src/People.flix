mod Data.People {
    use Data.Linked

    pub def giuseppeCastagna(): Linked[String] = {
        value = "Giuseppe Castagna",
        link = Some("https://www.irif.fr/~gc/")
    }

    pub def mickaelLaurent(): Linked[String] = {
        value = "Mickaël Laurent",
        link = None
    }

    pub def kimNguyen(): Linked[String] = {
        value = "Kim Nguyễn", // diacritics look wrong in source but OK in browser
        link = Some("https://www.lri.fr/~kn/index_en.html")
    }

    pub def matthewLutze(): Linked[String] = {
        value = "Matthew Lutze",
        link = None
    }

    pub def magnusMadsen(): Linked[String] = {
        value = "Magnus Madsen",
        link = Some("https://cs.au.dk/~magnusm/")
    }

    pub def jonathanLindegaardStarup(): Linked[String] = {
        value = "Jonathan Lindegaard Starup",
        link = None
    }
}