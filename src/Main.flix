use HtmlDoc.toString
use HtmlDoc.writeHtml
use Sys.Env
use Fs.FileWrite
import java.lang.System

def main(): Unit \ FileWrite + Env + IO = {
    match doMain() {
        case Ok(()) => System.exit(0)
        case Err(msg) => System.err.println("Error: " + msg); System.exit(1)
    }
}
def doMain(): Result[String, Unit] \ FileWrite + Env = {
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

def writeToFile(file: String): Result[IoError, Unit] \ FileWrite = {
    let doc = Formatting.everything(Data.everything());
    forM (
        _ <- writeHtml(doc, 120, file)
    ) yield ()
}