# Analyzing Tweets with Azure Machine Learning and Cosmos DB

![EarthDay](img/header.jpg)

In this recording we'll attempt to collect information from the Twitter API, export the data to JSON, and import data in to Cosmos DB for querying.

## Azure Machine Learning Studio

Our first step will be to collect the data. We will use a Jupyter notebook (based on this repo) to generate a list (JSON) of tweets based on a search term. In our example, we'll use `#EarthDay`.

1. Create Azure Machine Learning Workspace
2. Import notebook (from local drive)
3. Create VM ("compute")
4. Configure & Execute notebook
5. Download JSON file

## Cosmos DB

1. Create Cosmos DB (I already have one to use)
2. Create new item
3. Attempt upload of json file (it's too big)

## Create Windows 10 Virtual Machine

1. Set up Windows VM
2. Downlod and install RDP client on Mac
3. Connect to Windows machine

## Migrate JSON data to Cosmos DB

1. Download and install the Document DB Data Migration Tool
2. Download json file
3. Import json file to Cosmos DB
4. View Data Explorer in Cosmos Db
5. Query data

## Clean up

1. Rotate API keys

Resources:

[Azure](https://azure.microsoft.com/free/?WT_.mc_id=github-twitch04-jahand)

[Azure Machine Learning](https://docs.microsoft.com/en-us/azure/machine-learning/?WT_.mc_id=github-twitch04-jahand)

[Tweepy](https://tweepy.org)

[Azure Virtual Machines](https://docs.microsoft.com/en-us/azure/virtual-machines/?WT_.mc_id=github-twitch04-jahand)

[Microsoft Remote Desktop 10](https://apps.apple.com/us/app/microsoft-remote-desktop-10/id1295203466?mt=12)

[Visual Code Studio](https://code.visualstudio.com/docs/?WT_.mc_id=github-twitch04-jahand)

[Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701/?WT_.mc_id=github-twitch04-jahand)

[Azure Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction/?WT_.mc_id=github-twitch04-jahand)

[Data Migration Tool](https://aka.ms/csdmtool)

[Getting Started with SQL queries in Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-query-getting-started/?WT_.mc_id=github-twitch04-jahand)

More:

[Use Data migration tool to migrate your data to Azure Cosmos DB](
https://docs.microsoft.com/en-us/azure/cosmos-db/import-data)

[Twitter Scraping and Saving](
https://github.com/Dkreitzer/Twitter_Scraping_and_Saving)

[More SQL in Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-query-select/?WT_.mc_id=github-twitch04-jahand)
Sample Query 1:

```SQL
SELECT c.entities.hashtags FROM c
```

Sample Query 2:

```SQL
SELECT { "hashtags": c.entities.hashtags, "user mentions": c.entities.user_mentions, "urls": c.urls }
    FROM Hashtags c
 ```