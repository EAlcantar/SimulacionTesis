
ACTION IdlePopUpWindow: 
	
	TON_Idle_PopUp(IN := TRUE , PT := POP_UP_TIMER);
			
	IF TON_Idle_PopUp.Q THEN
		//Se muestra el pop up de paro
		idlePopUpStatus := SHOW;			
		TON_Idle_TimeDelay(IN := TRUE , PT := IDLE_DELAY_TIME); //Comienza el retardo de cierre del pop-up
		(*El usuario decide en que acumulador se contará el tiempo de paro*)
		//PARO POR RETRABAJO
		IF aceptarTiempoRetrabajo THEN
					
			TON_Idle_TimeDelay(IN := FALSE);
			tiempoRetrabajo := tiempoRetrabajo + (UDINT_TO_REAL(RTInfo_0.cycle_time)/1000000);
			idlePopUpStatus := HIDE;
			//PARO POR MANTENIMIENTO PROGRAMADO
		ELSIF aceptarTiempoMantto THEN
			
			TON_Idle_TimeDelay(IN := FALSE);
			TON_Mantto_TimeDelay(IN := TRUE , PT := IDLE_DELAY_TIME); //Comienza el retardo de cierre del pop-up

			idlePopUpStatus        := HIDE;
			maintenancePopUpStatus := SHOW;
			
			IF manttoPredictSelected THEN
				
				TON_Mantto_TimeDelay(IN := FALSE);
				tiempoManttoPredict    := tiempoManttoPredict + (UDINT_TO_REAL(RTInfo_0.cycle_time)/1000000);
				maintenancePopUpStatus := HIDE;
				
			ELSIF manttoAutonomoSelected THEN
				
				TON_Mantto_TimeDelay(IN := FALSE);
				tiempoManttoAutonomo   := tiempoManttoAutonomo + (UDINT_TO_REAL(RTInfo_0.cycle_time)/1000000);
				maintenancePopUpStatus := HIDE;
				
			ELSIF TON_Mantto_TimeDelay.Q THEN	
				tiempoOcioso 	:= tiempoOcioso + (UDINT_TO_REAL(RTInfo_0.cycle_time)/1000000);
			END_IF;
			
			tiempoManttoTotal 	:= tiempoManttoAutonomo + tiempoManttoPredict;
			
			//PARO DE TIEMPO OCIOSO
		ELSIF TON_Idle_TimeDelay.Q THEN	
			tiempoOcioso 	:= tiempoOcioso + (UDINT_TO_REAL(RTInfo_0.cycle_time)/1000000);
		END_IF;
	END_IF;

END_ACTION
