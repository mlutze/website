use Text.HtmlDoc.toString

def main(): Unit \ IO = {
    println(toString(Formatting.everything(Data.everything())))
}