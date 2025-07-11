mod Formatting {
    use Text.HtmlDoc.img0
    use Text.HtmlDoc.div
    use Text.HtmlDoc.body
    use Text.HtmlDoc.HtmlAttr.HtmlAttr
    use Text.HtmlDoc.link0

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
    use Text.HtmlDoc.head
    use Text.HtmlDoc.href_
    use Text.HtmlDoc.title
    use Text.HtmlDoc.li
    use Text.HtmlDoc.meta0
    use Text.HtmlDoc.ol
    use Text.HtmlDoc.paragraph
    use Text.HtmlDoc.strong
    use Text.HtmlDoc.text
    use Text.HtmlDoc.ul
    use Text.HtmlDoc.{<&>, <&&>}

    pub def everything(data: Data.Everything): Html = {
        head(Nil, headContent())
        <&>
        body(Nil, bodyContent(data))
    }

    def bodyContent(data: Data.Everything): Html = {
        h1(Nil, text("Matthew Lutze"))
        <&>
        infoBlock(data#affiliation) <&> imageBlock()
        <&>
        br0(Nil) <&> br0(Nil)
        <&>
        contactInformation(data#contactInformation)
        <&>
        br0(Nil)
        <&>
        researchInterests(data#researchInterests)
        <&>
        br0(Nil)
        <&>
        publications(data#publications)
        <&>
        br0(Nil)
        <&>
        academicServices(data#academicService)
        <&>
        br0(Nil)
        // <&>
        // additionalInterests(data#additionalInterests)
    }

    def infoBlock(data: Data.Affiliation): Html = {
        div(List#{HtmlAttr("style", "display: inline-block")}, 
            affiliation(data)
        )
    }

    def imageBlock(): Html = {
        div(List#{HtmlAttr("style", "float: right")},
            img0(List#{
                HtmlAttr("src", "profile-photo.jpeg"),
                HtmlAttr("height", "180"),
                HtmlAttr("width", "180")
            })
        )
    }

    def headContent(): Html = {
        meta0(List#{charset_("UTF-8")})
        <&>
        title(Nil, text("Matthew Lutze"))
        <&>
        link0(List#{HtmlAttr("rel", "stylesheet"), HtmlAttr("href", "style.css")})
    }

    pub def affiliation(data: Data.Affiliation): Html = {
        text(data#title)
        <&>
        br0(Nil)
        <&>
        linked(text, data#group)
        <&>
        br0(Nil)
        <&>
        linked(text, data#department)
        <&>
        br0(Nil)
        <&>
        linked(text, data#institute)
    }

    pub def linked(f: a -> Html, data: Data.Linked[a]): Html = {
        match data#link {
            case None => f(data#value)
            case Some(link) => anchor(List#{href_(link)}, f(data#value))
        }
    }

    pub def researchInterests(data: List[Data.ResearchInterest]): Html = {
        let header = h2(Nil, text("Research Interests"));
        let list = data
            |> List.map(researchInterest)
            |> mkUnorderedList;
        
        header <&> list
    }

    pub def researchInterest(data: Data.ResearchInterest): Html = {
        text(data#title)
        <&>
        text(" — ") // em-dash
        <&>
        text(data#details)
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
        strong(Nil, text(data#title))
        <&&>
        publicationSite(data#site)
        <&>
        br0(Nil)
        <&>
        text("at ")
        <&>
        linked(conference, data#conference)
        <&>
        br0(Nil)
        <&>
        em(Nil, 
            text("by ")
            <&>
            authors(data#authors)
        )
    }

    pub def academicServices(data: List[Data.AcademicService]): Html = {
        let header = h2(Nil, text("Academic Service"));
        let list = data
            |> List.reverse
            |> List.map(academicService)
            |> mkUnorderedList;
        
        header <&> list
    }

    pub def academicService(data: Data.AcademicService): Html = {
        strong(Nil, text(data#role))
        <&>
        text(" at ")
        <&>
        linked(conference, data#conference)
    }

    def publicationSite(site: Data.PublicationSite): Html = match site {
        case Data.PublicationSite.Doi(doi) => doiLink(doi)
        case Data.PublicationSite.Link(link) => anchor(List#{href_(link)}, text("[link]"))
    }

    def doiLink(doi: String): Html = {
        let link = "https://doi.org/" + doi;
        anchor(List#{href_(link)}, text("[link]"))
    }

    pub def conference(data: Data.Conference): Html = {
        text("${data#title} ${data#year}")
    }

    def authors(data: List[Data.Linked[String]]): Html = {
        data
            |> List.map(linked(text))
            |> List.reduceLeft((acc, link) -> acc <&> text(", ") <&> link)
            |> Option.getWithDefault(empty())
    }

    pub def contactInformation(data: Data.ContactInformation): Html = {
        // TODO address tag
        text(data#office)
        <&>
        br0(Nil)
        <&>
        text(data#email)
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
        text(data#title)
        <&>
        text(" — ") // em-dash
        <&>
        text(data#details)
    }
}