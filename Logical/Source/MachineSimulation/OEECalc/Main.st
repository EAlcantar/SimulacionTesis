
PROGRAM _INIT
	
	MpOeeCore_Simulador.Enable     := TRUE;
	MpOeeCore_Simulador.DeviceName := ADR('Historico');
	MpOeeCore_Simulador.MpLink     := ADR(gOeeCore);
	OeeParam.IdealCycleTime		   := REAL_TO_TIME(tiempoDeCiclo)*1000;
	MpOeeCore_Simulador.Parameters := ADR(OeeParam);
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	//Registrando un paro de máquina
	IF (MpPackMLStateCurrent(gPackMLCore) <> mpPACKML_STATE_EXECUTE) THEN
		MpOeeCore_Simulador.Downtime := TRUE;
	ELSE
		MpOeeCore_Simulador.Downtime := FALSE;
	END_IF;
		
	MpOeeCore_Simulador.PieceCounter  := piezasProducidasTotales;
	MpOeeCore_Simulador.RejectCounter := piezasRechazadas;
	MpOeeCore_Simulador();
	
END_PROGRAM

PROGRAM _EXIT
	
	MpOeeCore_Simulador(Enable := FALSE);
	 
END_PROGRAM

