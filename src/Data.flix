mod Data {

    pub type alias Everything = {
        researchInterests = List[ResearchInterest],
        publications = List[Publication],
        additionalInterests = List[AdditionalInterest],
        contactInformation = ContactInformation
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
        researchInterests = researchInterests(),
        publications = publications(),
        additionalInterests = additionalInterests(),
        contactInformation = contactInformation()
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