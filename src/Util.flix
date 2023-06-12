mod Util {
    use Text.HtmlDoc.concat
    use Text.HtmlDoc.Html

    pub def emptyHtml(): Html = concat(Nil)
}