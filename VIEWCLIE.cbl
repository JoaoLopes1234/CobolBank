       IDENTIFICATION DIVISION.
       PROGRAM-ID. VIEWCLIE.
       AUTHOR. JOÃO LOPES.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTS ASSIGN 'file/clients.txt'
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS FS-CLIENTS.

       DATA DIVISION. 
       FILE SECTION.

       FD CLIENTS.
       01 INPUT-CLIENT-REC.
           05 INPUT-CLIENT-ID       PIC 9(1).
           05 INPUT-CLIENT-NAME     PIC X(30).
       WORKING-STORAGE SECTION.
       01 WS-CLIENT-REC.
           05 WS-CLIENT-ID          PIC 9(1).
           05 WS-CLIENT-NAME        PIC X(30).

       01 INPUT-USER                PIC X(1).
       01 END-FILE                  PIC X(1).
       01 FS-CLIENTS                PIC X(2).
       
       PROCEDURE DIVISION.

       MAIN-LOGIC SECTION.

           OPEN INPUT CLIENTS
               
               PERFORM UNTIL END-FILE = 'S'
                   READ CLIENTS INTO WS-CLIENT-REC
                       AT END 
                           MOVE 'S' TO END-FILE
                       NOT AT END
                           DISPLAY WS-CLIENT-ID WS-CLIENT-NAME
                   END-READ
               END-PERFORM
                               
    
               DISPLAY 'Select your client or Press X to leave'
               DISPLAY '> ' WITH NO ADVANCING
               ACCEPT INPUT-USER
               EVALUATE INPUT-USER
                   WHEN 'X'
                       PERFORM CLOSE-PROGRAM
                   WHEN OTHER
                       CALL 'OPTICLIE' USING INPUT-USER
    
               END-EVALUATE.


       CLOSE-PROGRAM.
           CLOSE CLIENTS
           EXIT PROGRAM.
                   