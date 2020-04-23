# Intro to git and GitHub

This recording will go through the basics of creating a brand new repository on Github. We will go through two scenarios.

- **Pulling:** Create a new repository on GitHub and clone to the local machine

- **Pushing:** Create a new repository on Github and push existing code from my local machine to the repo

This tutorial assumes you already have a GitHub account and `git` is installed on your local machine.

## Pulling

### Create a new repository on GitHub and clone to the local machine

1. Choose `New Repository` from the `+` icon in the upper right
2. Assign a name (example: `first_repo`)
3. Give it a description
4. Choose `Private` (***NOTE:** it works the same if you choose Public*)
5. Select the checkbox for `Initialize this repository with a README`
6. Press the green `Create repository` button

## Clone the repository to your local machine

## git commands used in this tutorial

Add file(s) to a collection that will be pushed to the GitHub repository.

```git
git add .
```

Commit (prepare) the collection with a message to be pushed to a branch in the GitHub repository.

```git
git commit -m "The message associated with the commit"
```

Push the collection to the `master` branch in the GitHub repository.

```git
git push origin master
```

---

## Pushing

### Create a new repository on Github and push existing code from my local machine to the repo

1. Choose `New Repository` from the `+` icon in the upper right
2. Assign a name (example: `repo_two`)
3. Give it a description
4. Choose `Private` (***NOTE:** it works the same if you choose Public*)
5. **DO NOT** Select the checkbox for `Initialize this repository with a README` (***NOTE**: This is the difference from the previous method above*. We want to *skip this step*)
6. Press the green `Create repository` button

### Push existing code to your new repository

### Resources

- [Vim editor](https://www.vim.org/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [GitHub](https://github.com/)
- [Git](https://git-scm.com/downloads)
- [What are README files?](https://en.wikipedia.org/wiki/README)