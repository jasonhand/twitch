# Twitch - Ep: 01: Building a Static Website Using Hugo, Azure storage, and Netlify (pt. 1)

[![](img/twitch02-github.png)](https://www.twitch.tv/videos/591274855)

## Tools needed

- [Visual Studio Code](https://code.visualstudio.com/?wt.mc_id=twitch02-github-jahand)
- [Azure Storage Extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurestorage)
- [Hugo](https://gohugo.io/)
- [Git (for Mac)](https://sourceforge.net/projects/git-osx-installer/)

>NOTE: You can check to see if Git is installed already by running the following command in the terminal. If it is NOT installed, MacOS should prompt to download

```
git --version
```

## Accounts needed

- [Github](https://github.com/join/?wt.mc_id=twitch02-github-jahand)
- [Azure](http://azure.com/join/?wt.mc_id=twitch02-github-jahand)
- [Netlify](https://app.netlify.com/signup)

## Objective

Create and deploy a static HTML website

Using a static site generator known as Hugo, we will create a website on our local machine.

We will version control and store the associated code and HTML in a repository on Github.

We will build the HTML files locally and then push them to storage using the Visual Code Extension for Azure.

We will host the static site in Azure Blob Storage (as a staging site).

We will host the static site on Netlify and set triggers up in Github to automatically build and deploy.

## Steps

1. Create accounts for
   1. [Github](https://github.com/join/?wt.mc_id=twitch02-github-jahand),
   2. [Azure](http://azure.com/join/?wt.mc_id=twitch02-github-jahand),
   3. [Netlify](https://app.netlify.com/signup)
2. Download [Visual Studio Code](https://code.visualstudio.com/?wt.mc_id=twitch02-github-jahand)
3. Install [Azure Storage VS Code Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurestorage)
4. Install Git
5. Install Hugo
6. [Choose a theme](https://themes.gohugo.io/)
7. Create Hugo site (`hugo new site nameofsite`)
8. Navigate in to the 'themes' directory
9. clone the directory of the them you want to use (example: `git clone https://github.com/themefisher/kross-hugo.git`)
10. Copy contents of `ExampleSite` in to the `nameofsite` directory including the `config.toml`
11. Modify `config.html` to meet needs (example: remove `https://examplesite.com` from the `baseURL` configuration option)
12. View at localhost:1313 with `hugo server -D` from the command line (iTerm)
13. Verify changes and when ready to push to the internet...
14. Build site with `hugo` (from the `nameofsite` directory)
15. Create Azure Storage
16. Push the `Public` folder to **$web** Blob
17. View site on public address
18. Push repository to Github (so it can be built in Netlify)
19. Configure Netlify to point to repository for Hugo (not the HTML)
20. View site on public address