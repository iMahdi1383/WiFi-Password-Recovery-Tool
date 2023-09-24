# Coded By : Mahdi Askarpoor
# http://zil.ink/imahdi1383.en

$profiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }

foreach ($profile in $profiles) {
  $key = netsh wlan show profiles name="$profile" key=clear | Select-String "Key Content" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }
  "$profile`n$key`n" | Out-File -Append -Encoding UTF8 wifi.txt
}
