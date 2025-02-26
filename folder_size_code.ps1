try {
    # Ask user for the folder path to analyze
    $targetfolder = Read-Host 'Enter the folder path to analyze, example C:\Users\Manolo'
    
    # Check if the path is valid
    if (!(Test-Path $targetfolder -PathType Container)) {
        Write-Host 'The entered path is not valid or does not exist.' -ForegroundColor Red
        Pause
        exit
    }

    # Function to calculate the size of a folder
    function Get-FolderSize {
        param ([string]$Path)
        $size = Get-ChildItem -Recurse -Force $Path -File -ErrorAction SilentlyContinue | 
                Measure-Object -Property Length -Sum | 
                Select-Object -ExpandProperty Sum
        return $size
    }

    # Create a collection of data including the root folder
    $dataColl = @()
    
    # Add the main directory (root folder)
    $rootSize = Get-FolderSize -Path $targetfolder
    $dataColl += [PSCustomObject]@{
        foldername = $targetfolder + " (Main Folder)"
        foldersizeGb = '{0:N2} GB' -f ($rootSize / 1Gb)
    }

    # Add subdirectories
    Get-ChildItem -Force $targetfolder -Directory -ErrorAction SilentlyContinue | ForEach-Object {
        $len = Get-FolderSize -Path $_.FullName
        $dataColl += [PSCustomObject]@{
            foldername = $_.FullName
            foldersizeGb = '{0:N2} GB' -f ($len / 1Gb)
        }
    }

    # Display results in a graphical table
    $dataColl | Out-GridView -Title ("Size of Subdirectories in " + $targetfolder)

} catch {
    # Handle unexpected errors
    Write-Host 'An unexpected error occurred:' -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Yellow
}

Write-Host 'Press any key to exit...' -ForegroundColor Cyan
Pause
