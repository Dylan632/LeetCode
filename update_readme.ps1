# update_readme.ps1
# Scans .md note files, extracts LeetCode IDs from filenames,
# then updates README.md status and progress counts in-place.
# IMPORTANT: This script contains NO Chinese characters to avoid encoding issues.

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# --- Step 1: Scan .md files and collect completed problem IDs ---
$completedIds = New-Object System.Collections.Generic.HashSet[int]
$mdFiles = Get-ChildItem -Path $ScriptDir -Filter "*.md" -File
foreach ($file in $mdFiles) {
    if ($file.Name -match '^(\d+)') {
        [void]$completedIds.Add([int]$Matches[1])
    }
}

# --- Step 2: Read README.md as UTF-8 ---
$readmePath = Join-Path $ScriptDir "README.md"
if (-not (Test-Path $readmePath)) {
    Write-Host "ERROR: README.md not found."
    exit 1
}
$lines = [System.IO.File]::ReadAllLines($readmePath, [System.Text.Encoding]::UTF8)

# --- Step 3: Process lines - update status and track counts ---
$newLines = New-Object System.Collections.Generic.List[string]
$topicHeaderIndex = -1
$topicDone = 0
$topicTotal = 0
$overallDone = 0
$overallTotal = 0

# Unicode characters (generated via code points, not literal chars)
$checkMark = [string][char]0x2705
$emptyBox = [string][char]0x2B1C
$filledBlock = [string][char]0x2588
$emptyBlock = [string][char]0x2591

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]

    # Detect topic header like: ### xxxx (0/3)
    if ($line -match '^###\s+.+\(\d+\/\d+\)') {
        # Finalize previous topic header if exists
        if ($topicHeaderIndex -ge 0) {
            $prev = $newLines[$topicHeaderIndex]
            $prev = $prev -replace '\(\d+\/\d+\)', "($topicDone/$topicTotal)"
            $newLines[$topicHeaderIndex] = $prev
            $overallDone += $topicDone
            $overallTotal += $topicTotal
        }
        # Start tracking new topic
        $topicHeaderIndex = $newLines.Count
        $topicDone = 0
        $topicTotal = 0
        $newLines.Add($line)
        continue
    }

    # Detect table data row like: | 42 | [xxx](url) | difficulty | status |
    if ($line -match '^\|\s*(\d+)\s*\|') {
        $problemId = [int]$Matches[1]
        $topicTotal++

        # Split by | to access cells directly
        $cells = $line.Split('|')
        # cells: [0]="" [1]=" 42 " [2]=" [title](url) " [3]=" difficulty " [4]=" status " [5]=""
        if ($cells.Length -ge 5) {
            $statusIndex = $cells.Length - 2
            if ($completedIds.Contains($problemId)) {
                $topicDone++
                $cells[$statusIndex] = " $checkMark "
            } else {
                $cells[$statusIndex] = " $emptyBox "
            }
            $line = $cells -join '|'
        }
    }

    $newLines.Add($line)
}

# Finalize last topic header
if ($topicHeaderIndex -ge 0) {
    $prev = $newLines[$topicHeaderIndex]
    $prev = $prev -replace '\(\d+\/\d+\)', "($topicDone/$topicTotal)"
    $newLines[$topicHeaderIndex] = $prev
    $overallDone += $topicDone
    $overallTotal += $topicTotal
}

# --- Step 4: Update overall progress line and bar ---
$pct = if ($overallTotal -gt 0) { [Math]::Round(($overallDone / $overallTotal) * 100, 1) } else { 0 }
$barWidth = 20
$filled = if ($overallTotal -gt 0) { [Math]::Round(($overallDone / $overallTotal) * $barWidth) } else { 0 }
$bar = ($filledBlock * $filled) + ($emptyBlock * ($barWidth - $filled))

$prevWasProgress = $false
for ($i = 0; $i -lt $newLines.Count; $i++) {
    # Update "**Total Progress**: X/Y (Z%)"
    if ($newLines[$i] -match '^\*\*Total Progress\*\*') {
        $newLines[$i] = "**Total Progress**: $overallDone/$overallTotal ($pct%)"
        $prevWasProgress = $true
        continue
    }
    # Update progress bar (line right after Total Progress)
    if ($prevWasProgress) {
        $trimmed = $newLines[$i].Trim()
        if ($trimmed.Length -gt 2 -and $trimmed[0] -eq '`' -and $trimmed[-1] -eq '`') {
            $newLines[$i] = "``$bar``"
        }
        $prevWasProgress = $false
    }
    # Update badge
    if ($newLines[$i] -match 'img\.shields\.io/badge/Progress') {
        $encoded = "$overallDone%2F$overallTotal"
        $newLines[$i] = $newLines[$i] -replace 'Progress-[^)]+?-blue', "Progress-$encoded-blue"
    }
}

# --- Step 5: Write back as UTF-8 (no BOM) ---
[System.IO.File]::WriteAllLines($readmePath, $newLines.ToArray(), (New-Object System.Text.UTF8Encoding $false))

Write-Host "README.md updated: $overallDone/$overallTotal ($pct%)"
