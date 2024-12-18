       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADDCLIE.
       AUTHOR. JOÃO LOPES.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTS ASSIGN 'file/clients.txt'
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS FS-CLIENTS.

       DATA DIVISION.
       FILE SECTION.
       FD CLIENTS.
       01 CLIENTS-REC.
           05 CLIENTS-ID            PIC 9(1).
           05 CLIENTS-NAME          PIC X(30).

       WORKING-STORAGE SECTION.
       01 NEW-CLIENT-ID                 PIC 9(1) VALUE 0.
       01 NEW-CLIENT-NAME               PIC X(30).
      *    VARIABLE END-FILE
       01 END-FILE                      PIC X(1) VALUE 'N'.
      *    VARIABLE FILE STATUS 
       01 FS-CLIENTS                    PIC 9(2).

       PROCEDURE DIVISION.

           DISPLAY "Que nome gostaria de dar ao seu cliente?"
           ACCEPT NEW-CLIENT-NAME
      ******************************************************************
      *    ENCONTRAR O ULTIMO CLIENTE
      ******************************************************************
           OPEN INPUT CLIENTS

           PERFORM UNTIL END-FILE = 'S'
               READ CLIENTS INTO CLIENTS-REC
               AT END
                   MOVE 'S' TO END-FILE
               NOT AT END
                   MOVE CLIENTS-ID TO NEW-CLIENT-ID
               END-READ
           END-PERFORM

           CLOSE CLIENTS
      ******************************************************************
      *    ADICIONAR NOVO CLIENTE
      ******************************************************************
           OPEN EXTEND CLIENTS
      * Incrementar o ID do novo cliente
           ADD 1 TO NEW-CLIENT-ID

      * Adicionar o novo cliente
           MOVE NEW-CLIENT-ID TO CLIENTS-ID
           MOVE NEW-CLIENT-NAME TO CLIENTS-NAME
           WRITE CLIENTS-REC.

           CLOSE CLIENTS.

           DISPLAY "Cliente adicionado com sucesso!".
           EXIT PROGRAM.
