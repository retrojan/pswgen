# Function to generate a password
function Generate-Password {
    param (
        [int]$Length = 12,                       # Default length of the password
        [bool]$IncludeSpecialChars = $true       # Include special characters
    )

    # Define characters to use
    $lowercase = 'abcdefghijklmnopqrstuvwxyz'
    $uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    $numbers = '0123456789'
    $specialChars = '!@#$%^&*()_+-=[]{}|;:,.<>?'

    # Combine characters based on parameters
    $characters = $lowercase + $uppercase + $numbers
    if ($IncludeSpecialChars) {
        $characters += $specialChars
    }

    # Generate the password of specified length
    $password = -join ((1..$Length) | ForEach-Object { $characters[(Get-Random -Minimum 0 -Maximum $characters.Length)] })
    return $password
}

# Request parameters from the user
$length = Read-Host "Enter the desired password length (e.g., 12)"
$includeSpecial = Read-Host "Include special characters? (yes/no)"

# Convert the response to a boolean value
$includeSpecial = if ($includeSpecial -match '^yes$') { $true } else { $false }

# Generate the password and display it
$password = Generate-Password -Length $length -IncludeSpecialChars $includeSpecial
Write-Host "Generated password: $password" -ForegroundColor Green
