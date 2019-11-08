﻿<# 
 .Synopsis
  Remove a shortcut
 .Description
  Remove a shortcut
 .Parameter Name
  Name of shortcut to remove from all locations
#>
function Remove-DesktopShortcut {
    Param (
        [Parameter(Mandatory=$true)]
        [string] $Name
    )
    "Desktop","CommonDesktop" | % {
        $environmentPath = [Environment]::GetFolderPath($_)
        If ($environmentPath -ne "") {
            $filename = Join-Path $environmentPath "$Name.lnk"
            if (Test-Path -Path $filename) {
                Remove-Item $filename -force
            }
        }
    }
    "StartMenu","CommonStartMenu" | % {
        $environmentPath = [Environment]::GetFolderPath($_)
        if ($environmentPath -ne "") {
            $filename = Join-Path $environmentPath "NavContainerHelper\$Name.lnk"
            if (Test-Path -Path $filename) {
                Remove-Item $filename -force
            }
        }
    }
}
Export-ModuleMember -Function Remove-DesktopShortcut
