using System;

namespace Program
{
    // BankAccount class to store account details and handle operations
    public class BankAccount
    {
        public string AccountNumber { get; set; }
        public string HolderName { get; set; }
        public decimal Balance { get; private set; }

        public BankAccount(string accountNumber, string holderName)
        {
            AccountNumber = accountNumber;
            HolderName = holderName;
            Balance = 0;
        }

        public void Deposit(decimal amount)
        {
            if (amount > 0)
            {
                Balance += amount;
                Console.WriteLine($"Deposited: {amount:C}");
            }
            else
            {
                Console.WriteLine("Deposit amount must be positive.");
            }
        }

        public void Withdraw(decimal amount)
        {
            if (amount <= 0)
            {
                Console.WriteLine("Withdrawal amount must be positive.");
            }
            else if (amount > Balance)
            {
                Console.WriteLine("Insufficient balance.");
            }
            else
            {
                Balance -= amount;
                Console.WriteLine($"Withdrawn: {amount:C}");
            }
        }

        public void DisplayDetails()
        {
            Console.WriteLine("\n--- Account Details ---");
            Console.WriteLine($"Account Number: {AccountNumber}");
            Console.WriteLine($"Holder Name: {HolderName}");
            Console.WriteLine($"Balance: {Balance:C}");
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            BankAccount account = null;
            bool exit = false;

            while (!exit)
            {
                Console.WriteLine("\nMenu:");
                Console.WriteLine("1. Create a new bank account");
                Console.WriteLine("2. Deposit money");
                Console.WriteLine("3. Withdraw money");
                Console.WriteLine("4. Display account details");
                Console.WriteLine("5. Exit");
                Console.Write("Choose an option (1-5): ");
                string choice = Console.ReadLine();

                switch (choice)
                {
                    case "1":
                        Console.Write("Enter account number: ");
                        string accNum = Console.ReadLine();
                        Console.Write("Enter holder name: ");
                        string name = Console.ReadLine();
                        account = new BankAccount(accNum, name);
                        Console.WriteLine("Account created successfully!");
                        break;
                    case "2":
                        if (account == null)
                        {
                            Console.WriteLine("Please create an account first.");
                        }
                        else
                        {
                            Console.Write("Enter amount to deposit: ");
                            if (decimal.TryParse(Console.ReadLine(), out decimal depositAmount))
                            {
                                account.Deposit(depositAmount);
                            }
                            else
                            {
                                Console.WriteLine("Invalid amount.");
                            }
                        }
                        break;
                    case "3":
                        if (account == null)
                        {
                            Console.WriteLine("Please create an account first.");
                        }
                        else
                        {
                            Console.Write("Enter amount to withdraw: ");
                            if (decimal.TryParse(Console.ReadLine(), out decimal withdrawAmount))
                            {
                                account.Withdraw(withdrawAmount);
                            }
                            else
                            {
                                Console.WriteLine("Invalid amount.");
                            }
                        }
                        break;
                    case "4":
                        if (account == null)
                        {
                            Console.WriteLine("Please create an account first.");
                        }
                        else
                        {
                            account.DisplayDetails();
                        }
                        break;
                    case "5":
                        exit = true;
                        Console.WriteLine("Goodbye!");
                        break;
                    default:
                        Console.WriteLine("Invalid option. Please try again.");
                        break;
                }
            }
        }
    }
}
