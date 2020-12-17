
ACTION CleanPopUpData: 
	
	//Reset del temporizador para el pop up
	TON_Idle_PopUp(IN := FALSE);
	TON_Mantto_TimeDelay(IN := FALSE);
	TON_Idle_TimeDelay(IN  := FALSE);
	aceptarTiempoRetrabajo := FALSE;
	aceptarTiempoMantto	   := FALSE;
	manttoAutonomoSelected := FALSE;
	manttoPredictSelected  := FALSE;

END_ACTION
