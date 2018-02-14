<#
Author: Ben Bornohlm
Project: Blog scripts
Date: 1-22-18
#>

# Array for jobs
$jobs=@()

# Mount drive
NET USE M: \\live.sysinternals.com

<#
Script block to run PsExec on each machine
#>
$sb = {
  param
  (
      $computer = "",
      $username = "student",
      $password = "student",
      $command = '"C:\Program Files\Internet Explorer\iexplorer.exe" https://youtu.be/SjHUb7NSrNk?t=1'
  )

  if (( Test-Connection -Cn $computer -BufferSize 16 -Count 1 -ea 0 -TimeToLive 3 -quiet )) {
    M:\PsExec -i "\\$computer" -u $username -p $password "C:\Program Files\Internet Explorer\iexplore.exe" https://youtu.be/SjHUb7NSrNk?t=1
  }
}

<#
Iterate over each compunter in hosts file
#>
foreach ($computer in Get-Content hosts) {
  Write-Host "starting $computer" -foreground green
  $jobs += Start-Job $sb -ArgumentList $computer
}

Wait-Job $jobs
$jobs | Receive-Job
