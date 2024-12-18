       IDENTIFICATION DIVISION.
       PROGRAM-ID. VIEWACCO.
       AUTHOR. JOÃO LOPES.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ACCOUNTS ASSIGN 'file/accounts.txt'
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS FS-CLIENTS.

       DATA DIVISION. 
       FILE SECTION.

       FD ACCOUNTS.
       01 INPUT-ACCOUNT-REC            PIC X(35).

       WORKING-STORAGE SECTION.
       01 WS-ACCOUNT-REC.
           05 WS-ACCOUNT-ID-USER       PIC 9(1).
           05 WS-ACCOUNT-ID            PIC 9(1).
           05 WS-ACCOUNT-AMOUNT        PIC 9(5).

       01 INPUT-USER                   PIC X(1).
       01 END-FILE                     PIC X(1).
       01 FS-CLIENTS                   PIC X(2).

       LINKAGE SECTION.

       01 LK-USER-ID                   PIC X(1).
       
       PROCEDURE DIVISION.

      

       MAIN-LOGIC SECTION.
           OPEN INPUT ACCOUNTS
           
               PERFORM UNTIL END-FILE = 'S'
                   READ ACCOUNTS INTO INPUT-ACCOUNT-REC
                   AT END 
                       MOVE 'S' TO END-FILE
                   NOT AT END
                       UNSTRING INPUT-ACCOUNT-REC DELIMITED BY SPACE
                       INTO WS-ACCOUNT-ID-USER
                            WS-ACCOUNT-ID
                            WS-ACCOUNT-AMOUNT
                       IF LK-USER-ID = WS-ACCOUNT-ID-USER
                               
                           DISPLAY 'Account Owner: ' WS-ACCOUNT-ID-USER
                           DISPLAY 'Account ID: ' WS-ACCOUNT-ID
                           DISPLAY 'Account Balance: ' WS-ACCOUNT-AMOUNT
                           DISPLAY '****************************'
                       END-IF

                   END-READ
               END-PERFORM
                               
    
               DISPLAY 'Select your client or Press X to leave'
               DISPLAY '> ' WITH NO ADVANCING
               ACCEPT INPUT-USER
               EVALUATE INPUT-USER
                   WHEN 'X'
                       PERFORM CLOSE-PROGRAM
                   WHEN OTHER
                       DISPLAY 'CALMA' 
    
               END-EVALUATE.


       CLOSE-PROGRAM.
           CLOSE ACCOUNTS
           EXIT PROGRAM.
                   