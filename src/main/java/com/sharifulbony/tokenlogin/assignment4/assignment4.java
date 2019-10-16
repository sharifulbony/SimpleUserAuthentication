package com.sharifulbony.tokenlogin.assignment4;

import java.util.Scanner;

public class assignment4 {
    public static void main(String[] args) {
        int x;
        Scanner scanner=new Scanner(System.in);
        System.out.println("Please input the last digit of your personal code: ");
        x=scanner.nextInt();
        x=x+2;
        System.out.println("Adding 2 with x. now x is : "+x);
        while(x>11){
            System.out.println("Invalid input!!! Please input Only the last digit : ");
            System.out.println("Please input the last digit of your personal code: ");
            x=scanner.nextInt();
            x=x+2;
        }
        System.out.println("Sum from 1 to X+2 is: " + sumOneToLimit(x));
        System.out.println("Sum from 1 to X+2  considering 3 and 5 multiple is: " + sumOneToXOnlyThreeFiveMultiple(x));
        System.out.println("Input a number : ");
        int n;
        n=scanner.nextInt();
        System.out.println(" Press s for sum and p for product of x+n ");
        char c=scanner.next().charAt(0);
        switch (c){
            case 's':
                System.out.println("Sum from 1 to x+n is: " + sumOneToLimit(x+n));
                break;
            case 'S':
                System.out.println("Sum from 1 to x+n is: " + sumOneToLimit(x+n));
                break;
            case 'p':
                System.out.println("Product from 1 to x+n is: " + productOneToLimit(x+n));
                break;
            case 'P':
                System.out.println("Product from 1 to x+n is: " + productOneToLimit(x+n));
                break;
        }
        multiplicationTable(x);
        printOddNumber(x);
        System.out.println("How many number do you need in the array: ");
        int size=scanner.nextInt();
        printEvenNumberOfArray(size);
    }
    public static int sumOneToLimit(int limit){
        int sum=0;
        for (int i=1;i<=limit;i++){
            sum+=i;
        }
        return sum;
    }
    public static int sumOneToXOnlyThreeFiveMultiple(int x){

        int sum=0;
        for (int i=1;i<=x;i++){
            if(i%3==0||i%5==0){
                sum+=i;
            }
        }
        return sum;
    }

    private static long productOneToLimit(int limit){
        long product=1;
        for (int i=1;i<=limit;i++){
            product*=i;
        }
        return product;
    }

    private static void multiplicationTable(int x){
        for (int i=1;i<=x;i++){
            System.out.println("Multiplication table of "+i+ " is given below: ");
            for(int j=1;j<=10;j++){
                System.out.println(i+"*"+j+"="+i*j);
            }
        }
    }

    private static void printOddNumber(int x){
        System.out.println("Odd numbers from 0 to " + x +" is : ");
        for(int i=1;i<=x;i+=2){
            System.out.println(i);
        }
    }

    private static void printEvenNumberOfArray(int size){
        int[] numberArray=new int[size];
        System.out.println("Please input "+size+ " number: ");
        Scanner input=new Scanner(System.in);
        for(int i=0;i<size;i++){
            numberArray[i]=input.nextInt();
        }
        System.out.println("Even number of the array is given below :");
        for(int i=0; i<numberArray.length;i++){

            if(numberArray[i]%2==0){
                System.out.println(numberArray[i]);
            }
        }
    }

}
