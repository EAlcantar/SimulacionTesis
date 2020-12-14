ACTION CicloProceso: 
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks xmlns:dt="urn:schemas-microsoft-com:datatypes" maxcolumn="0">
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="GE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="cuentaTiempo"/>
			<function position="middle" type="GE"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="tiempoCicloTerminado"/>
		</row>
		<row>
			<analog type="input" name="tiempoCiclo"/>
			<function position="bottom" type="GE"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="tiempoCicloTerminado"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40" ENO="true"/></function>
			<analog type="output" name="cuentaTiempo"/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="open" name="tiempoCicloTerminado"/>
			<contact type="closed" name="iniciarTimer"/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="random"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="random"/>
			<function position="topbottom" type="REAL_TO_SINT"><input name="IN"/><output name="2"/></function>
			<function position="topbottom" type="ABS"><input name="IN"/><output name="42"/></function>
			<function position="topbottom" type="SINT_TO_UINT"><input name="IN"/><output name="6"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40" ENO="true"/></function>
			<analog type="output" name="banderaRandomRechazadaUINT"/>
			<function position="bottom" type="Compute!"><input name="&lt;! ((sysTime.millisec*sysTime.second*(sysTime.minute+5)/(sysTime.hour+3)+17)*3)"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="banderaRandomRechazada_Milisec"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!banderaRandomRechazadaUINT*MS_FACTOR"/></function>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="tiempoCicloTerminado"/>
			<contact type="closed" name="iniciarTimer"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="banderaRandomRechazada_Milisec"/>
			<function position="topbottom" type="UINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40" ENO="true"/></function>
			<analog type="output" name="valorTimer"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="tiempoCicloTerminado"/>
			<contact type="open" name="contarRechazo"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="piezasRechazadas"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<function position="bottom" type="Compute!"><input name="&lt;!piezasRechazadas + 1"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="open" name="resetRechazo"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="tiempoCicloTerminado"/>
			<contact type="closed" name="contarRechazo"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="piezasProducidas"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!piezasProducidas + 1"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="timerFinalizado"/>
			<contact type="open" name="tiempoCicloTerminado"/>
			<line/>
			<coil type="open" name="iniciarTimer"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="iniciarTimer" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="resetRechazo"/>
			<contact type="open" name="timerFinalizado"/>
			<line/>
			<coil type="open" name="contarRechazo"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="contarRechazo" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_rechazada" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="iniciarTimer"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q" ENO="true"/></functionblock>
			<analog type="output" name="timerFinalizado"/>
		</row>
		<row>
			<analog type="input" name="valorTimer"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET" ENO="true"/></functionblock>
			<empty/>
		</row>
	</network>
</networks>
END_ACTION




