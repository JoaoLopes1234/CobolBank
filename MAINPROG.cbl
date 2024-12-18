       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAINPROG.
       AUTHOR. JOÃO LOPES.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 INPUT-USER            PIC X(1).
       01 END-PROGRAM           PIC X(1).
       
       PROCEDURE DIVISION.

       
       MAIN-PROGRAM.
           DISPLAY '1 - View All Clients'
           DISPLAY '2 - Add New Client'
           DISPLAY '3 - Update Client Information'
           DISPLAY '4 - Delete Client'
           DISPLAY '5 - Exit'
           DISPLAY '> ' WITH NO ADVANCING
           ACCEPT INPUT-USER
           EVALUATE INPUT-USER
               WHEN 1
                   CALL 'VIEWCLIE'
               WHEN 2
                   CALL 'ADDCLIE'
               WHEN 3
                   CALL 'UPDCLIE'
               WHEN 4
                   CALL 'DELECLIE'
               WHEN 5
                   MOVE 'F' TO END-PROGRAM

           END-EVALUATE

           IF END-PROGRAM NOT = 'F'
               PERFORM MAIN-PROGRAM.
           STOP RUN.
                   