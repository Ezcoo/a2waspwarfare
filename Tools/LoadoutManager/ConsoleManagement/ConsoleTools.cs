using System;
using System.Collections.Generic;

class ConsoleTools 
{
    private static void WaitForCommand(string _command)
    {
        string userInput;
        do
        {
            userInput = Console.ReadLine();
        } while (userInput?.ToLower() != _command);
    }
}