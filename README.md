# Git shell

<img src="https://sun1-88.userapi.com/XZ4CBb7oAbgdoHZDyNF8-aENA5c_BRH_YrNveA/N2pPx78FMFI.jpg" width="100%" />

<details><summary>Educational material</summary>
  
If you like video and goint to know git superficially - here is a crash course: </br>

[![Linux Command Line Tutorial](https://i.ytimg.com/vi/SWYqp7iY_Tc/hqdefault.jpg)](https://www.youtube.com/watch?v=SWYqp7iY_Tc)
</br></br>
But if you want to know it depper - read well written official documentation [here](https://git-scm.com/book/en/v2). Lots of languages are available and you can use it as a cheat sheet.

</details>

## Exercise:

All tasks have to be completed via Terminal or any other CLI (command-line interface):

- [ ]  Fork [computer_literacy repo](https://github.com/russdreamer/computer_literacy) to your GitHub account
- [ ]  Clone forked repo using CLI onto your computer as a separate local repo
- [ ]  Open directory with the Git project `computer_literacy` in any CLI
- [ ]  Switch to `git_shell` branch
- [ ]  Open the conflict.txt file in the root of the git project  and solve all conflicts by leaving correct expressions only
- [ ]  There is `work` directory in the root of the project that contains an empty file `personal info.txt` (it won't be empty while testing) and a `conflict.txt` file. Create a file `action.sh` inside the `work` directory.
- [ ]  Open `action.sh` and write line by line shell commands that perform the following:

    Let's assume your current directory is the `work` directory.

    - [ ]  Initialize a new Git repository
    - [ ]  Create `employee.info` file inside the current directory
    - [ ]  Write into the `employee.info` file the following:

        ```bash
        name: Kevin
        sex: male
        age: 26
        ```

    - [ ]  Commit all changes with a message: `add basic information`
    - [ ]  Create a new branch named `education` and checkout on it
    - [ ]  Find the first line that contains an `education` word in `personal info.txt` file and add it into the `employee.info` file as the last line
    - [ ]  Commit all changes with a message: `add education info`
    - [ ]  Checkout back to the `master` branch
    - [ ]  Merge the `education` branch into the master branch
    - [ ]  Commit all changes with a message: `merge education info changes`
    - [ ]  Find the second line that contains a `work` word in `personal info.txt` file and add it into the `employee.info` file as the last line
    - [ ]  Commit all changes with a message: `add work experience info`
    - [ ]  Remove the `education` branch
- [ ]  Commit and push your changes to the remote repository on GitHub to the same `git_shell` branch (not master)
- [ ]  Go to "Actions" tab in your forked repo and check the last running result
- [ ]  If you see a yellow round - wait a minute, it's in progress. If it's a green check mark - Congratulations! If it's a red cross - click on it -> build -> expand an error line (likely your mistake is between dash lines as shown on the screen below)
<img src="https://sun9-40.userapi.com/ETWGSw6WropatVREKDUaFaOFGpuYIIZLE585-Q/hGrG8X_vbpk.jpg"/>
