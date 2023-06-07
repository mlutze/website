use Text.HtmlDoc.Html
use Text.HtmlDoc.{<&>}
use Text.HtmlDoc.h1
use Text.HtmlDoc.text
use Text.HtmlDoc.toString
use Text.HtmlDoc.paragraph

def mkSource(): Html = {
    h1(Nil, text("Matthew Lutze"))
    <&>
    paragraph(Nil, text("Ph.D. Student at Aarhus University"))
}

def researchInterests(): Html = {
    ???
}

def publications(): Html = {
    ???
}

def contactInformation(): Html = {
    ???
}

def additionalInterests(): Html = {
    ???
}


def main(): Unit \ IO = println(toString(mkSource()))