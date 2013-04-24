Function ReadIniFile
{
    param([string]$path=$(throw "path param is required"))
    $lines = [System.IO.File]::ReadAllLines($path) `
        | ? { -not [System.String]::IsNullOrEmpty($_)} `
        | % { $_.Trim()}
    # todo: read to dictionary in more neatty way
    # (ideally, this would be single pipeline)

    $properties = @{}
    foreach($line in $lines)
    {
        $split = $line.Split('=')
        $key = $split[0].Trim()
        $value = $split[1].Trim()
        $properties[$key] = $value
    }

    $properties
}

Function SaveIniFile
{
    param(
        [string]$path=$(throw "path param is required")
        , [System.Collections.Hashtable]$properties = $(throw "properties param is required")
        )
    $s = ""
    foreach($key in $properties.Keys)
    {
        # todo: put neatty pipeline convertation in here
        $value = $properties[$key]         
        $s = $s + "$key=$value" + [System.Environment]::NewLine
    }
    [System.IO.File]::WriteAllText($path, $s)
}