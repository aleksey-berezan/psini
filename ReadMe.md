Powershell module(2 functions) for working with ini files.

**Sample usage:**  
```powershell
Import-Module .\psini.psm1 -force -PassThru  
$d = ReadIniFile .\sample.ini  
$d['property1'] = 'modified'  
$d['new_property'] = 'new one'  
SaveIniFile -path .\sample1_new.ini -properties $d
```
