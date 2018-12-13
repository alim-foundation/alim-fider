{{ .title }}
<tr>
	<td align="center">
	<table border="0" cellpadding="0" cellspacing="0" id="Table_01" style="background:#fff;width:680px;border:1px solid #dbe1e6;color:#5e5e5e">
		<tbody>
			<tr>
				<td style="height:99px;vertical-align:middle;text-align:left;border-bottom:7px solid #1c4871;padding:15px">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tbody>
						<tr>
							<td style="background-color:#fff;padding:15px 0;color:#003876;font-size:22px;line-height:22px;text-align:left">Alim - Feedback &amp; Support</td>
							<td style="text-align:right"><a href="#" style="outline:none" target="_blank"><img alt="" border="0" src="http://www.alim.org/sites/all/themes/alim/img/wt-alim-logo.png" style="display:inline-block" /> </a></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td style="background-color:#fff;padding:15px 15px 5px 15px"><font face="arial" style="color:#000;font-size:14px;line-height:22px;text-align:left;padding:0;display:block;text-transform:uppercase">Dear Administrator,</font></td>
			</tr>
			<tr>
				<td style="background-color:#fff;padding:5px 15px 15px 15px"><font face="arial" style="color:#000;font-size:14px;line-height:22px;text-align:left;padding:0;display:block">You&#39;ve feedback from {{ .userName }} </font></td>
			</tr>
			<tr>
				<td style="background-color:#f4f8fc;padding:15px">
				<table border="0" cellpadding="0" cellspacing="0" style="width:100%;border:1px solid #dbe1e6">
					<tbody>
						<tr>
							<td style="width:20%;padding:10px 10px 10px 10px;background:#fff;vertical-align:top"><font face="arial" style="color:#6e8db8;font-size:14px;line-height:22px;text-align:left;padding:0;display:block">Subject</font></td>
							<td style="width:80%;padding:10px 10px 10px 10px;background:#fff"><font face="arial" style="color:#5e5e5e;font-size:14px;line-height:22px;text-align:left;padding:0;display:block"> [{{ .tenantName }}] {{ .title }} </font></td>
						</tr>
						<tr>
							<td style="width:20%;padding:10px 10px 10px 10px;background:#fff;vertical-align:top"><font face="arial" style="color:#6e8db8;font-size:14px;line-height:22px;text-align:left;padding:0;display:block">Description</font></td>
							<td style="width:80%;padding:10px 10px 10px 10px;background:#fff"><font face="arial" style="color:#5e5e5e;font-size:14px;line-height:22px;text-align:left;padding:0;display:block"> {{ .content }} </font></td>
						</tr>
						
						<tr>
							<td style="width:20%;padding:10px;background:#fff;vertical-align:top"><font face="arial" style="color:#6e8db8;font-size:14px;line-height:22px;text-align:left;padding:0;display:block">Project</font></td>
							<td style="width:80%;padding:10px;background:#fff"><font face="arial" style="color:#5e5e5e;font-size:14px;line-height:22px;text-align:left;padding:0;display:block">Alim.org</font></td>
						</tr>
						
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td style="background-color:#fff;padding:25px 15px 5px 15px"><font face="arial" style="color:#000;font-size:14px;line-height:22px;text-align:left;padding:0;display:block">Regards,</font></td>
			</tr>
			<tr>
				<td style="background-color:#fff;padding:5px 15px 25px 15px"><font face="arial" style="color:#000;font-size:14px;line-height:22px;text-align:left;padding:0;display:block">Alim Team</font></td>
			</tr>
			<tr>
				<td style="background-color:#fff;padding:5px 15px 25px 15px"><font face="arial" style="color:#000;font-size:14px;line-height:22px;text-align:left;padding:0;display:block">
					You are receiving this because you are subscribed to this event.</font>
					{{ .view }} or {{ .change }}.
					
				  </td>
			</tr>
			
		</tbody>
	</table>
	</td>
</tr>