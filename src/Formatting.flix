mod Formatting {

    use Text.HtmlDoc.Html
    use Text.HtmlDoc.br0
    use Text.HtmlDoc.concat
    use Text.HtmlDoc.em
    use Text.HtmlDoc.h1
    use Text.HtmlDoc.h2
    use Text.HtmlDoc.li
    use Text.HtmlDoc.ol
    use Text.HtmlDoc.ul
    use Text.HtmlDoc.paragraph
    use Text.HtmlDoc.text
    use Text.HtmlDoc.{<&>}

    pub def everything(data: Data.Everything): Html = {
        h1(Nil, text("Matthew Lutze"))
        <&>
        paragraph(Nil, text("Ph.D. Student at Aarhus University"))
        <&>
        publications(data.publications)
        <&>
        additionalInterests(data.additionalInterests)
    }

    pub def researchInterests(data: List[String]): Html = ???

    pub def researchInterest(data: String): Html = ???


    pub def publications(data: List[Data.Publication]): Html = {
        let header = h2(Nil, text("Publications"));
        let list = data
            |> List.map(publication)
            |> mkOrderedList;

        header <&> list
    }

    def mkOrderedList(elms: List[Html]): Html = {
        let lis = elms |> List.map(li(Nil));
        ol(Nil, concat(lis))
    }

    def mkUnorderedList(elms: List[Html]): Html = {
        let lis = elms |> List.map(li(Nil));
        ul(Nil, concat(lis))
    }

    pub def publication(data: Data.Publication): Html =
        text(data.title) // TODO link
        <&>
        text("—") // em-dash
        <&>
        text(data.conference)
        <&>
        text("${data.year}")
        <&>
        br0(Nil)
        <&>
        em(Nil, text(String.intercalate(", ", data.authors)))

    pub def contactInformation(data: String): Html = ???

    pub def additionalInterests(data: List[Data.AdditionalInterest]): Html = {
        let header = h2(Nil, text("Additional Interests"));
        let list = data
            |> List.map(additionalInterest)
            |> mkUnorderedList;
        
        header <&> list
    }

    pub def additionalInterest(data: Data.AdditionalInterest): Html = {
        text(data.title)
        <&>
        text("—") // em-dash
        <&>
        text(data.details)
    }
}