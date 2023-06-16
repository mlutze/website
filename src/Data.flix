mod Data {

    pub type alias Linked[a] = {
        link = Option[String],
        value = a
    }

    pub type alias Everything = {
        affiliation = Affiliation,
        researchInterests = List[ResearchInterest],
        publications = List[Publication],
        additionalInterests = List[AdditionalInterest],
        contactInformation = ContactInformation
    }

    pub type alias Affiliation = {
        title = String,
        group = Linked[String],
        department = Linked[String],
        institute = Linked[String]
    }

    pub type alias ResearchInterest = String

    pub type alias Publication = {
        title = String,
        authors = List[String],
        conference = String,
        year = Int32
    }

    pub type alias AdditionalInterest = {
        title = String,
        details = String
    }

    pub type alias ContactInformation = String

    pub def everything(): Everything = {
        affiliation = Data.affiliation(),
        researchInterests = researchInterests(),
        publications = publications(),
        additionalInterests = additionalInterests(),
        contactInformation = contactInformation()
    }

    def affiliation(): Affiliation = {
        title = "Ph.D. Fellow",
        group = {
            value = "Programming Language Group",
            link = Some("https://cs.au.dk/research/programming-languages")
        },
        department = {
            value = "Department of Computer Science",
            link = Some("https://cs.au.dk")
        },
        institute = {
            value = "Aarhus Univerity",
            link = Some("https://au.dk")
        }
    }

    def researchInterests(): List[ResearchInterest] = List#{
        "Programming Languages",
        "Type Systems",
        "Effect Systems"
    }

    def publications(): List[Publication] = List#{
        {
            title = "On Type-Cases, Union Elimination, and Occurrence Typing",
            authors = List#{
                "Giuseppe Castagna",
                "Mickaël Laurent",
                "Kim Nguyễn", // diacritics look wrong in source but OK in browser
                "Matthew Lutze"
            },
            conference = "POPL",
            year = 2022
        }
    }

    def additionalInterests(): List[AdditionalInterest] = List#{
        {
            title = "Blazonry",
            details = "The \"programming language\" of heraldry."
        },
        {
            title = "Music",
            details = "Composition, Piano, Organ, Voice"
        },
        {
            title = "Constructed Languages",
            details = "Lojban, Toki Pona, Ithkuil"
        },
        {
            title = "Natural Languages",
            details = "French, Danish"
        }
    }

    def contactInformation(): ContactInformation = ""
}