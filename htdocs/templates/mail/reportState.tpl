Hallo <b>{$r.uName} {$r.uLastname}</b>,<br />
<br />
soeben wurde Ihre Plagiatsprüfung auf <a href="{$root}">plagiatsjaeger.info</a> abgeschlossen.<br />
<br />

<table>
	<tr>
		<th>Status:</th>
		<td colspan="3">{$r.eName} ({$r.eDescription})</td>
	</tr>
	<tr>
		<th>Dokument:</th>
		<td>{$r.dOriginalName}</td>
		<th>Author:</th>
		<td>{$r.dAuthor}</td>
	</tr>
	<tr>
		<th>Schwellenwert:</th>
		<td>{$r.rThreshold} %</td>
		<th>Plagiatsverdacht zu:</th>
		<td>{$r.rSimilarity} %</td>
	</tr>
	<tr>
		<th>Startzeit:</th>
		<td>{$r.rDatetime|date_format:'%d.%m.%Y %H:%M'}</td>
		<th>Endzeit:</th>
		<td>{$r.rEndTime|date_format:'%d.%m.%Y %H:%M'}</td>
	</tr>
</table>

 
