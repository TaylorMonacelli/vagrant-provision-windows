@"

'http://www.htguk.com/disabling-internet-explorer/

Option Explicit
On Error Resume Next
'Create a constant for the HKEY_CURRENT_USER object
Const HKCU = &H80000001
'Define variables
Dim strComputer
Dim strRegistryKey
Dim objRegistry
Dim strRegistryValue
Dim binValue
strComputer = "."
strRegistryKey = "Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections"
strRegistryValue = "DefaultConnectionSettings"
'Connect to the Registry
Set objRegistry = GetObject("winmgmts:\\" & strComputer & "\root\default:StdRegProv")
'Retrieve the current settings.
objRegistry.GetBinaryValue HKCU, strRegistryKey, strRegistryValue, binValue
'Change the 'Automatically detect settings' box to unticked
binValue(8) = 01
'binValue(8) = 13 - Enable this line to check the box instead of uncheck
'Save the changes
objRegistry.SetBinaryValue HKCU, strRegistryKey, strRegistryValue, binValue

"@ | Out-File -encoding 'ASCII' disable_auto_proxy.vbs

wscript disable_auto_proxy.vbs
