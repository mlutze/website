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

    pub type alias AdditionalInterest = String

    pub type alias ContactInformation = String

    pub def everything(): Everything = {
        researchInterests = researchInterests(),
        publications = publications(),
        additionalInterests = additionalInterests(),
        contactInformation = contactInformation()
    }

    pub def researchInterests(): List[ResearchInterest] = Nil

    pub def publications(): List[Publication] = List#{
        {
            title = "On Type-Cases, Union Elimination, and Occurrence Typing",
            authors = List#{
                "Giuseppe Castagna",
                "Mickael Laurent",
                "Kim " + nguyen(),
                "Matthew Lutze"
            },
            conference = "POPL",
            year = 2022
        }
    }

    def nguyen(): String = "Nguy\u00e1\u00bb\u0085en"

    pub def additionalInterests(): List[AdditionalInterest] = Nil

    pub def contactInformation(): ContactInformation = ""
}