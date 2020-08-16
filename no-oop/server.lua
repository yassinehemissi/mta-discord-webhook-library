function Webhook(webhook_url, username)
    assert(type(webhook_url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(webhook_url))
    assert(type(username) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(username))
    local webhook = {}
    webhook.webhook_url = webhook_url
    webhook.username = username
    webhook.embeds = {}
    return webhook
end

function WHSetAvatar(webhook, avatar_url)
    assert(type(avatar_url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(avatar_url))
    webhook.avatar_url = avatar_url
    return webhook
end

function WHSetContent(webhook, content)
    assert(type(content) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(content))
    webhook.content = content
    return webhook
end

function WHSetEmbed(webhook, title)
    assert(type(title) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(title))
    local embed = Embed(title)
    webhook.embeds = {embed}
    return webhook
end

function Embed(title)
    assert(type(title) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(title))
    local embed = {}
    embed.title = title
    embed.fields = {}
    return embed
end

function WHESetField(webhook, name, value, inline)
    assert(type(name) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(name))
    assert(type(value) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 3 got " .. type(value))
    assert(type(inline) == "boolean", "[WEBHOOK-LIBRARY] Expected boolean at argument 4 got " .. type(inline))
    webhook.embeds[1].fields[#webhook.embeds[1].fields + 1] = {
        name = name,
        value = value,
        inline = inline
    }
    return webhook
end

function WHESetAuthor(webhook, name, url, icon_url)
    assert(type(name) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(name))
    assert(type(url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 3 got " .. type(url))
    assert(type(icon_url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 4 got " .. type(icon_url))
    webhook.embeds[1].author = {
        name = name,
        url = url,
        icon_url = icon_url
    }
    return webhook
end

function WHESetURL(webhook, url)
    assert(type(url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(url))
    webhook.embeds[1].url = url
    return webhook
end

function WHESetDescription(webhook, description)
    assert(type(description) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(description))
    webhook.embeds[1].description = description
    return webhook
end

function WHESetColor(webhook, color)
    assert(type(color) == "string", "[WEBHOOK-LIBRARY] Expected integer at argument 2 got " .. type(color))
    webhook.embeds[1].color = color
    return webhook
end

function WHESetThumbnail(webhook, url)
    assert(type(url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(url))
    webhook.embeds[1].thumbnail = {
        url = url
    }
    return webhook
end

function WHESetImage(webhook, url)
    assert(type(url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(url))
    webhook.embeds[1].image = {
        url = url
    }
    return webhook
end

function WHESetFooter(webhook, text, icon_url)
    assert(type(text) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(text))
    assert(type(icon_url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 3 got " .. type(icon_url))
    webhook.embeds[1].footer = {
        text = text,
        icon_url = icon_url
    }
    return webhook
end

function sendCallBack(err, results, logging)
    if (logging) then
        iprint(err, results)
    end
end

function WHSend(webhook, logging)
    assert(type(logging) == "boolean", "[WEBHOOK-LIBRARY] Expected boolean at argument 3 got " .. type(text))
    local postData = toJSON(webhook)
    postData = postData:sub(2, postData:len() - 1)
    local SEND_OPTIONS = {
        headers = {
            ["Content-Type"] = "application/json"
        },
        postData = postData
    }
    fetchRemote(webhook.webhook_url, SEND_OPTIONS, sendCallBack, {logging})
    return webhook
end

