# SupplyDrive

Research Goal 
This research explores how to automate the entire pipeline of receiving customer initials from 
an ERP system, injecting those initials into a 3D model, converting the model into an STL file 
(the standard for 3D printing), and saving that file uniquely for further use. The goal is to 
establish a seamless, repeatable, and scalable solution that can be adapted into a 
professional production workflow.


Context Recap 
• A customer inputs initials via an ERP system 
• The system should automatically: 
1. Insert those initials into a 3D model SCAD file 
2. Convert that model into an STL 
3. Save or deliver that STL for 3D slicing printing (via SimplyPrint, OctoPrint,) 
• This ensures an automated personalized 3D object is created per customer, without 
manual intervention


Used Stack 
OpenSCAD: A script-based 3D modeling tool that supports variable overrides from the 
command line, making it ideal for dynamic customization. 
PowerShell: Widely library available shell on Windows systems, capable of running 
automation tasks and executing system-level commands, to which I’m most comfortable and 
confident with working.  
PrusaSlicer: A 3D slicer used to verify that the output .stl file contains the expected geometry. 
TXT file input: To simulate the ERP data in a demo environment

STL Generation: 
• Uses OpenSCAD’s CLI API to convert the modified SCAD file into an STL, 
• Names it after the customer ($itemcostumer.stl), 
• Waits for each one to complete before moving on. 
In Research Context: This completes the STL conversion pipeline — turning dynamic input 
into a real, printable 3D file. 
Troubleshooting & Debugging 
A key challenge encountered during this process was correctly passing the string variable 
(text_input) from PowerShell into OpenSCAD. OpenSCAD expects string values to be 
enclosed in quotes, and Windows PowerShell requires a specific syntax to properly escape 
these quotes. 
Early attempts to pass the variable with single quotes failed, as OpenSCAD interpreted the 
variable as a literal and not a dynamic string. Through debugging, it became clear that 
PowerShell needed to use double quotes and escape internal quotes using double double
quotes ("") instead of backticks or single quotes. Once this was corrected, OpenSCAD 
correctly received and applied the initials variable, and the resulting STL file displayed the 
expected customer-specific text. 
Another subtle issue was font compatibility. In headless rendering (command-line mode), 
OpenSCAD may fail to load certain fonts unless they are correctly installed and accessible on 
the system. To prevent this, a generic sans-serif font or no specific font was used to ensure 
compatibility across different systems. 


Infrastructure Architecture Development
![image](https://github.com/user-attachments/assets/c7dca5ed-fd5e-45c5-8d5e-7e4c9b48a7ad)
