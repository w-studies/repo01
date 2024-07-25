param (
    [string]$m
)

if (-not $m) {
    Write-Host "Uso: .\commit_all.ps1 -m 'mensagem do commit'"
    exit 1
}

# Commit and push changes in the main repository
git add .
git commit -m "$m"
git push

# Commit and push changes in each submodule
git submodule foreach --recursive {
    git add .
    git commit -m "$m"
    git push
}
