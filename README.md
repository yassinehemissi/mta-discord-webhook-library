#### Welcome!
---

This project is my MTA to Discord Webhook library, this helps it's users to easily create and send webhooks using the discord API.

#### Content:
---

The content is divided into two folders that serve the same purpose but in a different way:

- The OOP Folder: Contains the library written in OOP, but sadly you can't use exports you can tho copy paste the needed functions in your resource and it will be easier to use, since it's OOP!
- The No-OOP Folder: Contains the library but not in OOP but simple functions you can use exports from it
  tho.

#### Documentation:
---

First you need to create a new webhook instance using the following syntax:

```Lua
Webhook_Instance Webhook(webhook_url, username)
```

**OOP:** Webhook.new(webhook_url, username)

Rest of functions are modifiers of the created instance for OOP version you don't need to re-assign the variable variable, but in non oop you will need to as following:

```Lua
    Webhook_Instance:setContent("Hello World")
    Webhook_Instance = WHSetContent(Webhook_Instance, "Hello World")
```

All the functions are as following with specific arguments:

```Lua
    -- To set Webhook Avatar
    Webhook_Instance:setAvatar(avatar_url)
    Webhook_Instance = WHSetAvatar(Webhook_Instance, avatar_url)
    -- To set Webhook Content
    Webhook_Instance:setContent(content)
    Webhook_Instance = WHSetContent(Webhook_Instance, content)
    -- To set a new Embed
    Embed_Instance Webhook_Instance:setEmbed(title)
    Webhook_Instance = WHSetEmbed(Webhook_Instance, title)
    -- To Set Embed Author
    Embed_Instance:setAuthor(name, url, icon_url)
    Webhook_Instance = WHESetAuthor(Webhook_Instance, url, icon_url)
    -- To Set Embed URL
    Embed_Instance:setURL(url)
    Webhook_Instance = WHESetURL(Webhook_Instance, url)
    -- To Set Embed Description
    Embed_Instance:setDescription(description)
    Webhook_Instance = WHESetDescription(Webhook_Instance, description)
    -- To Set Embed Color
    Embed_Instance:setColor(color)
    Webhook_Instance = WHESetColor(Webhook_Instance, color)
    -- To Set Embed Thumbnail
    Embed_Instance:setThumbnail(url)
    Webhook_Instance = WHESetThumbnail(Webhook_Instance, url)
    -- To Set Embed Image
    Embed_Instance:setImage(url)
    Webhook_Instance = WHESetImage(Webhook_Instance, url)
    -- To Set Embed Footer
    Embed_Instance:setFooter(text, icon_url)
    Webhook_Instance = WHESetFooter(Webhook_Instance, text, icon_url)

```

To send the embed use the send function as following 

```Lua
WHSend(Webhook_Instance, logging)
```
**OOP:** Webhook_Instance:Send(logging)

Setting logging to `true` will result in http request results being logged


#### Example
---

**OOP:**

```Lua
local myWebhook = Webhook.new("Webhook_url", "Filex")
myWebhook:setAvatar(
    "https://images-ext-1.discordapp.net/external/tu5pFIDBWXmNApJq8kPjuYx2p_O88vIiHaOGay5bs2k/%3Fsize%3D256/https/cdn.discordapp.com/avatars/512027289718882306/4e292939e36f079ee8b93a857a35e8eb.png"
)
myWebhook:setContent("My Webhook Library Example.")
local myWHEmbed = myWebhook:setEmbed("My Library's Embed")
myWHEmbed:setColor("15281718")
myWHEmbed:setDescription("Some Text")
myWHEmbed:setField("Some Field", "Text", false)
myWHEmbed:setField("Some Field", "Text", true)
myWHEmbed:setField("Some Field", "Text", true)
myWHEmbed:setImage(
    "https://images-ext-1.discordapp.net/external/tu5pFIDBWXmNApJq8kPjuYx2p_O88vIiHaOGay5bs2k/%3Fsize%3D256/https/cdn.discordapp.com/avatars/512027289718882306/4e292939e36f079ee8b93a857a35e8eb.png"
)
myWebhook:Send(false)
```


**NO-OOP**

```Lua
local myWebhook = Webhook("Webhook_url", "Filex")
WHSetAvatar(
    myWebhook,
    "https://images-ext-1.discordapp.net/external/tu5pFIDBWXmNApJq8kPjuYx2p_O88vIiHaOGay5bs2k/%3Fsize%3D256/https/cdn.discordapp.com/avatars/512027289718882306/4e292939e36f079ee8b93a857a35e8eb.png"
)
WHSetContent(myWebhook, "My Webhook Library Example.")
local myWHEmbed = WHSetEmbed(myWebhook, "My Library's Embed")
WHESetColor(myWebhook, "15281718")
WHESetDescription(myWebhook, "Some Text")
WHESetField(myWebhook, "Some Field", "Text", false)
WHESetField(myWebhook, "Some Field", "Text", true)
WHESetField(myWebhook, "Some Field", "Text", true)
WHESetImage(
    myWebhook,
    "https://images-ext-1.discordapp.net/external/tu5pFIDBWXmNApJq8kPjuYx2p_O88vIiHaOGay5bs2k/%3Fsize%3D256/https/cdn.discordapp.com/avatars/512027289718882306/4e292939e36f079ee8b93a857a35e8eb.png"
)
WHSend(myWebhook, false)
````

**Result**

![Result](https://i.imgur.com/x31ww2B.png)