Get-WMIObject -Class Win32_Process | Get-Member
$taskList = @()
foreach ($task in $taskSnapshot){
    $taskProps = @{
        'SID'=$task.SessionId
        'Name'=$task.ProcessName
        'PID'=$task.ProcessId
        'Handles'=$task.Handles
        'WorkingSet64'=$task.WorkingSet64
        'Description'=$task.Description
        'Path'=$task.Path
        

    }
    $taskObject = New-Object -TypeName PSObject -Property $taskProps
    $taskList += $taskObject
}

$taskList | Out-GridView
