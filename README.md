 # 📂 Folder Size Check (Batch & PowerShell)

## 📌 Overview
**Folder Size Check** is a script that allows users to analyze the disk usage of a given directory, listing all subdirectories along with their sizes.  
The script is executed via a `.bat` file, which launches a PowerShell script to prompt the user for a directory path and display the results in a graphical table (`Out-GridView`).

## 🎯 Features
- Lists all subdirectories along with their total size.
- Includes the size of the main directory in the report.
- Displays results in a graphical table for better readability.
- Handles errors gracefully, ensuring the script does not close unexpectedly.

## 🚀 How It Works
1. The user runs the `folder_size_check.bat` file.
2. A PowerShell script is executed, prompting the user to enter a directory path.
3. The script calculates the size of each subdirectory and the main folder.
4. Results are displayed in a graphical table (`Out-GridView`).

## 🛠 Setup & Usage
### 🔧 **Prerequisites**
- Windows 10 or later  
- PowerShell 5.1 or later (pre-installed on most Windows versions)  

### ▶ **How to Run**
1. **Download or clone the repository**  
   ```sh
   git clone https://github.com/drlecks/folder_size_check.git
   cd folder_size_check
   ```
2. **Run the batch file**  
   Simply double-click `folder_size_check.bat`, or run it from the command prompt:
   ```sh
   folder_size_check.bat
   ```
3. **Enter a folder path** when prompted (e.g., `C:\Program Files`).
4. **View the results** in a graphical table.


### **PowerShell Script (`folder_size_check.ps1`)**
This script:
- Asks for a directory path
- Calculates the size of the main folder and its subdirectories
- Displays the data in `Out-GridView`
- Prevents the window from closing immediately in case of errors


## 🐟 License
This project is open-source and available under the MIT License.

## 🤝 Contributing
Contributions are welcome! Feel free to open an issue or submit a pull request.

Want to colaborate?
- Add support for exporting results to a `.csv` file.
- Add options to filter by file size or type.
- Improve performance for very large directories.

---
### 📌 **Notes**
- The script **requires administrative privileges** if analyzing system-protected folders.
- Running it on **very large directories** may take some time.
- The batch script ensures **PowerShell runs with execution policy bypassed**, so no need to modify system settings.

---
Made with ❤️ by [drlecks](https://github.com/drlecks) (and IA ;))

