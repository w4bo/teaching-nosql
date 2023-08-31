# NoSQL in Action!

NoSQL (Not Only SQL) exercises against relational, key-value, document, graph, and columnar databases.

## Install
- What we need?
    - Docker
    - NodeJS
    - Robo3t
    - Git
- How to install?
    - [Quick installation (only for Windows)](instructions/QuickInstall.md).
    - [Other way (also for Mac and Linux)](instructions/OtherInstall.md)
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
- Run from a new terminal (cmd.exe in Windows and Terminal in Mac/Linux)
    >   
        cd Documents 
        git clone https://github.com/ChiaraFor96/fitstic-nosql-2023.git
- All the files will be in the folder Documents\fitstic-nosql-2023

## Running the software and download slides
- __***REMEMBER***: do not change (modify or delete) files in the directory "fitstic-nosql-2023"__, just copy a file changing the name for have your own version.

- Open a new terminal (cmd.exe in Windows and Terminal in Mac/Linux) and run the following commands:
    - Windows
        >
            cd Documents\fitstic-nosql-2023
            cd code
            .\start.bat
    - Linux / Mac
        > 
            cd Documents/fitstic-nosql-2023
            cd code
            sh start.sh
    
    __In both cases when you launch "start" script you can specify the name of the databases for reduce the number of executed processes.__
    - Cassandra:
        - .\start.bat cassandra cassandra-seed
    - Mongo:
        - .\start.bat mongodb mongodb-seed
    - Neo4J:
        - .\start.bat neo4j
    - Redis:
        - .\start.bat redis
    
    (for Linux/Max write "sh start.sh" instead of ".\start.bat")


If Windows complains about:
  - Running the scripts

    ![/imgs/win-docker4.png](imgs/win-docker4.png)
    
    and then

    ![/imgs/win-docker5.png](imgs/win-docker5.png)

  - Sharing directories

    ![/imgs/win-docker6.png](imgs/win-docker6.png)

- If everything runs well, the result should be something like:

    ![/imgs/docker-success.png](imgs/docker-success.png)

    - If some database is not up, because we start only some of them the test of the started databases must PASS, the others not.

## (Tentative) Calendar
- Lecture 01 (4h): Introduction to NoSQL databases (until slide 48) and start software installation
- Lecture 02 (4h): Introduction to NoSQL databases and software installation, Cassandra
- Lecture 03 (4h): Test teoria, Cassandra
- Lecture 04 (4h): Cassandra, Neo4J
- Lecture 05 (4h): Test Cassandra, Neo4J
- Lecture 06 (4h): Neo4J, MongoDB Find
- Lecture 07 (4h): Test Neo4J, MongoDB Find
- Lecture 08 (2h): Test MongoDB, ...