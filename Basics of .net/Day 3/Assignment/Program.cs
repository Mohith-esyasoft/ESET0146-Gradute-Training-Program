using System;

namespace Assignment
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int balance = 0;
            string name = "";
            int accountNumber = 0;
            bool accountCreated = false;
            int choice;
            do
            {
                Console.WriteLine("Welcome to the Bank\n");
                Console.WriteLine("1. Create a new bank account");
                Console.WriteLine("2. Deposit money");
                Console.WriteLine("3. Withdraw money");
                Console.WriteLine("4. Display account details");
                Console.WriteLine("5. Exit");
                Console.Write("Enter your option: ");
                choice = Convert.ToInt32(Console.ReadLine());

                switch (choice)
                {
                    case 1:
                        // Create account
                        Console.Write("Enter Account Number: ");
                        accountNumber = Convert.ToInt32(Console.ReadLine());
                        Console.Write("Enter customer Name: ");
                        name = Console.ReadLine();
                        OpenBankAcc(name);
                        balance = 0;
                        accountCreated = true;
                        break;

                    case 2:
                        if (!accountCreated)
                        {
                            Console.WriteLine("create a bank account");
                            break;
                        }
                        Console.Write("Enter deposit amount: ");
                        int deposit = Convert.ToInt32(Console.ReadLine());
                        balance = Deposite_Money(balance, deposit);
                        Console.WriteLine($"New Balance: {balance}");
                        break;

                    case 3:
                        if (!accountCreated)
                        {
                            Console.WriteLine("create a bank account");
                            break;
                        }
                        Console.Write("Enter withdrawal amount: ");
                        int withdraw = Convert.ToInt32(Console.ReadLine());
                        if (withdraw > 0 && withdraw <= balance)
                        {
                            balance = Withdraw_Money(balance, withdraw);
                            Console.WriteLine($"New Balance: {balance}");
                        }
                        else
                            Console.WriteLine("Invalid withdrawal.");
                        break;

                    case 4:
                        if (!accountCreated)
                        {
                            Console.WriteLine("create a bank account");
                            break;
                        }
                        Display_Account_Details(balance, name);
                        break;

                    case 5:
                        exit(choice);
                        break;

                    default:
                        Console.WriteLine("enter number between 1 to 5");
                        break;
                }


            } while (choice != 5);
        }

        public static void OpenBankAcc(string name)
        {
            Console.WriteLine($"Hello {name}, your account is created");
        }

        public static int Deposite_Money(int bal, int in_acc)
        {
            return bal + in_acc;
        }

        public static int Withdraw_Money(int bal, int WithdrawAmount)
        {
            return bal - WithdrawAmount;
        }

        public static void Display_Account_Details(int bal, string name)
        {
            Console.WriteLine($"customer name: {name}");
            Console.WriteLine($"Balance: {bal}");
        }

        public static int exit(int option)
        {
            Console.WriteLine("Bye!");
            return option;
        }
    }
}
