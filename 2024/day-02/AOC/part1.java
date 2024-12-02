import java.io.File;
import java.util.Scanner;
import java.io.FileNotFoundException; 

public class part1
{
    
    private Scanner myReader;

    public part1()
    { }    

    public void solvePart1()
    {
        try
        {
            File myObj = new File("input.txt");
            myReader = new Scanner(myObj);
            solvePart1(myReader);
            myReader.close(); 
        }
        catch (FileNotFoundException e)
        {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }    
    
    private void solvePart1(Scanner reader)
    {
        int safeAmount = 0;
        
        while (myReader.hasNextLine())
        {
            String line = myReader.nextLine();
            System.out.println(line);
            
            String[] numberArr = line.split(" ");
        
            boolean increasing = true;
            boolean firstNumber = true;
            boolean secondNumber = true;
            boolean unsafeLine = false;
        
            int previousNumber = -1;
            
            for (String numberString : numberArr)
            {
                // System.out.println(numberString);
                int number = Integer.valueOf(numberString);
                
                if (firstNumber) {
                    firstNumber = false;
                } else {
                    if (secondNumber) {
                        secondNumber = false;
                        increasing = number > previousNumber;
                    }
                    
                    // unsafe if its the same number,
                    // or if it isnt contiously increasing
                    if (number == previousNumber || increasing != number > previousNumber) unsafeLine = true;
     
                    if (Math.abs(number - previousNumber) > 3) unsafeLine = true;
                    
                }
                
                previousNumber = number;
            }
            //finished analyzing the line
            
            if (!unsafeLine) {
                safeAmount += 1;
            }
            
            System.out.println(unsafeLine);
            
            unsafeLine = false;
        }
        
        System.out.println(safeAmount);
    }

}





















