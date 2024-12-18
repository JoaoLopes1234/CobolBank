       IDENTIFICATION DIVISION.
       PROGRAM-ID. OPTICLIE.
       AUTHOR. JOÃO LOPES.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION. 
       WORKING-STORAGE SECTION.

       01 INPUT-USER                PIC X(1).

       LINKAGE SECTION.

       01 LK-USER-ID             PIC X(1).
       PROCEDURE DIVISION USING LK-USER-ID.

       MAIN-LOGIC SECTION.
                                   
               DISPLAY '1 - View Balance'
               DISPLAY '2 - Deposit Money'
               DISPLAY '3 - Withdraw Money'
               DISPLAY '4 - Open account'
               DISPLAY '5 - Exit'
               DISPLAY '> ' WITH NO ADVANCING
               ACCEPT INPUT-USER
               EVALUATE INPUT-USER
                   WHEN 1
                       CALL 'VIEWACCO' USING LK-USER-ID
                   WHEN 2
                       CALL 'DEPOSIT'
                   WHEN 3
                       CALL 'WITHDRAW'
                   WHEN 4
                       CALL 'OPENACCO'
                   WHEN 5
                       PERFORM CLOSE-PROGRAM
    
               END-EVALUATE.


       CLOSE-PROGRAM.
           EXIT PROGRAM.
                   