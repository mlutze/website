mod Data {
    use Data.Conferences

    pub type alias Linked[a] = {
        link = Option[String],
        value = a
    }

    pub type alias Everything = {
        affiliation = Affiliation,
        researchInterests = List[ResearchInterest],
        publications = List[Publication],
        academicService = List[AcademicService],
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

    pub enum PublicationSite {
        case Link(String)
        case Doi(String)
    }

    pub type alias Publication = {
        title = String,
        authors = List[Person],
        conference = Conference,
        site = PublicationSite
    }

    pub type alias AdditionalInterest = {
        title = String,
        details = String
    }

    pub type alias Conference = {
        title = String,
        year = Int32,
        website = Option[String]
    }

    pub type alias ContactInformation = {
        office = String,
        email = String
    }

    pub type alias AcademicService = {
        role = String,
        conference = Linked[Conference]
    }

    pub type alias Person = {
        name = String,
        website = Option[String],
        isMe = Bool
    }

    pub def everything(): Everything = {
        affiliation = Data.affiliation(),
        researchInterests = researchInterests(),
        publications = publications(),
        additionalInterests = additionalInterests(),
        academicService = academicService(),
        contactInformation = contactInformation()
    }

    def affiliation(): Affiliation = {
        title = "Ph.D. Student",
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
            site = PublicationSite.Doi("10.1145/3498674")
        },
        {
            title = "Restrictable Variants: A Simple and Practical Alternative to Extensible Variants",
            authors = List#{
                People.magnusMadsen(),
                People.jonathanLindegaardStarup(),
                People.matthewLutze()
            },
            conference = Conferences.ecoop2023(),
            site = PublicationSite.Doi("10.4230/LIPIcs.ECOOP.2023.17")
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
            site = PublicationSite.Doi("10.1145/3607846")
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
            site = PublicationSite.Doi("10.1184/R1/25587726.v1")
        },
        {
            title = "Associated Effects: Flexible Abstractions for Effectful Programming",
            authors = List#{
                People.matthewLutze(),
                People.magnusMadsen()
            },
            conference = Conferences.pldi2024(),
            site = PublicationSite.Doi("10.1145/3656393")
        },
        {
            title = "The Simple Essence of Monomorphization",
            authors = List#{
                People.matthewLutze(),
                People.philippSchuster(),
                People.jonathanImmanuelBrachthauser()
            },
            conference = Conferences.oopsla2025(),
            site = PublicationSite.Doi("10.1145/3720472")
        }
    }

    def academicService(): List[AcademicService] = List#{
        {
            role = "Artifact Evaluation Reviewer",
            conference = Conferences.pldi2024()
        },
        {
            role = "Artifact Evaluation Reviewer",
            conference = Conferences.popl2025()
        },
        {
            role = "Program Committee Member",
            conference = Conferences.ftfjp2025()
        },
        {
            role = "Program Committee Member",
            conference = Conferences.tfp2026()
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