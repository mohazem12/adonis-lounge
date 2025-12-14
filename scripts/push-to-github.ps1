param(
  [string]$RepoName = "adonis-lounge",
  [string]$Visibility = "public"
)

# Basic checks
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Host "git is not installed or not in PATH. Install git first." -ForegroundColor Yellow
  exit 1
}

cd $PSScriptRoot\..  # run from project root

Write-Host "Checking repo status..."
if (-not (Test-Path .git)) {
  git init
  Write-Host "Initialized git repository"
}

git add .
try {
  git commit -m "Initial commit" -ErrorAction Stop | Out-Null
  Write-Host "Committed changes"
} catch {
  Write-Host "No changes to commit or commit failed. Continuing..." -ForegroundColor Yellow
}

if (Get-Command gh -ErrorAction SilentlyContinue) {
  Write-Host "Creating and pushing repo using gh CLI..."
  gh repo create $RepoName --$Visibility --source=. --remote=origin --push
} else {
  Write-Host "gh CLI not found. Please create the repo in GitHub and run these commands:" -ForegroundColor Cyan
  Write-Host "
  git remote add origin https://github.com/<username>/$RepoName.git
  git branch -M main
  git push -u origin main
  "
}
