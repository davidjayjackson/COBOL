		>>SOURCE FORMAT FREE
		IDENTIFICATION DIVISION.                                        
		  PROGRAM-ID. FILEREAD.                                           
		  ENVIRONMENT DIVISION.                                           
		  INPUT-OUTPUT SECTION.                                            
		  FILE-CONTROL.                                                    
			  SELECT FILE1 ASSIGN TO DISK1.                                
			  ORGANIZATION IS SEQUENTIAL                                   
			  ACCESS MODE IS SEQUENTIAL                                    
			  FILE STATUS IS WS-FS.                                       
		  DATA DIVISION.                                                  
		  FILE SECTION.                                                   
			  RECORD CONTAINS 80 CHARACTERS.                              
			  BLOCK CONTAINS 800 CHARACTERS.                              
			  RECORDING MODE IS F.                                        
			  DATA RECORD IS STD-REC.                                      
		  FD  FILE1.                                                       
		  01 STD-REC.                                                     
			  02 STD-NO          PIC 9(03).                               
			  02 STD-NAME        PIC X(20).                                
			  02 STD-GENDER      PIC X(07).                               
			  02 FILLER          PIC X(50).                               
		  WORKING-STORAGE SECTION.                                         
		  77 WS-FS               PIC 9(02).                                
		  01 WS-EOF-SW           PIC X(01) VALUE 'N'.                     
			 88 EOF-SW           VALUE 'Y'.                                
			 88 NOT-EOF-SW       VALUE 'N'.                                
		  PROCEDURE DIVISION.                                              
			  DISPLAY 'SEQUENTIAL FILE READING...'.                        
			  OPEN INPUT FILE1.                                            
			  PERFORM UNTIL EOF-SW                                        
				 READ FILE1                                               
				 AT END MOVE 'Y' TO WS-EOF-SW                              
				 DISPLAY 'RECORD READ : ' STD-REC                          
			  END-PERFORM.                                                 
			  CLOSE FILE1.                                                 
			  STOP RUN.                                                    
