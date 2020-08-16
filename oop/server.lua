Webhook = {}
Embed = {}
Fields = {}

function Webhook.new(webhook_url, username)
    assert(type(webhook_url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(webhook_url))
    assert(type(username) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(username))
    local self = setmetatable({}, {__index = Webhook})
    self.webhook_url = webhook_url
    self.username = username
    self.embeds = {}
    return self
end

function Webhook:setAvatar(avatar_url)
    assert(type(avatar_url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(avatar_url))
    self.avatar_url = avatar_url
end

function Webhook:setContent(content)
    assert(type(content) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(content))
    self.content = content
end

function Webhook:setEmbed(title)
    assert(type(title) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(title))
    local embed = Embed.new(title)
    self.embeds = {embed}
    return embed
end

function Embed.new(title)
    assert(type(title) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(title))
    local self = setmetatable({}, {__index = Embed})
    self.title = title
    self.fields = {}
    return self
end

function Embed:setField(name, value, inline)
    assert(type(name) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(name))
    assert(type(value) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(value))
    assert(type(inline) == "boolean", "[WEBHOOK-LIBRARY] Expected boolean at argument 3 got " .. type(inline))
    self.fields[#self.fields + 1] = {
        name = name,
        value = value,
        inline = inline
    }
end

function Embed:setAuthor(name, url, icon_url)
    assert(type(name) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(name))
    assert(type(url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(url))
    assert(type(icon_url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 3 got " .. type(icon_url))
    self.name = name
    self.url = url
    self.icon_url = icon_url
end

function Embed:setURL(url)
    assert(type(url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(url))
    self.url = url
end

function Embed:setDescription(description)
    assert(type(description) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(description))
    self.description = description
end

function Embed:setColor(color)
    assert(type(color) == "string", "[WEBHOOK-LIBRARY] Expected integer at argument 1 got " .. type(color))
    self.color = color
end

function Embed:setThumbnail(url)
    assert(type(url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(url))
    self.thumbnail = {
        url = url
    }
end

function Embed:setImage(url)
    assert(type(url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(url))
    self.image = {
        url = url
    }
end

function Embed:setFooter(text, icon_url)
    assert(type(text) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 1 got " .. type(text))
    assert(type(icon_url) == "string", "[WEBHOOK-LIBRARY] Expected string at argument 2 got " .. type(icon_url))
    self.footer = {
        text = text,
        icon_url = icon_url
    }
end

function sendCallBack(err, results, logging)
    if (logging) then
        iprint(results)
    end
end

function Webhook:Send(logging)
    assert(type(logging) == "boolean", "[WEBHOOK-LIBRARY] Expected boolean at argument 1 got " .. type(text))
    local postData = toJSON(self)
    postData = postData:sub(2, postData:len() - 1)
    local SEND_OPTIONS = {
        headers = {
            ["Content-Type"] = "application/json"
        },
        postData = postData
    }
    fetchRemote(self.webhook_url, SEND_OPTIONS, sendCallBack, {logging})
end
