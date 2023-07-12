mod Formatting {

    use Text.HtmlDoc.Html
    use Text.HtmlDoc.HtmlAttr.HtmlAttrBoolean
    use Text.HtmlDoc.anchor
    use Text.HtmlDoc.br0
    use Text.HtmlDoc.charset_
    use Text.HtmlDoc.concat
    use Text.HtmlDoc.em
    use Text.HtmlDoc.empty
    use Text.HtmlDoc.h1
    use Text.HtmlDoc.h2
    use Text.HtmlDoc.href_
    use Text.HtmlDoc.li
    use Text.HtmlDoc.meta0
    use Text.HtmlDoc.ol
    use Text.HtmlDoc.paragraph
    use Text.HtmlDoc.strong
    use Text.HtmlDoc.text
    use Text.HtmlDoc.ul
    use Text.HtmlDoc.{<&>}

    pub def everything(data: Data.Everything): Html = {
        // TODO add body/head stuff
        // TODO add doctype
        meta0(List#{charset_("UTF-8")})
        <&>
        h1(Nil, text("Matthew Lutze"))
        <&>
        affiliation(data.affiliation)
        <&>
        br0(Nil) <&> br0(Nil)
        <&>
        contactInformation(data.contactInformation)
        <&>
        br0(Nil)
        <&>
        researchInterests(data.researchInterests)
        <&>
        br0(Nil)
        <&>
        publications(data.publications)
        <&>
        br0(Nil)
        <&>
        additionalInterests(data.additionalInterests)
    }

    pub def affiliation(data: Data.Affiliation): Html = {
        text(data.title)
        <&>
        br0(Nil)
        <&>
        linked(text, data.group)
        <&>
        br0(Nil)
        <&>
        linked(text, data.department)
        <&>
        br0(Nil)
        <&>
        linked(text, data.institute)
    }

    pub def linked(f: a -> Html, data: Data.Linked[a]): Html = {
        match data.link {
            case None => f(data.value)
            case Some(link) => anchor(List#{href_(link)}, f(data.value))
        }
    }

    pub def researchInterests(data: List[Data.ResearchInterest]): Html = {
        let header = h2(Nil, text("Research Interests"));
        let description = em(Nil, text("Subjects I explore professionally"));
        let list = data
            |> List.map(researchInterest)
            |> mkUnorderedList;
        
        header <&> description <&> list
    }

    pub def researchInterest(data: Data.ResearchInterest): Html = {
        text(data.title)
        <&>
        text(" — ") // em-dash
        <&>
        text(data.details)
    }


    pub def publications(data: List[Data.Publication]): Html = {
        let header = h2(Nil, text("Publications"));
        let list = data
            |> List.map(publication)
            |> mkReverseList;

        header <&> list
    }

    def mkReverseList(elms: List[Html]): Html = {
        let lis = elms |> List.reverse |> List.map(li(Nil));
        ol(HtmlAttrBoolean("reversed") :: Nil, concat(lis))
    }

    // def mkOrderedList(elms: List[Html]): Html = {
    //     let lis = elms |> List.map(li(Nil));
    //     ol(Nil, concat(lis))
    // }

    def mkUnorderedList(elms: List[Html]): Html = {
        let lis = elms |> List.map(li(Nil));
        ul(Nil, concat(lis))
    }

    pub def publication(data: Data.Publication): Html = {
        strong(Nil, text(data.title))
        <&>
        text(" — ") // em-dash
        <&>
        linked(conference, data.conference)
        <&>
        br0(Nil)
        <&>
        authors(data.authors)
        // TODO link
    }

    pub def conference(data: Data.Conference): Html = {
        text("${data.title} ${data.year}")
    }

    def authors(data: List[Data.Linked[String]]): Html = {
        data
            |> List.map(linked(text))
            |> List.reduceLeft((acc, link) -> acc <&> text(", ") <&> link)
            |> Option.getWithDefault(empty())
            |> em(Nil)
    }

    pub def contactInformation(data: Data.ContactInformation): Html = {
        text(data.office)
        <&>
        br0(Nil)
        <&>
        text(data.email)
    }

    pub def additionalInterests(data: List[Data.AdditionalInterest]): Html = {
        let header = h2(Nil, text("Additional Interests"));
        let description = em(Nil, text("Subjects I explore in my spare time"));
        let list = data
            |> List.map(additionalInterest)
            |> mkUnorderedList;
        
        header <&> description <&> list
    }

    pub def additionalInterest(data: Data.AdditionalInterest): Html = {
        text(data.title)
        <&>
        text(" — ") // em-dash
        <&>
        text(data.details)
    }
}