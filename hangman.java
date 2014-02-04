import java.util.*;
import java.io.*;
import java.net.*;

public class hangman
{
	public static int missed;
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
    public static String hangedman()
    {
		if (missed==0)
		{
			 return("         _________________\n"+
			 "          | | ----------- |\n"+
			 "          | |            ||\n"+
			 "          | |            ||\n"+
			 "          | |            \n"+
			 "          | |           \n"+
			 "          | |            \n"+
		 	 "          | |             \n"+
		 	 "          | |            \n"+
			 "          | |             \n"+
			 "          | |             \n"+
			 "          | |            \n"+
			 " _________|_|__________");
		 }
		else if (missed==1)
		{
			 return("         _________________\n"+
			 "          | | ----------- |\n"+
			 "          | |            ||\n"+
			 "          | |            ||\n"+
			 "          | |            _|_\n"+
			 "          | |           [   ]\n"+
			 "          | |            ---\n"+
		 	 "          | |             \n"+
		 	 "          | |            \n"+
			 "          | |             \n"+
			 "          | |             \n"+
			 "          | |            \n"+
			 " _________|_|__________");
		 }
		 else if (missed==2)
		 {
			 return("          _________________\n"+
			 "          | | ----------- |\n"+
			 "          | |            ||\n"+
			 "          | |            ||\n"+
			 "          | |            _|_\n"+
			 "          | |           [   ]\n"+
			 "          | |            ---\n"+
			 "          | |             |\n"+
			 "          | |             |\n"+
			 "          | |             |\n"+
			 "          | |             |\n"+
			 "          | |            \n"+
			 " _________|_|__________");
		 }
		 else if (missed==3)
		 {
			 return("          _________________\n"+
			 "          | | ----------- |\n"+
			 "          | |            ||\n"+
			 "          | |            ||\n"+
			 "          | |            _|_\n"+
			 "          | |           [   ]\n"+
			 "          | |            ---\n"+
			 "          | |             |\n"+
			 "          | |            \\|\n"+
			 "          | |             |\n"+
			 "          | |             |\n"+
			 "          | |            \n"+
			 " _________|_|__________");
		 }
		 else if (missed==4)
		 {
			 return("          _________________\n"+
			 "          | | ----------- |\n"+
			 "          | |            ||\n"+
			 "          | |            ||\n"+
			 "          | |            _|_\n"+
			 "          | |           [   ]\n"+
			 "          | |            ---\n"+
			 "          | |             |\n"+
			 "          | |            \\|/\n"+
			 "          | |             |\n"+
			 "          | |             |\n"+
			 "          | |            \n"+
			 " _________|_|__________");
		 }
		 else if (missed==5)
		 {
			 return("          _________________\n"+
			 "          | | ----------- |\n"+
			 "          | |            ||\n"+
			 "          | |            ||\n"+
			 "          | |            _|_\n"+
			 "          | |           [   ]\n"+
			 "          | |            ---\n"+
			 "          | |             |\n"+
			 "          | |            \\|/\n"+
			 "          | |             |\n"+
			 "          | |             |\n"+
			 "          | |            / \n"+
			 " _________|_|__________");
		 }
		 else if (missed==6)
		 {
			 return("          _________________\n"+
			 "          | | ----------- |\n"+
			 "          | |            ||\n"+
			 "          | |            ||\n"+
			 "          | |            _|_\n"+
			 "          | |           [x x]\n"+
			 "          | |            ---\n"+
			 "          | |             |\n"+
			 "          | |            \\|/\n"+
			 "          | |             |\n"+
			 "          | |             |\n"+
			 "          | |            / \\\n"+
			 " _________|_|__________");
		 }
		 else 
		 {
			 return("Opps");
		 }
	 }
	 public static String mask(String w, String u)
	 {
		 int usedle=w.length();
		 if (u.contains(w.substring(w.length()-1,w.length())))
		 {
			 int nothing =0;
		 }
		 else 
		 {
			 missed++;
		 }
		 String output="";
		 for(int g=0;g<u.length();g++)
		 {
			 for(int i=0;i<w.length();i++)
			 {
				 String letter=w.substring(i,i+1);
				 if (letter.equals(u.substring(g,g+1)))
				 {
					 output+=letter;
				 }
			 }
			 if (output.length()<=g)
			 {
				output+= "_";
			}
		}
		 output=output.replace("_"," _ ");
		 output=output.replace("  "," ");
		 output=output.trim();
		 if (output.contains("_"))
		 {
			int good=0;
		 }
		 else 
		{
			missed=-100;
		}
		 return output;
	 }
 	 public static void main(String[] args)
	 {
		 missed=0;
		 Scanner sc=new Scanner(System.in);
		 System.out.print("It's time 4 hangman!!!!");
		 System.out.println();
		 String used="";
		 String word=getRandomWord();
		 //System.out.println(word);////////////////////////////
		 while(missed<7)
		 {
			 
			 
			 if (missed==-100)
			 {
				 System.out.println();
				 System.out.println("Hey you have guessed the word! Great job!");
				 missed=7;
			 }
			 if (missed==6)
			 {
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println("          _________________\n"+
				 "          | | ----------- |\n"+
				 "          | |            ||\n"+
				 "          | |            ||\n"+
				 "          | |            _|_\n"+
				 "          | |           [x x]\n"+
				 "          | |            ---\n"+
				 "          | |             |\n"+
				 "          | |            \\|/\n"+
				 "          | |             |\n"+
				 "          | |             |\n"+
				 "          | |            / \\\n"+
				 " _________|_|__________");
				 System.out.println("You have died D:\n"+
									"The word you were guessing was "+word+".");
									missed++;
			 }
			 if (missed==7)
			 {
				 System.out.println("Would you like to play again? (y/n)");
				 String answer=sc.next();
				 if (answer.substring(0,1).equals("y"))
				 {
					 missed=0;
					 used="";
					 word=getRandomWord();
				 }
			 }
			 else 
			 {	 
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println();
				 System.out.println(hangedman());
				 System.out.print("Guess a letter to the hidden word! ");
				 String gletter=sc.next();
				 if (gletter.length()>1)
				 {
					 gletter=gletter.substring(0,1);
				 }
				 if (gletter.equals("1") || gletter.equals("2") || gletter.equals("3") || gletter.equals("4") || gletter.equals("5") || gletter.equals("6") || gletter.equals("7") || gletter.equals("8") || gletter.equals("9") || gletter.equals("0") || gletter.equals("?") || gletter.equals("!") || gletter.equals("-"))
				 {
					System.out.print("Guess a LETTER to the hidden word! ");
					gletter=sc.next();
				 }
				 if (gletter.length()>1)
				 {
					 gletter=gletter.substring(0,1);
				 }
				 gletter=gletter.toLowerCase();
				 if (used.contains(gletter))
				 {
					 System.out.println();
					 System.out.println("You have already guessed that letter.");
					 System.out.println("The letters you have guessed are: " +used);
					 
				 }
				 else
				 {
					 used+=gletter;
					 System.out.println("The letters you have guessed are: " +used);
					 System.out.println(mask(used,word));
				 }
			 }
		 }
		 
	 
                /*Pseudocode
 loop:
 ask for a letter
 clean up the input (toLowerCase)
 add letter to used
 see if letter is in word and increment missed if it isn't
 get the masked version of the word and print it out
 display the guy based off of number missed
 if you die or win:  (if there are no underscores in the maskedword you win)
 show actual word
 ask the user if they want to play again
 if yes:
 get new word
 missed=0
 used=""
 if no:
 end the program (break)
                */
	}
}
