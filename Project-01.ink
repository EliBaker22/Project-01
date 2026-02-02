/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR has_key = false
VAR job_status = "employed"

-> Apartment

=== Apartment ===
You just woke up from you're alarm what do you do?
+ [Stay in your bed and go back to sleep.] -> Stay_in_bed
+ [Get out of bed to go to work.] -> Get_out_of_bed

=== Stay_in_bed ===
You stay in bed and go back to sleep causing you to get fired from your job.

~ job_status = "fired"

Ending: Fired
-> END

=== Get_out_of_bed ===
You decided to get out of your bed to get your day started. What do you do now?
+ [Look for your keys.] -> Find_keys
+ [Try to start your car] ->Try_start_car
+ [Go back to bed] -> Stay_in_bed

=== Find_keys ===
You check around your apartment and were able to find your car keys.

~ has_key = true

+ [Go outside to your car.] -> Try_start_car
+ [Go back inside your apartment.] -> Apartment

=== Try_start_car ===
You got in your car and turn you're car on.

{has_key: 
-> Car_starts

- else:
-> Car_wont_start
}
=== Car_starts ===
The car starts. -> Drive_to_work

=== Car_wont_start ===
You can't start your car. You don't have your keys.

+ [Go back inside and look for them.] -> Find_keys
+ [Give up and go back to bed.] -> Stay_in_bed

=== Drive_to_work ===
You start to drive to work, but there's traffic in the way. Suddenly you got a text from your boss.

+ [Go through traffic still.] -> Late_to_work
+ [Go back to your apartment and call in sick.] -> Call_in_sick

=== Late_to_work ===
You got to work late, and your boss is find with it.

~ job_status = "employed"

Ending: Employed still
-> END

=== Call_in_sick ===
You turn your car around and decided to head home insteaad of working today.

~ job_status = "On thin ice"

You got back to your apartment and got into your bed to go back to sleep. Hoping you did the right choice.

+ [Sleep and forget it.] -> Stay_in_bed
+ [Get out of bed and try again.] -> Apartment // loop back to the start