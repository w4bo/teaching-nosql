# NoSQL in Action!

NoSQL (Not Only SQL) exercises against relational, key-value, document, graph, and columnar databases.

## Install
- Click Start and type `powershell`
- Right-click Windows Powershell and choose ``Run as Administrator''
- Paste the following command into Powershell and press enter.
    > Set-ExecutionPolicy Bypass -Scope Process -Force; `
        iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
- Answer "Yes" when prompted
- Wait for the process to finish and close the PowerShell
- Reopen the power shell as adminstrator and run the following command:
    > choco install -y docker docker-desktop git nodejs robo3t
- Wait for the process to finish and restart the pc (if the process is locked sometimes press enter)
- Accept docker term of use and wait it starts
- Check all is installed:
    - `docker`: 
        - by opening "Docker Desktop" (search it in start, if is not already opened)
        - by opening a new terminal (cmd.exe in Windows) and running 
            > docker run hello-world 
    - `NodeJS`: by opening a new terminal (cmd.exe in Windows) and running 
        > node --version
        
        (e.g., the output should be v17.3.1)
    - `git`: by opening a new terminal (cmd.exe in Windows) and running 
        > git --version

        (e.g., the output should be v2.38)
- Run from a new terminal (cmd.exe in Windows)
    >   
        cd Documents 
        git clone https://github.com/ChiaraFor96/fitstic-nosql-2023.git
- All the files will be in the folder Documents\fitstic-nosql-2023

## Running the software and download slides

- Open a new terminal and run the following commands:
    >
        cd Documents\fitstic-nosql-2023 (replace it with the actual path)
        cd code
        start.bat


If Windows complains about:
  - Running the scripts

    ![/imgs/win-docker4.png](imgs/win-docker4.png)
    
    and then

    ![/imgs/win-docker5.png](imgs/win-docker5.png)

  - Sharing directories

    ![/imgs/win-docker6.png](imgs/win-docker6.png)

- If everything runs well, the result should be something like:

    ![/imgs/docker-success.png](imgs/docker-success.png)

## (Tentative) Calendar
- Lecture 01 (4h): Introduction to NoSQL databases
- Lecture 02 (4h): Cassandra
- Lecture 03 (4h): Test teoria, Cassandra
- Lecture 04 (4h): Cassandra, Neo4J
- Lecture 05 (4h): Test Cassandra, Neo4J
- Lecture 06 (4h): Neo4J, MongoDB Find
- Lecture 07 (3h): Test Neo4J, MongoDB Find
- Lecture 08 (3h): Test MongoDB, ...