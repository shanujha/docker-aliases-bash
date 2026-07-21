# The easiest way to use this is
# Open a terminal
# enter command- notepad $PROFILE
# then paste the below function there (if a file is not created, press enter so a new profile is created for you
# after save, close notepad, close all terminals or alternatively use command - .$PROFILE
# .$PROFILE will reload the profile in your current terminal.
# then simply write command dps and enjoy!
function dps {
    docker ps -a --format "{{json .}}" |
        ForEach-Object { $_ | ConvertFrom-Json } |
        Select-Object `
            @{Name="CONTAINER";Expression={$_.Names}},
            @{Name="IMAGE";Expression={$_.Image}},
            @{Name="STATUS";Expression={
                if ($_.Status -like "Up*") { "🟢 Up" }
                elseif ($_.Status -like "Restarting*") { "🟡 Restart" }
                elseif ($_.Status -like "Exited*") { "🔴 Exited" }
                else { "⚪ Other" }
            }},
            @{Name="PORTS";Expression={ if ($_.Ports) { $_.Ports } else { "-" } }},
            @{Name="UPTIME";Expression={$_.RunningFor}},
            @{Name="ID";Expression={$_.ID}} |
        Format-Table -AutoSize
}
