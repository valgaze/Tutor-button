Build_clean.bat
=========

I had a problem and built a  silly thing to fix it. Everytime I went in to help tutor highschool students there were several repetitive tasks that unnecessarily ate up time:

  - Load up the appointment webite and Gmail
  - Create a new text file to take session notes according to a template, date it, save it in a specifie date format
  - Rearrange windows 

This ritual of keystrokes and clicks just to get setup seemed like it was begging for automation so I went ahead and automated it using a windows batch file.

I discovered that once you get the hang of the eccentricities of batch files that you can do some pretty neat things.

After the batch file was wired together I added a small touch on my deskop using a shortcut I called the "The Button." With a single click the batch file would load, do its thing and I could get back down to business distraction free. Also added a "careless" option that makes sure if the batch is run twice in the same day (say a student is using the computer and an errant click occurs) the batch searches to see if its date file already exists and if it does it akss the user to definitely confirm (by literally typing "confirm") they want to overwrite it.



Installation
--------------

Pretty straight forward, tweak to liking and run! One thing to keep an eye out for is how batch files deal with dates, it takses some persistence:
```

@echo off
:: HERE WE SET THE DATE VARIABLES based on the global %date% result
::----------------------------------------------------------------
set "day=%date:~-7,2%"
set "year=%date:~-4%"
set "monthnum=%date:~-10,2%"
set "monthname=November"
set "filename=%day%_%monthname%_%year%.txt"
::----------------------------------------------------------------


```

To-dos
----
*Deal with months properly (ex month_num=1 corresponds to January)

*Calculate the number of students for the session to be the loop count


License
----
n/a
