<div id="createLinkForm{$item.fID}" style="display: none">
	<form method="post" action="{$root}{$page}" enctype="multipart/form-data">
		<input type="hidden" name="fID" value="{$item.fID}" />
		<h2>Link für Studenten freigeben</h2>
		<label for="fLinkExpireDatetime">Link freigeben bis:</label>
		<select name="fLinkExpireDatetime[d]">
			{section name="i" start=1 loop=32 step=1}
			<option {if $smarty.now|date_format: "%d" == {$smarty.section.i.index}}selected="selected"{/if}>{$smarty.section.i.index|number_format:2}</option>
			{/section}
		</select>
		.
		<select name="fLinkExpireDatetime[m]">
			{section name="i" start=1 loop=13 step=1}
			<option {if $smarty.now|date_format: "%m" == {$smarty.section.i.index}}selected="selected"{/if}>{$smarty.section.i.index|number_format:2}</option>
			{/section}
		</select>
		.
		<select name="fLinkExpireDatetime[Y]">
			{section name="i" start=$smarty.now|date_format: "%Y" loop=$smarty.now|date_format: "%Y" + 5 step=1}
			<option>{$smarty.section.i.index|number_format:4}</option>
			{/section}
		</select>

		<select name="fLinkExpireDatetime[H]">
			{section name="i" start=0 loop=24 step=1}
			<option {if $smarty.now|date_format: "%H" == {$smarty.section.i.index}}selected="selected"{/if}>{$smarty.section.i.index|number_format:2}</option>
			{/section}
		</select>
		:
		<select name="fLinkExpireDatetime[M]">
			{section name="i" start=0 loop=59 step=1}
			<option {if $smarty.now|date_format: "%M" == {$smarty.section.i.index}}selected="selected"{/if}>{$smarty.section.i.index|number_format:2}</option>
			{/section}
		</select>
		Uhr
		<!-- <br /> -->
		<!-- <input type="text" name="fLinkExpireDatetime" id="fLinkExpireDatetime" value="2013-12-12 23:59:59" /> -->
		<br />
		<br />
		<input type="submit" name="button[createLink]" value="freigeben" />
	</form>
</div>