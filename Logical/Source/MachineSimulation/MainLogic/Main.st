
PROGRAM _INIT
	(* Insert code here *)
	mpPackMLCore_Simulador.Enable := TRUE;
	mpPackMLCore_Simulador.MpLink := ADR(gPackMLCore);
	mpPackMLMode_Simulador.Enable := TRUE;
	mpPackMLMode_Simulador.MpLink := ADR(gPackMLCore);
	mpPackMLMode_Simulador.ModeID := 1;
	
	RTInfo_0(enable := TRUE);
	
	tiempoCiclo := 5;
	
	//Escondiendo el pop up
	openPopUp := HIDE;
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	DTStructureGetTime_0(enable := TRUE, pDTStructure := ADR(sysTime));
	
	CASE mpPackMLCore_Simulador.StateCurrent OF
		
		mpPACKML_STATE_UNDEFINED:
			
			mpPackMLMode_Simulador.Activate := TRUE;	
			
		mpPACKML_STATE_IDLE:
			
			TON_Idle_PopUp(IN := TRUE , PT := POP_UP_TIMER);
			
			IF TON_Idle_PopUp.Q THEN
				
				idlePopUpStatus := SHOW;				
				tiempoOcioso 	:= tiempoOcioso + (UDINT_TO_REAL(RTInfo_0.cycle_time)/1000000);				
			END_IF;
		
		mpPACKML_STATE_STARTING:
			
			//Reset del temporizador para el pop up
			TON_Idle_PopUp(IN := FALSE);
			
			mpPackMLMode_Simulador.Start 		 := FALSE;
			mpPackMLMode_Simulador.StateComplete := TRUE;
		
		mpPACKML_STATE_EXECUTE:
			
			cuentaTiempo := cuentaTiempo + (UDINT_TO_REAL(RTInfo_0.cycle_time)/1000000);
			
			IF cuentaTiempo >= tiempoCiclo THEN
				
				cuentaTiempo := 0;
				
				IF NOT TON_rechazada.IN THEN	
					random 				           := ((sysTime.millisec*sysTime.second*(sysTime.minute+5)/(sysTime.hour+3)+17)*3); //Generando un numero pseudo aleatorio
					rejected 			           := REAL_TO_SINT(random);
					banderaRandomRechazada         := ABS(rejected);
					banderaRandomRechazada_Milisec := SINT_TO_UINT(banderaRandomRechazada)*MS_FACTOR;
					TON_rechazada.PT               := UINT_TO_TIME(banderaRandomRechazada_Milisec);
					TON_rechazada.IN               := TRUE; //Activando el timer para lanzar una pieza rechazada
				END_IF
				
				IF TON_rechazada.Q THEN
					TON_rechazada.IN := FALSE;
					TON_rechazada(); //Llamando al timer de rechazo
					piezasRechazadas := piezasRechazadas + 1;
				ELSE
					piezasProducidas := piezasProducidas + 1;
				END_IF;
			END_IF;
						
			TON_rechazada(); //Llamando al timer de rechazo
			
		mpPACKML_STATE_STOPPING:
			
			TON_rechazada.IN    				 := FALSE;
			TON_rechazada(); 
			cuentaTiempo 						 := 0; 
			mpPackMLMode_Simulador.Stop			 := FALSE;
			mpPackMLMode_Simulador.StateComplete := TRUE;
							
		mpPACKML_STATE_RESETTING:
			
			mpPackMLMode_Simulador.Reset		 := FALSE;
			mpPackMLMode_Simulador.StateComplete := TRUE;
		
		mpPACKML_STATE_ABORTING:
			
			TON_rechazada.IN    				 := FALSE;
			TON_rechazada(); 
			cuentaTiempo 						 := 0; 
			mpPackMLMode_Simulador.Abort		 := FALSE;
			mpPackMLMode_Simulador.StateComplete := TRUE;			
			
		mpPACKML_STATE_CLEARING:
		
			mpPackMLMode_Simulador.Clear		 := FALSE;
			mpPackMLMode_Simulador.StateComplete := TRUE;

	END_CASE;
	
	//Contador general de piezas producidas
	piezasProducidasTotales := piezasProducidas + piezasRechazadas;
	
	mpPackMLMode_Simulador();
	mpPackMLCore_Simulador();
	
	//Actualizando el comando de estado completo con un flanco positivo
	IF mpPackMLMode_Simulador.StateComplete AND (mpPackMLMode_Simulador.StateComplete <> OldStateComplete) THEN
		mpPackMLMode_Simulador.StateComplete := FALSE;
	END_IF;
	OldStateComplete := mpPackMLMode_Simulador.StateComplete;
		 
END_PROGRAM

PROGRAM _EXIT
	
	mpPackMLCore_Simulador.Enable := FALSE;
	mpPackMLCore_Simulador();
	mpPackMLMode_Simulador.Enable := FALSE;
	mpPackMLMode_Simulador();
	 
END_PROGRAM

