$extensions = @{ 
    "VIDEO" = @(".mp4", ".avi", ".mkv", ".mov", ".wmv", ".flv") 
    "COMPRESSED_FILES" = @(".zip", ".rar", ".tar", ".gz", ".7z", ".bz2")
    "EXECUTABLE_APPLICATIONS" = @(".exe", ".msi", ".bat", ".sh", ".apk")
    "IMAGES" = @(".jpg", ".jpeg", ".png", ".gif", ".bmp", ".tiff", ".webp")
    "TORRENTS" = @(".torrent", ".magnet")
    "ISOs" = @(".iso", ".img", ".bin", ".cue", ".nrg", ".dmg", ".vhd", ".vmdk")
    "3D" = @(".3mf", ".stl", ".gcode", ".obj", ".ply", ".fbx", ".dae", ".blend")
    "OFFICE" = @(".docx", ".doc", ".xls", ".xlsx", ".ppt", ".pptx", ".ods", ".odp", ".csv")
    "TEXT" = @(".txt", ".log", ".md", ".rst", ".json", ".xml", ".yaml", ".yml")

}

function order($extensions) {
    $archives = Get-ChildItem -File -Path "$env:USERPROFILE\Downloads"

    foreach ($key in $extensions.Keys) {

        $destinationPath = "$env:USERPROFILE\Downloads\$key"
        if (-not (Test-Path -Path $destinationPath)) {
            New-Item -ItemType Directory -Path $destinationPath | Out-Null
        }

        foreach ($archive in $archives) {
            if ($extensions[$key] -contains $archive.Extension) {
                Move-Item -Path $archive.FullName -Destination $destinationPath
            }
        }
    }
}

order $extensions
