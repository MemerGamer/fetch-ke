# version
$version = "1.0.4"

# Function for centering text
function Print-Centered {
    param($Message, [ConsoleColor]$ForegroundColor = "White", [ConsoleColor]$BackgroundColor = "Black") 
    Write-Host ("{0}{1}" -f (' ' * (([Math]::Max(0, $Host.UI.RawUI.BufferSize.Width / 2) - [Math]::Floor($Message.Length / 2)))), $Message) -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor 
}

# Function to print ascii art centered
function Print-Ascii-Centered {
    param($ascii)
    # get the ascii art and center it line by line
    $ascii -split "`n" | ForEach-Object { Print-Centered $_ }
}

$optc = $false
$optb = $false
$optB = $false
$optF = $false

$cmdArgs = $args

for ($i = 0; $i -lt $cmdArgs.Length; $i++) {
    $opt = $cmdArgs[$i]

    switch ($opt) {
        "-b" { $optb = $true }
        "-c" { $optc = $true }
        "-h" {
            Print-Centered "fetch-ke is a minimalistic, lightweight command-line system information tool written in PowerShell"
            Print-Centered "."
            Print-Centered "options:"
            Print-Centered "-h | returns help message"
            Print-Centered "-B | disables battery information"
            Print-Centered "-F | disables figlet at start"
            Print-Centered "-b | disables long battery info"
            Print-Centered "-c | disables color output from fetch-ke"
            Print-Centered "-v | returns version of fetch-ke"
            exit 0
        }
        "-v" {
            Print-Centered "fetch-ke - $version"
            exit 0
        }
        "-B" { $optB = $true }
        "-F" { $optF = $true }
        default {
            Print-Centered "You have to use [-h], [-b], [-c], [-B], [-F] or [-v] options"
            exit 1
        }
    }
}

# Colors
$WHITE = [ConsoleColor]::White
$RED = [ConsoleColor]::Red
$YELLOW = [ConsoleColor]::Yellow
$GREEN = [ConsoleColor]::Green
$BLUE = [ConsoleColor]::Blue
$MAGENTA = [ConsoleColor]::Magenta
$CYAN = [ConsoleColor]::Cyan
$BLACK = [ConsoleColor]::Black

# Uptime (Windows alternative)
$osInfo = Get-ComputerInfo
$uptime = $osInfo.OSLastBootUpTime
$uptime = (Get-Date) - $uptime
$uptime = $uptime.ToString()

# Memory (Windows alternative)
$memory = Get-ComputerInfo
$totalmem = [math]::Round($memory.OsTotalVisibleMemorySize / 1MB, 2)
$currmem = [math]::Round(($memory.OsTotalVisibleMemorySize - $memory.OsFreeVirtualMemory) / 1MB, 2)

$isTermux = $env:TERMUX

if (-not $isTermux) {
    # Distro name (Windows alternative)
    $distro = $osInfo.OSName

    # Battery info (Windows alternative)
    $battery = Get-WmiObject Win32_Battery
    if ($battery) {
        $batteryInfo1 = "status: $($battery.Status)"
        $batteryInfo2 = "capacity: $($battery.EstimatedChargeRemaining)%"
    }
    else {
        $optB = $true
        $batteryInfo1 = "Battery information not available."
        $batteryInfo2 = ""
    }
}
else {
    $optB = $true  # Currently, battery information is not available on Termux
    $androidVer = $env:TERMUX_VERSION
    $distro = "Android $androidVer"
}

# Replace the message with pre-generated ASCII art
$figletArt = @"                                                                                                 
_       __    _                __                         
| |     / /   (_)   ____   ____/ /  ____  _      __   _____
| | /| / /   / /   / __ \ / __  /  / __ \| | /| / /  / ___/
| |/ |/ /   / /   / / / // /_/ /  / /_/ /| |/ |/ /  (__  ) 
|__/|__/   /_/   /_/ /_/ \__,_/   \____/ |__/|__/  /____/  
                                                           
"@

if (-not $optF) {
    Print-Ascii-Centered $figletArt
}
Print-Centered "user: $env:USERNAME"
Print-Centered "hname: $env:COMPUTERNAME"
Print-Centered "os: $distro"
Print-Centered "kernel: $($env:OS)"
Print-Centered "uptime: $uptime"

if (-not $optB) {
    if (-not $optb) {
        Print-Centered "battery:"
        Print-Centered "-$batteryInfo1"
        Print-Centered "-$batteryInfo2"
    }
    else {
        Print-Centered "battery: $batteryInfo2"
    }
}

Print-Centered "shell: PowerShell"
Print-Centered "processes: $($(Get-Process | Measure-Object).Count)"
Print-Centered "memory: $currmem GB | $totalmem GB"

if ($optc) {
    exit 0
}

Print-Centered "colors:"

# Color list
$w = "- white"
$r = "- red"
$ye = "- yellow"
$gr = "- green"
$bl = "- blue"
$mag = "- magenta"
$cy = "- cyan"

Print-Centered $w -ForegroundColor $WHITE
Print-Centered $r -ForegroundColor $RED
Print-Centered $ye -ForegroundColor $YELLOW
Print-Centered $gr -ForegroundColor $GREEN
Print-Centered $bl -ForegroundColor $BLUE
Print-Centered $mag -ForegroundColor $MAGENTA
Print-Centered $cy -ForegroundColor $CYAN
