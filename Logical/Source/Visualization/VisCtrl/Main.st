

PROGRAM _CYCLIC
	
	MpPackMLBasicUI_Simulador(MpLink := ADR(gPackMLCore), Enable := TRUE, UIConnect := ADR(MpPackMLBasicUIConnect));
	MpPackMLStatisticsUI_0(MpLink := ADR(gPackMLCore), Enable := TRUE, UIConnect := ADR(MpPackMLStatisticsUIConnect));
	
	MpOeeCoreUI_Simulador(MpLink := ADR(gOeeCore), Enable := TRUE, UIConnect := ADR(MpOeeCoreUIConnect));
	MpOeeListUI_Simulador(MpLink := ADR(gOeeCore), Enable := TRUE, UIConnect := ADR(MpOeeListUIConnect));
	MpOeeTimelineUI_Simulador(MpLink := ADR(gOeeCore), Enable := TRUE, UIConnect := ADR(MpOeeTimelineUIConnect));
	MpOeeTrendUI_Simulador(MpLink := ADR(gOeeCore), Enable := TRUE, UIConnect := ADR(MpOeeTrendUIConnect));
	 
END_PROGRAM

PROGRAM _EXIT
	
	IF EDGENEG(paro) THEN
		MpPackMLBasicUIConnect.StateControl.Stop := TRUE;
	END_IF;
	
	MpPackMLBasicUI_Simulador(Enable := FALSE);
	MpPackMLStatisticsUI_0(Enable := FALSE);
	
	MpOeeCoreUI_Simulador(Enable := FALSE);
	MpOeeListUI_Simulador(Enable := FALSE);
	MpOeeTimelineUI_Simulador(Enable := FALSE);
	MpOeeTrendUI_Simulador(Enable := FALSE);
	
END_PROGRAM

