import java.io.*;
import grammar.*;
import java_cup.runtime.*;

public class Main {
  public static void main(String[] argv) {
    String dirName = null;

    try {
      for (int i = 0; i < argv.length; i++) {
        if (argv[i].equals("-dir")) {
          i++;

          if (i >= argv.length)
            throw new Error("Missing directory name");
          else
            dirName = argv[i];
        } else {
          throw new Error("Usage: java Main -dir directory");
        }
      }

      if (dirName == null) {
        throw new Error("Directory not specified");
      }
      System.setErr(new PrintStream(new FileOutputStream(
          new File(dirName, "testcase.err"))));
      System.setOut(new PrintStream(new FileOutputStream(
          new File(dirName, "testcase.out"))));

      parser p = new parser(
          new File(dirName, "testcase.txt"));

      // p.debug_parse();
      p.parse();

    } catch (Exception e) {
      System.out.println("Exception at ");
      e.printStackTrace();
    }
  }
}
