<#
Author: Ben Bornohlm
Project: Blog scripts
Date: 1-22-18
#>

<#
COmmand line parameters
#>
Param
(
  [Parameter(Mandatory=$true)][string]$username,
  [string]$password = $( Read-Host "Input password, please" )
)

# Array for jobs
$jobs=@()

# Mount drive
NET USE M: \\live.sysinternals.com

Write-Host $username
Write-Host $password

<#
Script block to run PsExec on each machine
#>
$sb = {
  param
  (
      $computer = "",
      $username = "",
      $password = "",
      $command = "powershell.exe -NoProfile -ExecutionPolicy Bypass -Command `"iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))"
  )

  if (( Test-Connection -Cn $computer -BufferSize 16 -Count 1 -ea 0 -TimeToLive 3 -quiet )) {
    M:\PsExec "\\$computer" /accepteula -u $username -p $password -d cmd /c $Command
  }
}

<#
Iterate over each compunter in hosts file
#>
foreach ($computer in Get-Content hosts) {
  Write-Host "starting $computer" -foreground green
  $jobs += Start-Job $sb -ArgumentList $computer, $username, $password
}

Wait-Job $jobs
$jobs | Receive-Job
