
# Haskell Projects
This project aims to provide a template that you can use solving your tasks

### Prerequesties
*  Download and install [Haskell](https://docs.haskellstack.org/en/stable/install_and_upgrade/#windows) for your platform 
*  Download and install [IntelliJ IDEA Community Edition](https://www.jetbrains.com/idea/download/?gclid=CjwKCAjwmKLzBRBeEiwACCVihpKD0NhE_Zsq_tMZFtdpDNpD05TZrws06NIKO_UCXXmuTT8XTsH-JhoCKd0QAvD_BwE#section=windows)
*  Update stack (build tool for Haskell) using command:

`$ stack upgrade`

*  Install IntelliJ-Haskell plugin using this [manual](https://www.jetbrains.com/help/idea/managing-plugins.html)

# Lab1
1.  Launch IntelliJ IDEA Community Edition
2.  *   Inside IntelliJ use `File > New > Project from Existing Sources...` from the IntelliJ menu
    *   In the `Welcome to IntelliJ IDEA` dialog use `Import Project`
3.  In the `New Project wizard` select `Import project from external model` and check `Haskell Stack`
4.  In next page of wizard configure Project SDK by configuring Haskell Tool Stack with selecting path to stack binary
5.  Finish wizard and project will be opened

### MySQL
1.  Download and install [MySQL](https://dev.mysql.com/downloads/installer/) (for Windows)
2.  Set up:
    *   login: 'root'
    *   password: 'root'
3.  Leave all other settings by default, except one: on `Authentication Method` stage configure server to use `Legacy Authentication Method` (you can change this settings during [update or reinstallation](https://dev.mysql.com/doc/mysql-installer/en/server-authentication-method.html))
4.  After installation launch MySQL Workbench, connect to MySQL server on localhost
5.  Create new schema named `sport_on_faculty` and set it as default DB.
5.  Load and launch sql script named `sport_on_faculty_database_init.sql` for DB initialization.

### Run tests
Create New Configuration for Tests:

1.  Press Configuration menu and pick `Edit configurations...`
2.  Pick `Add new configuration > Haskell Stack > Haskell Stack Tester`
3.  Set configuration name
4.  Launch tests with `Start` button

### Run program
Create New Configuration for Lab1:

1.  Press Configuration menu and pick `Edit configurations...`
2.  Pick `Add new configuration > Haskell Stack > Haskell Stack Runner`
3.  Set configuration name
4.  Launch program with `Start` button
5.  Follow console instructions

# Lab2
1.  Launch IntelliJ IDEA Community Edition
2.  *   Inside IntelliJ use `File > New > Project from Existing Sources...` from the IntelliJ menu
    *   In the `Welcome to IntelliJ IDEA` dialog use `Import Project`
3.  In the `New Project wizard` select `Import project from external model` and check `Haskell Stack`
4.  In next page of wizard configure Project SDK by configuring Haskell Tool Stack with selecting path to stack binary
5.  Finish wizard and project will be opened

### Run tests
Create two New Configurations for Tests:

1.  Press Configuration menu and pick `Edit configurations...`
2.  Pick `Add new configuration > Haskell Stack > Haskell Stack Tester`
3.  Choose testsuite (`Lab2:test:Lab2-test` or `Lab2:test:Lab2-threaded-test`)
4.  Set configuration name
5.  Launch tests with `Start` button

### Run program
Create two New Configurations for Lab2:

1.  Press Configuration menu and pick `Edit configurations...`
2.  Pick `Add new configuration > Haskell Stack > Haskell Stack Runner`
3.  Choose executable (`Lab2-exe` or `Lab2-threaded-exe`)
4.  Set up program arguments: `h n +RTS -s -Nx` where
    *  h - number of vertexes in graph
	*  n - number of edges in graph, less than h^2
	*  +RTS -s - show statistics of memory usage and time execution
	*  x - number of threads (-Nx for `Lab2-threaded-exe` only)
5.  Set configuration name
6.  Launch program with `Start` button
7.  Follow console instructions

### Productivity measuring
For productivity measuring set up same h and n for `Lab2-exe` and `Lab2-threaded-exe` (for example h = 500, and n = 1000), and set up x for `Lab2-threaded-exe` (for example x = 4). 
Then after measuring of execution time of `Lab2-exe` and `Lab2-threaded-exe` compare each value.

# Tasks

## Task1
1.  Launch IntelliJ IDEA Community Edition
2.  *   Inside IntelliJ use `File > New > Project from Existing Sources...` from the IntelliJ menu
    *   In the `Welcome to IntelliJ IDEA` dialog use `Import Project`
3.  In the `New Project wizard` select `Import project from external model` and check `Haskell Stack`
4.  In next page of wizard configure Project SDK by configuring Haskell Tool Stack with selecting path to stack binary
5.  Finish wizard and project will be opened

### Run tests
Create New Configuration for Tests:

1.  Press Configuration menu and pick `Edit configurations...`
2.  Pick `Add new configuration > Haskell Stack > Haskell Stack Tester`
3.  Set configuration name
4.  Launch tests with `Start` button

### Run program
Create New Configuration for Task1:

1.  Press Configuration menu and pick `Edit configurations...`
2.  Pick `Add new configuration > Haskell Stack > Haskell Stack Runner`
3.  Set configuration name
4.  Launch program with `Start` button
5.  Follow console instructions

### Input
Program awaits 2 numbers separated with space: x y. 1 <= x, y <= 8

# Additional information

* https://www.haskell.org/
* https://wiki.haskell.org/Haskell_in_5_steps
* https://www.tutorialspoint.com/haskell/haskell_functions.htm
* https://hackage.haskell.org/package/HUnit
* https://caiorss.github.io/Functional-Programming/haskell/UnitTest_Hunit.html
