ACTION CuentaTiempo: 
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks xmlns:dt="urn:schemas-microsoft-com:datatypes" maxcolumn="0">
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="UDINT_TO_REAL"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="RTInfo_0.cycle_time"/>
			<function position="bottom" type="UDINT_TO_REAL"><input name="IN"/><output name="8" ENO="true"/></function>
			<analog type="output" name="tiempoCicloREAL"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="42"/></function>
			<analog type="output" name="cuentaTiempo"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!cuentaTiempo + (tiempoCicloREAL/1000000.0)"/></function>
			<empty/>
		</row>
	</network>
</networks>
END_ACTION

