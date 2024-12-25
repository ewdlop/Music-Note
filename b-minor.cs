using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Define the frequencies for the musical notes (in Hertz)
        Dictionary<string, int> noteFrequencies = new Dictionary<string, int>
        {
            {"B", 494},
            {"C#", 554},
            {"D", 587},
            {"E", 659},
            {"F#", 740},
            {"G", 784},
            {"A", 880}
        };

        // Define the duration for each note (in milliseconds)
        int duration = 500;

        // List of notes to be played
        string[] notes = { "B", "C#", "D", "E", "F#", "G", "A" };

        // Play each note
        foreach (var note in notes)
        {
            if (noteFrequencies.TryGetValue(note, out int frequency))
            {
                Console.WriteLine($"Playing note {note} at {frequency} Hz");
                Console.Beep(frequency, duration);
            }
            else
            {
                Console.WriteLine($"Note {note} not found in the dictionary.");
            }
        }
    }
}
