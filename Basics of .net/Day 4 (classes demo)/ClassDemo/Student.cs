using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassDemo
{
    internal class Student
    {
        int accountnumber;
        string name;
        int age;
        string contactnumber;
        string emailid;

        public Student(int accno, string nm, int ag, string contact, string email)
        {
            accountnumber = accno;
            name = nm;
            age = ag;
            contactnumber = contact;
            emailid = email;
        }

        public void initialize(int accno, string nm, int ag, string contact, string email) {
            accountnumber = accno;
            name = nm;
            age = ag;
            contactnumber = contact;
            emailid = email;
            Console.WriteLine("Object has been created");

        }

        public void showDisplay() {
            Console.WriteLine("Account Number: " + accountnumber);  
            Console.WriteLine("Name: " + name); 
            Console.WriteLine("Age: " + age);   
            Console.WriteLine("Contact Number: " + contactnumber);
            Console.WriteLine("Email ID: " + emailid);

        }

        public void changecontactnumber(string newcontact) {
            contactnumber = newcontact;
        }

        public void changeemailid(string newemail) {
            emailid = newemail;
        }

    }
}
