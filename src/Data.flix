mod Data {
    use Data.Venues

    pub type alias Linked[a] = {
        link = Option[String],
        value = a
    }

    pub type alias Everything = {
        affiliation = Affiliation,
        researchInterests = String,
        publications = List[Publication],
        talks = List[Talk],
        academicService = List[AcademicService],
        additionalInterests = List[AdditionalInterest],
        contactInformation = ContactInformation,
        teaching = List[Teaching],
        extraLinks = Map[String, String],
        education = List[Education]
    }

    pub type alias Affiliation = {
        title = String,
        group = Linked[String],
        department = Linked[String],
        institute = Linked[String]
    }

    pub enum PublicationSite {
        case Link(String)
        case Doi(String)
    }

    pub type alias Publication = {
        title = String,
        authors = List[Person],
        venue = Venue,
        site = PublicationSite
    }

    pub type alias Talk = {
        title = String,
        venue = Venue
    }

    pub type alias AdditionalInterest = {
        title = String,
        details = String
    }

    pub type alias Venue = {
        title = String,
        year = Int32,
        website = Option[String],
        tpe = VenueType
    }

    pub enum VenueType {
        case Workshop
        case Conference
    }

    pub type alias ContactInformation = {
        office = String,
        email = String
    }

    pub type alias AcademicService = {
        role = String,
        venue = Venue
    }

    pub type alias Person = {
        name = String,
        website = Option[String],
        isMe = Bool
    }

    pub type alias Teaching = {
        role = String,
        school = String,
        class = String,
        year = Int32
    }

    pub type alias Education = {
        degree = String,
        school = String,
        year = Int32,
        extra = Option[String]
    }

    pub def everything(): Everything = {
        affiliation = affiliation(),
        researchInterests = researchInterests(),
        publications = publications(),
        talks = talks(),
        additionalInterests = additionalInterests(),
        academicService = academicService(),
        contactInformation = contactInformation(),
        teaching = teaching(),
        extraLinks = extraLinks(),
        education = education()
    }

    def affiliation(): Affiliation = {
        title = "Postdoctoral Researcher",
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

    def researchInterests(): String = {
        List#{
            "My research interests include type and effect systems, type inference, subtyping, and compilation.",
            "I am a contributor to the Flix programming language,",
            "which I work on with my advisor Magnus Madsen."
        } |> List.join(" ")
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
            venue = Venues.popl2022(),
            site = PublicationSite.Doi("10.1145/3498674")
        },
        {
            title = "Restrictable Variants: A Simple and Practical Alternative to Extensible Variants",
            authors = List#{
                People.magnusMadsen(),
                People.jonathanLindegaardStarup(),
                People.matthewLutze()
            },
            venue = Venues.ecoop2023(),
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
            venue = Venues.icfp2023(),
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
            venue = Venues.plateau2024(),
            site = PublicationSite.Doi("10.1184/R1/25587726.v1")
        },
        {
            title = "Associated Effects: Flexible Abstractions for Effectful Programming",
            authors = List#{
                People.matthewLutze(),
                People.magnusMadsen()
            },
            venue = Venues.pldi2024(),
            site = PublicationSite.Doi("10.1145/3656393")
        },
        {
            title = "The Simple Essence of Monomorphization",
            authors = List#{
                People.matthewLutze(),
                People.philippSchuster(),
                People.jonathanImmanuelBrachthauser()
            },
            venue = Venues.oopsla2025(),
            site = PublicationSite.Doi("10.1145/3720472")
        },
        {
            title = "Type-safe Blazon: Enforcing Pedantry in Heraldic Design",
            authors = List#{
                People.matthewLutze()
            },
            venue = Venues.farm2025(),
            site = PublicationSite.Doi("10.1145/3759162.3759641") // TODO
        }
    }

    def talks(): List[Talk] = List#{
        {
            title = "On Monomorphization",
            venue = Venues.tfp2026()
        }
    }

    def academicService(): List[AcademicService] = List#{
        {
            role = "Artifact Evaluation Reviewer",
            venue = Venues.pldi2024()
        },
        {
            role = "Artifact Evaluation Reviewer",
            venue = Venues.popl2025()
        },
        {
            role = "Program Committee Member",
            venue = Venues.ftfjp2025()
        },
        {
            role = "Program Committee Member",
            venue = Venues.tfp2026()
        },
        {
            role = "Program Committee Member",
            venue = Venues.wits2026()
        },
        {
            role = "Program Committee Member",
            venue = Venues.scala2026()
        },
        {
            role = "Program Committee Member",
            venue = Venues.oopsla2026()
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

    def teaching(): List[Teaching] = List#{
        {
            class = "Introduction to Programming I",
            role = "Teaching Assistant",
            school = "Gustavus Adolphus College",
            year = 2015
        },
        {
            class = "Introduction to Programming II",
            role = "Teaching Assistant",
            school = "Gustavus Adolphus College",
            year = 2016
        },
        {
            class = "Principles of Programming Languages",
            role = "Teaching Assistant",
            school = "Gustavus Adolphus College",
            year = 2017
        },
        {
            class = "Programming Languages",
            role = "Teaching Assistant",
            school = "Aarhus University",
            year = 2023
        },
        {
            class = "Compilation",
            role = "Teaching Assistant",
            school = "Aarhus University",
            year = 2023
        },
        {
            class = "Compilation",
            role = "Teaching Assistant",
            school = "Aarhus University",
            year = 2024
        },
        {
            class = "Introduction to Programming",
            role = "Curriculum Design",
            school = "Aarhus University",
            year = 2025
        },
        {
            class = "Compilation",
            role = "Guest Lecturer",
            school = "Aarhus University",
            year = 2024
        },
        {
            class = "Introduction to Programming",
            role = "Contributing Lecturer",
            school = "Aarhus University",
            year = 2025
        }
    }

    def extraLinks(): Map[String, String] = Map#{
        "DBLP" => "https://dblp.org/pid/312/9823.html",
        "Google Scholar" => "https://scholar.google.com/citations?user=NxVN8dwAAAAJ"
    }

    def education(): List[Education] = List#{
        {
            year = 2018,
            degree = "Bachelor in Computer Science",
            extra = None,
            school = "Gustavus Adolphus College"
        },
        {
            year = 2022,
            degree = "Master in Computer Science",
            extra = None,
            school = "Université Paris Cité"
        },
        {
            year = 2026,
            degree = "Ph.D. in Computer Science",
            extra = Some("Dissertation: On Effects, Inference, and Type Flow"),
            school = "Aarhus University"
        }
    }
}