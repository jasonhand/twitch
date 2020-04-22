# Analyzing Tweets with Azure Machine Learning and Cosmos DB

![EarthDay](img/header.jpg)

In this episode we'll attempt to collect public twitter information, export the data to JSON, and import data in to Cosmos DB for querying.

1. Create Azure Machine Learning Workspace
2. Import notebook
3. Create VM
4. Configure notebook
5. Collect data (using pythong notebook, Tweepy, and the Twitter API)
6. Save results to json, csv, and npy (list of unique IDs)
7. Create Cosmos DB (I already have one to use)
8. Create new item
9. Attempt upload of json file (it's too big)
10. Set up Windows VM
11. Downlod and install RDP client on Mac
12. Connect to Windows machine
13. Download and install the Document DB Data Migration Tool
14. Download json file
15. Import json file to Cosmos DB
16. View Data Explorer in Cosmos Db
17. Query data
18. Rotate API keys

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