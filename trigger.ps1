$pat = 'ge2zksdivdhwcs34nkdphchtsi6igddadlrs5q7pnoawvllegazq'
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f "", $pat)))

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", ("Basic {0}" -f $base64AuthInfo))
$headers.Add("Content-Type", "application/json")

$uri = "https://dev.azure.com/dollarpo7/skedda-DR/_apis/pipelines/2/runs?api-version=7.0"

$body = '{ "definitionId": 2 }'

Invoke-RestMethod -Uri $uri -Headers $headers -Body $body -Method POST | ConvertTo-Json -Depth 10