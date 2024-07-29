mod Data.People {
    use Data.Linked

    pub def carolineBerger(): Linked[String] = {
        value = "Caroline Berger",
        link = None
    }

    pub def giuseppeCastagna(): Linked[String] = {
        value = "Giuseppe Castagna",
        link = Some("https://www.irif.fr/~gc/")
    }

    pub def niklasElmqvist(): Linked[String] = {
        value = "Niklas Elmqvist",
        link = None
    }

    pub def clemensNylandstedKlokmose(): Linked[String] = {
        value = "Clemens Nylandsted Klokmose",
        link = None
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

    pub def philippSchuster(): Linked[String] = {
        value = "Philipp Schuster",
        link = Some("https://se.informatik.uni-tuebingen.de/team/schuster/")
    }

    pub def jonathanImmanuelBrachthauser(): Linked[String] = {
        value = "Jonathan Immanuel Brachthäuser",
        link = Some("https://se.informatik.uni-tuebingen.de/team/brachthaeuser/")
    }
}