
PROGRAM _INIT
	
	MpOeeCore_Simulador.Enable     := TRUE;
	MpOeeCore_Simulador.DeviceName := ADR('Historico');
	MpOeeCore_Simulador.MpLink     := ADR(gOeeCore);
	OeeParam.IdealCycleTime		   := T#5s;
	MpOeeCore_Simulador.Parameters := ADR(OeeParam);
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	MpOeeCore_Simulador.PieceCounter  := piezasProducidasTotales;
	MpOeeCore_Simulador.RejectCounter := piezasRechazadas;
	MpOeeCore_Simulador();
	
END_PROGRAM

PROGRAM _EXIT
	
	MpOeeCore_Simulador(Enable := FALSE);
	 
END_PROGRAM

