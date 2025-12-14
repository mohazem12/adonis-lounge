# How to push this project to your GitHub account

These steps show how to create a GitHub repository and push this project from your local computer.

## Option A — Using GitHub CLI (`gh`)
1. Ensure `git` and `gh` are installed and you're logged in:

```bash
git --version
gh auth login
```

2. Create a new repo and push:

```bash
cd /path/to/adonis-lounge
git add .
git commit -m "Initial commit"
gh repo create <username>/<repo-name> --public --source=. --remote=origin --push
```

This will create the repo on GitHub, set `origin`, and push the code.

## Option B — Manually via GitHub website
1. On GitHub, click + → New repository. Choose the repo name and visibility.
2. Follow the instructions provided by GitHub; typical commands are:

```bash
cd /path/to/adonis-lounge
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/<username>/<repo-name>.git
git branch -M main
git push -u origin main
```

## Notes
- Replace `<username>` and `<repo-name>` with your GitHub username and desired repo name.
- If pushing is blocked by credentials, configure SSH or HTTPS authentication (personal access token if using HTTPS).
- The repo already has a `.git` directory; you can use `git status` to see changes.
