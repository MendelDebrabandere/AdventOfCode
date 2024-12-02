import java.io.File;
import java.util.Scanner;
import java.io.FileNotFoundException;
import java.util.ArrayList; 

public class part2
{
    
    private Scanner myReader;

    public part2()
    { }    

    public void solvePart2()
    {
        try
        {
            File myObj = new File("input.txt");
            myReader = new Scanner(myObj);
            solvePart2(myReader);
            myReader.close(); 
        }
        catch (FileNotFoundException e)
        {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }    
    
    private void solvePart2(Scanner reader)
    {
        int safeAmount = 0;
        
        while (myReader.hasNextLine())
        {
            String line = myReader.nextLine();
            System.out.println(line);
            String[] strNumberArr = line.split(" ");
            ArrayList<Integer> numbersArr = new ArrayList();
            for (String strNumber : strNumberArr)
            {
                numbersArr.add(Integer.valueOf(strNumber));
            }
            
            boolean safeLine = isLineSafe(numbersArr);
            
            if (safeLine) {
                safeAmount += 1;
            } else {
                //check if the line would be safe if we were to remove an item
                boolean foundSafeLine = false;
                for (int i = 0; i < numbersArr.size() && !foundSafeLine; ++i)
                {
                    ArrayList<Integer> numbersArrWithoutOne = new ArrayList<>(numbersArr);
                    numbersArrWithoutOne.remove(i);
                    if (isLineSafe(numbersArrWithoutOne))
                    {
                        foundSafeLine = true;
                    }
                }
                
                if (foundSafeLine) safeAmount += 1;
                
            }
            
        }
        
        System.out.println(safeAmount);
    }
    
    private boolean isLineSafe(ArrayList<Integer> intArray)
    {      
            boolean increasing = true;
            boolean firstNumber = true;
            boolean secondNumber = true;
        
            int previousNumber = -1;
            
            for (Integer number : intArray)
            {
                // System.out.println(numberString);
                
                if (firstNumber) {
                    firstNumber = false;
                } else {
                    if (secondNumber) {
                        secondNumber = false;
                        increasing = number > previousNumber;
                    }
                    
                    // unsafe if its the same number,
                    // or if it isnt contiously increasing
                    if (number == previousNumber || increasing != number > previousNumber) return false;
        
                    if (Math.abs(number - previousNumber) > 3) return false;
                    
                }
                
                previousNumber = number;
            }
            
            return true;    
    }
    
}





















