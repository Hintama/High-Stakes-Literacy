import java.util.*;
import java.io.*;
import java.net.*;

public class load
{
	public static PrintWriter fout;
	public static void main(String args[])
	{
		String fileout="load1.txt";
		openfiles(fileout);
		int counter=0;
		while (counter<125)
		{
			String word=getRandomWord();
			if (word.length()>7)
			{
				
				counter++;
				fout.write(word+",");
				System.out.println(word);
			}
		}
		fout.close();
	}
	
	public static void openfiles(String fileout)
	{
		try
		{
			fout = new PrintWriter(new FileWriter(fileout), true);
		}
		catch (IOException e)
		{
			System.out.println("fuck");
		}
	}
	
    public static String getRandomWord()
    {
        try
		{
            URL page = new URL("http://projecteuler.net/project/words.txt");
            BufferedReader br= new BufferedReader(new InputStreamReader(page.openStream()));
            String pageSource=br.readLine();
            pageSource=pageSource.replace("\"","");
            String[] words=pageSource.split(",");
            int randNum=(int)(Math.random()*words.length);
            String word=words[randNum];
            word=word.toLowerCase();
            return word;
        }
        catch(Exception e)
        {
            return "squirrel";
        }
    }
}
