# Shell advanced

<img src="https://sun9-30.userapi.com/iOEETrzD9N-ZB8P-eYtp-Wpaj6LwUYW6768YlQ/tqy6H9-g-L0.jpg" width="100%" />

<details><summary>Educational material</summary>
  
There is a huge playlist that helps you to cope the exercises. This time watch videos from 20th to 40th to know bash deeper: </br>

[![Linux Command Line Tutorial](https://i.ytimg.com/vi/YHFzr-akOas/hqdefault.jpg)](https://www.youtube.com/watch?v=-GNxBGja9xw&list=PLS1QulWo1RIb9WVQGJ_vh-RQusbZgO_As&index=20)
</br></br>
Learn bash comparison operators for numbers and strings [here](https://www.tldp.org/LDP/abs/html/comparison-ops.html)
</br>
You can also check the whole [Unix command list](https://en.wikipedia.org/wiki/List_of_Unix_commands).

</details>

## Exercise:

All tasks have to be completed via Terminal or any other CLI (command-line interface):
- [ ]  Fork [computer_literacy repo](https://github.com/russdreamer/computer_literacy) to your GitHub account
- [ ]  Clone forked repo using SourceTree onto your computer as a separate local repo
- [ ]  Open directory with the Git project `computer_literacy` in SourceTree
- [ ]  Switch to `shell_advanced` branch
- [ ]  There is `work` directory in the root of the project that contains an empty file `persons.txt` (it won't be empty while testing). Create a file `action.sh` inside the `work` directory. 
- [ ]  Open `action.sh` and write line by line shell comands that perform the following:<br/>
    Let's assume your current directory is the work directory
    - [ ]  Create `content.txt` file inside the `work` directory
    - [ ]  Find all the lines in the `persons.txt` file that contain `Isabella` and write them into the `content.txt` file
    - [ ]  Also find all the lines in the `persons.txt` that contain `63 Wall Street` and using `test`, `&&`, `||`, `wc` and other commands do the following:
        - [ ]  If there are 4 or more such lines, then write them all into `63_Wall_Street.txt` inside the `work` directory
        - [ ]  If there is no such line, then create inside the `work` directory a file named `error.txt` that only contains text `no entities`
        - [ ]  If there are 3 or less such lines, but not zero,  then:
            - [ ]  Write the first line into `63_Wall_Street_1.txt` file inside the `work` directory
            - [ ]  Write the second line into `63_Wall_Street_2.txt` file inside the `work` directory
                - [ ]  If there are less than 2 such lines, then write `no second line` into the `63_Wall_Street_2.txt` file
            - [ ]  Write the third line into `63_Wall_Street_3.txt` file inside the `work` directory
                - [ ]  If there are less than 3 such lines, then write `no third line` into the `63_Wall_Street_3.txt` file
    - [ ]  By using `curl` command write the whole content (a server response on GET request) of [this page](https://www.google.com) into a `google site.html` inside the `work` directory
    - [ ]  Find all the lines that contain [links](https://www.w3schools.com/html/html_links.asp) on [this page](https://github.com/russdreamer/computer_literacy)(a server response on GET request) and write them into a `links.html` file inside the `work` directory. When you open `links.html` file in a browser, you should see a page consisting of lines, each of which has a link
    - [ ]  [Install package manager Homebrew](https://brew.sh/)
    - [ ]  Using Homebrew install [tree command](https://formulae.brew.sh/formula/tree), that displays a tree of directories and files
    - [ ]  Create a `tree_result.txt` file inside the `work` directory
    - [ ]  Run `tree` command without any options inside the `work` directory and write its result into the `tree_result.txt` file
- [ ]  Commit and push your changes to the remote repository on GitHub to the same `shell_advanced` branch (not master)
- [ ]  Go to "Actions" tab in your forked repo and check the last running result
- [ ]  If you see a yellow round - wait a minute, it's in progress. If it's a green check mark - Congratulations! If it's a red cross - click on it -> build -> expand an error line (likely your mistake is between dash lines as shown on the screen below)
<img src="https://sun9-40.userapi.com/ETWGSw6WropatVREKDUaFaOFGpuYIIZLE585-Q/hGrG8X_vbpk.jpg"/>
