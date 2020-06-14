# Shell basic

<img src="https://sun9-62.userapi.com/TX4yvG7m1Ntrit7Z3fRCRtiC-KhZtKLLWbURFQ/MWtGYN9oUMI.jpg" width="100%" />

<details><summary>Educational material</summary>
  
There is a huge playlist that helps you to cope the exercises. It's enough to watch first 20 videos: </br>

[![Linux Command Line Tutorial](https://i.ytimg.com/vi/YHFzr-akOas/hqdefault.jpg)](https://www.youtube.com/watch?v=YHFzr-akOas&list=PLS1QulWo1RIb9WVQGJ_vh-RQusbZgO_As)
</br></br>
You can also check the whole [Unix command list](https://en.wikipedia.org/wiki/List_of_Unix_commands).

</details>

## Exercise:

All tasks have to be completed via Terminal or any other CLI (command-line interface):

- [ ]  Fork [computer_literacy repo](https://github.com/russdreamer/computer_literacy/) to your GitHub account
- [ ]  Clone forked repo using SourceTree onto your computer as a separate local repo
- [ ]  Open deirectory with the Git project `computer_literacy` in SourceTree
- [ ]  Switch to `shell_basic` branch
- [ ]  There is `sh` directory in the root of the project that contains three empty files: `first.sh`, `second.sh`, `third.sh`
- [ ]  Open `first.sh` and write line by line shell comands that perform the following:
    - [ ]  Create a directory named `work` in the current dirrectory
    - [ ]  Create file named `employees.list` inside that `work` directory
    - [ ]  Write 5 lines into this file, where each line is an employee name, like:
    ```
      Kate
      Bob
      ...
    ``` 
    - [ ]  Create a directory chain `reports/2020/january/31/logitech/Europe/Netherlands/Utrecht/design/web design/` inside the `work` 
    - [ ]  Inside the created directory `web design` create a file named `list.txt`
    - [ ]  Also create a file `path.txt` inside the same `web design` directory 
    - [ ]  Write into file `path.txt` an absolute path of the `work` directory, like `usr/Alex/work`. Don't hardcode the path. Use a bash command to determine and write it. Your command has to be project location independent and write the correct path even if the project is moved to another directory.
    - [ ]  Return to the parent directory of the `work` folder
- [ ]  Open `second.sh` and write line by line shell comands that perform the following:
    - [ ]  Create `employees_backup.list` inside the `work` directory
    - [ ]  Write into file `employees_backup.list` a line `Employees:` followed by next line, that contains a content of `employees.list` file. In total 6 lines are expected to be.
    - [ ]  Write into the previously created file `list.txt` a result of `ls -A` command performed inside the `work` directory. Don't hardcode it
    - [ ]  Return to the parent directory of the `work` folder
- [ ]  Open `third.sh` and write line by line shell comands that perform the following:
    - [ ]  Remove `reports` directory
    - [ ]  Create `backups` directory inside the `work` directory
    - [ ]  Move `employees_backup.list` file into `backups` directory
    - [ ]  Create `show_all_files.sh` file inside the `work` directory
    - [ ]  Write text `ls` (not a result of the command) into `show_all_files.sh` file
    - [ ]  Allow execute permissions of `show_all_files.sh` for the current user.
- [ ]  Commit and push your changes to the remote repository on GitHub to the same `shell_basic` branch (not master)
- [ ]  Go to "Actions" tab in your forked repo and check the last running result
- [ ]  If you see a yellow round - wait a minute, it's in progress. If it's a green check mark - Congratulations! If it's a red cross - click on it -> build -> expand an error line (likely your mistake is between dash lines as shown on the screen below)
<img src="https://sun9-40.userapi.com/ETWGSw6WropatVREKDUaFaOFGpuYIIZLE585-Q/hGrG8X_vbpk.jpg"/>
