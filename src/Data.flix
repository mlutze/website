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

    pub type alias ResearchInterest = {
        title = String,
        details = String
    }

    pub type alias Publication = {
        title = String,
        authors = List[Linked[String]],
        conference = Linked[Conference],
        doi = String
    }

    pub type alias AdditionalInterest = {
        title = String,
        details = String
    }

    pub type alias Conference = {
        title = String,
        year = Int32
    }

    pub type alias ContactInformation = {
        office = String,
        email = String
    }

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
        {
            title = "Programming Languages",
            details = "I am a contributor to the Flix programming language."
        },
        {
            title = "Type Systems",
            details = "type inference, subtyping, type classes"
        },
        {
            title = "Effect Systems",
            details = "algebraic effects, Boolean unification-based effects"
        }
    }

    /// List of publications in chronological order.
    def publications(): List[Publication] = List#{
        {
            title = "On Type-Cases, Union Elimination, and Occurrence Typing",
            authors = List#{
                People.giuseppeCastagna(),
                People.mickaelLaurent(),
                People.kimNguyen(),
                People.matthewLutze()
            },
            conference = Conferences.popl2022(),
            doi = "10.1145/3498674"
        },
        {
            title = "Restrictable Variants: A Simple and Practical Alternative to Extensible Variants",
            authors = List#{
                People.magnusMadsen(),
                People.jonathanLindegaardStarup(),
                People.matthewLutze()
            },
            conference = Conferences.ecoop2023(),
            doi = "10.4230/LIPIcs.ECOOP.2023.17"
        },
        {
            title = "With or Without You: Programming with Effect Exclusion",
            authors = List#{
                People.matthewLutze(),
                People.magnusMadsen(),
                People.philippSchuster(),
                People.jonathanImmanuelBrachthauser()
            },
            conference = Conferences.icfp2023(),
            doi = "10.1145/3607846"
        },
        {
            title = "Scientists and Code: Programming as a Tool",
            authors = List#{
                People.carolineBerger(),
                People.matthewLutze(),
                People.niklasElmqvist(),
                People.magnusMadsen(),
                People.clemensNylandstedKlokmose()
            },
            conference = Conferences.plateau2024(),
            doi = "10.1184/R1/25587726.v1"
        },
        {
            title = "Associated Effects: Flexible Abstractions for Effectful Programming",
            authors = List#{
                People.matthewLutze(),
                People.magnusMadsen()
            },
            conference = Conferences.pldi2024(),
            doi = "https://doi.org/10.1145/3656393"
        }
    }

    def additionalInterests(): List[AdditionalInterest] = List#{
        {
            title = "Blazonry",
            details = "the \"programming language\" of heraldry"
        },
        {
            title = "Music",
            details = "composition, piano, organ, voice"
        },
        {
            title = "Constructed Languages",
            details = "Lojban, Toki Pona, Ithkuil"
        },
        {
            title = "Natural Languages and Grammar",
            details = "English, French, Danish"
        },
        {
            title = "(Nearly) Obsolete Communication Forms",
            details = "Morse Code, runes, semaphore"
        }
    }

    def contactInformation(): ContactInformation = {
        office = "Turing 217",
        email = "mlutze@cs.au.dk"
    }
}