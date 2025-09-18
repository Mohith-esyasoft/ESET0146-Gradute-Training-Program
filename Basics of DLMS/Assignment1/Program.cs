using System;

namespace DlmsCosemExample
{
    class Program
    {
        static void Main(string[] args)
        {
            // OBIS code for Active Energy Import 
            var obis = new ObisCode(1, 0, 1, 8, 0, 255);

            // Class ID for Register object is 3
            ushort classId = 3;
            byte attributeId = 2;

            byte[] apdu = GetRequestApduBuilder.BuildGetRequest(obis, classId, attributeId);

            Console.WriteLine("OBIS Code: " + obis);
            Console.WriteLine("GET Request APDU: " + BitConverter.ToString(apdu));
        }
    }
}
