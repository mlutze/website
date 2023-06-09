mod Formatting {

    use Text.HtmlDoc.Html
    use Text.HtmlDoc.concat
    use Text.HtmlDoc.h1
    use Text.HtmlDoc.h2
    use Text.HtmlDoc.li
    use Text.HtmlDoc.ol
    use Text.HtmlDoc.paragraph
    use Text.HtmlDoc.text
    use Text.HtmlDoc.{<&>}

    pub def everything(data: Data.Everything): Html = {
        h1(Nil, text("Matthew Lutze"))
        <&>
        paragraph(Nil, text("Ph.D. Student at Aarhus University"))
        <&>
        publications(data.publications)
    }

    pub def researchInterests(data: List[String]): Html = ???

    pub def researchInterest(data: String): Html = ???


    pub def publications(data: List[Data.Publication]): Html = {
        data
            |> List.map(publication)
            |> mkOrderedList
    }

    def mkOrderedList(elms: List[Html]): Html = {
        let lis = elms |> List.map(li(Nil));
        ol(Nil, concat(lis))
    }

    pub def publication(data: Data.Publication): Html = text("${data.authors}")

    pub def contactInformation(data: String): Html = ???

    pub def additionalInterests(data: List[String]): Html = ???

    pub def additionalInterest(data: String): Html = ???
}