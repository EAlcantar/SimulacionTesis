PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="DIRECCIONADOR"/>
			<function position="top" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<contact type="open"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PASO_1"/>
			<function position="bottom" type="EQ" or="true"><input name="" extensible="true"/></function>
			<analog type="input" name="PASO_2"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="DIRECCIONADOR"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty or="true"/>
			<line/>
			<line/>
			<line/>
			<coil type="set" name="TORRETA"/>
		</row>
	</network>
</networks>
END_PROGRAM

