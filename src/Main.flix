use Text.HtmlDoc.toString
use Text.HtmlDoc.writeHtml!

def main(): Unit \ IO = {
    import static java.lang.System.exit(Int32): Unit \ IO;
    match doMain() {
        case Ok(()) => exit(0)
        case Err(msg) => System.StdErr.println("Error: " + msg); exit(1)
    }
}

def doMain(): Result[String, Unit] \ IO = {
    forM (
        file <- getWriteFile();
        _ <- writeToFile(file) |> Result.mapErr(ToString.toString)
    ) yield ()
}

def getWriteFile(): Result[String, String] = {
    match Environment.getArgs() {
        case Nil => Err("output file not specified")
        case _ :: _ :: _ => Err("too many arguments")
        case hd :: Nil => Ok(hd)
    }
}

def writeToFile(file: String): Result[IOError, Unit] \ IO = {
    let doc = Formatting.everything(Data.everything());
    forM (
        _ <- writeHtml!(120, file, doc)
    ) yield ()
}