mod Data.People {
    use Data.Linked
    use Data.Person

    pub def carolineBerger(): Person = {
        name = "Caroline Berger",
        website = None,
        isMe = false
    }

    pub def giuseppeCastagna(): Person = {
        name = "Giuseppe Castagna",
        website = Some("https://www.irif.fr/~gc/"),
        isMe = false
    }

    pub def niklasElmqvist(): Person = {
        name = "Niklas Elmqvist",
        website = None,
        isMe = false
    }

    pub def clemensNylandstedKlokmose(): Person = {
        name = "Clemens Nylandsted Klokmose",
        website = None,
        isMe = false
    }

    pub def mickaelLaurent(): Person = {
        name = "Mickaël Laurent",
        website = None,
        isMe = false
    }

    pub def kimNguyen(): Person = {
        name = "Kim Nguyễn", // diacritics look wrong in source but OK in browser
        website = Some("https://www.lri.fr/~kn/index_en.html"),
        isMe = false
    }

    pub def matthewLutze(): Person = {
        name = "Matthew Lutze",
        website = None,
        isMe = true
    }

    pub def magnusMadsen(): Person = {
        name = "Magnus Madsen",
        website = Some("https://cs.au.dk/~magnusm/"),
        isMe = false
    }

    pub def jonathanLindegaardStarup(): Person = {
        name = "Jonathan Lindegaard Starup",
        website = None,
        isMe = false
    }

    pub def philippSchuster(): Person = {
        name = "Philipp Schuster",
        website = Some("https://se.informatik.uni-tuebingen.de/team/schuster/"),
        isMe = false
    }

    pub def jonathanImmanuelBrachthauser(): Person = {
        name = "Jonathan Immanuel Brachthäuser",
        website = Some("https://se.informatik.uni-tuebingen.de/team/brachthaeuser/"),
        isMe = false
    }
}