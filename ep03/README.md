# Twitch - Ep: 03: Pt. 2 - Building a Static Website Using Hugo, Azure storage, and Netlify

![](/ep03/img/ep3.jpg)

This stream is a continuation from [Episode 1](/ep01/README.md) where Laura and I deploy a Hugo site to Azure Storage and Netlify. In the previous stream we took care of creating all of the Hugo files and eploying them to Azure using Blob Storage.

Our next steps are to create a repository on Github for the Hugo files and push them up. Once have our Hugo files in a repo on Github we'll configure a new deployment with Netlify to watch the repo for changes. We'll then make a change to the repository in order to trigger Netlify to build a new version and deploy it.

## Steps

1. Push repository to Github (so it can be built in Netlify)
2. Configure Netlify to point to repository for Hugo (not the HTML)
3. View site on public address

## Notable moments

`1:29:00` - Discoverd the environment variable setting Netlify. The first attempt to deploy failed. After looking at the logs we found that the theme we chose requires Hugo version `0.64.0` in order to build the files. And Netlify's default version for Hugo is (as of today) `0.54.0`.

Adding an environment variable of `HUGO_VERSION` WITH `0.64.0` did the trick.

![](/ep03/img/hugo_env_var.gif)