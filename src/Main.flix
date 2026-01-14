use Text.HtmlDoc.toString
use Text.HtmlDoc.writeHtml
import java.lang.System

def main(): Unit \ IO = {
    run {
        match doMain() {
            case Ok(()) => System.exit(0)
            case Err(msg) => System.err.println("Error: " + msg); System.exit(1)
        }
    } with Env.runWithIO
}
def doMain(): Result[String, Unit] \ IO + Env = {
    forM (
        file <- getWriteFile();
        _ <- writeToFile(file) |> Result.mapErr(ToString.toString)
    ) yield ()
}

def getWriteFile(): Result[String, String] \ Env = {
    match Env.getArgs() {
        case Nil => Err("output file not specified")
        case _ :: _ :: _ => Err("too many arguments")
        case hd :: Nil => Ok(hd)
    }
}

def writeToFile(file: String): Result[String, Unit] \ IO = {
    let doc = Formatting.everything(Data.everything());
    forM (
        _ <- writeHtml(120, file, doc)
    ) yield ()
}