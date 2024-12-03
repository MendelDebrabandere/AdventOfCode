import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class Solver {
    private Scanner myReader;

    public Solver() {}

    public void solve(boolean part1) {
        try {
            File myObj = new File("input.txt");
            myReader = new Scanner(myObj);
            if (part1) {
                processInput(this::isSafeInPart1);
            } else {
                processInput(this::isSafeInPart2);
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

    private void processInput(InputProcessor processor) {
        int safeLines = 0;
        while (myReader.hasNextLine()) {
            String line = myReader.nextLine();
            //System.out.println(line);
            String[] strNumberArr = line.split(" ");
            ArrayList<Integer> numbersArr = new ArrayList<>();
            for (String strNumber : strNumberArr) {
                numbersArr.add(Integer.valueOf(strNumber));
            }
            safeLines += processor.process(numbersArr) ? 1 : 0;
        }
        System.out.println(safeLines);
    }

    private boolean isSafeInPart1(ArrayList<Integer> numbersArr) {
        return isLineSafe(numbersArr);
    }

    private boolean isSafeInPart2(ArrayList<Integer> numbersArr) {
        if (isLineSafe(numbersArr)) {
            return true;
        } else {
            // Check if the line would be safe if we were to remove an item
            boolean foundSafeLine = false;
            for (int i = 0; i < numbersArr.size() && !foundSafeLine; ++i) {
                ArrayList<Integer> numbersArrWithoutOne = new ArrayList<>(numbersArr);
                numbersArrWithoutOne.remove(i);
                if (isLineSafe(numbersArrWithoutOne)) {
                    foundSafeLine = true;
                }
            }
            if (foundSafeLine) return true;
        }
        return false;
    }

    private boolean isLineSafe(ArrayList<Integer> intArray) {
        boolean increasing = true;
        boolean firstNumber = true;
        boolean secondNumber = true;
        int previousNumber = -1;

        for (Integer number : intArray) {
            if (firstNumber) {
                firstNumber = false;
            } else {
                if (secondNumber) {
                    secondNumber = false;
                    increasing = number > previousNumber;
                }

                if (number == previousNumber || increasing != number > previousNumber) return false;
                if (Math.abs(number - previousNumber) > 3) return false;
            }
            previousNumber = number;
        }
        return true;
    }

    @FunctionalInterface
    interface InputProcessor {
        boolean process(ArrayList<Integer> numbersArr);
    }
}