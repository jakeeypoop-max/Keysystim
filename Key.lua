local Config = {
    -- [1] PlatoBoost Settings
    ServiceId       = 24669, -- Your PlatoBoost Service ID
    PlatoSecret     = "13196169-eda2-434b-a6de-67808530f921", -- Your PlatoBoost Secret Key

    -- [2] Anti-Bypass / Global Secret Variable
    Secret          = "poopie", -- This makes the script ONLY run from the key script. Even if they copy the original obfuscated script to bypass the key, they won't be able to!
    
    -- [3] Scripts & Links
    MainScriptURL   = "https://raw.githubusercontent.com/jakeeypoop-max/Keysystim/refs/heads/main/Script.lua", -- The raw URL of your main script
    
    -- [4] Social Media Settings (Set to true to show, false to hide)
    ShowDiscord     = false,
    DiscordURL      = "https://discord.gg/",
    
    ShowInstagram   = false,
    InstagramURL    = "https://www.instagram.com//",
    
    ShowYoutube     = false,
    YoutubeURL      = "https://www.youtube.com/channel/",

    -- [5] File System
    KeyFileName     = "Mykey.txt", -- The name of the file where the valid key will be saved for auto-login

    -- [6] GUI Management
    OldGuiName      = "Jakeey", -- Name of the old GUI to destroy if it's already open
    MainGuiName     = "jakeeyHub", -- Name of the main script's GUI to check if it's already executing

    -- [7] Hub Information & UI Text
    HubName         = "jakeeyhub", -- The main title shown at the top of the GUI
    HubDescription  = "best scripts" -- The text shown below the title
}

-------------------------------------------------------------------------------
--! LIBRARIES (JSON & CRYPTOGRAPHY) - DO NOT MODIFY
-------------------------------------------------------------------------------
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;

-------------------------------------------------------------------------------
--! CORE FUNCTIONS (REQUESTS & VERIFICATION)
-------------------------------------------------------------------------------

local useNonce = true -- Hidden from Config to avoid user confusion, but active for security

-- Safe request function for universal executor support
local function safeRequest(options)
    local req = request or http_request or syn_request or (http and http.request )
    if not req then return nil, "HTTP requests not supported" end
    local success, response = pcall(function() return req(options) end)
    if success and response then return response else return nil, "Connection Error" end
end

local fSetClipboard = setclipboard or toclipboard or function() end
local fStringChar, fToString, fOsTime, fMathRandom, fMathFloor = string.char, tostring, os.time, math.random, math.floor
local fGetHwid = gethwid or function() return game:GetService("RbxAnalyticsService"):GetClientId() end

local cachedLink, cachedTime = "", 0
local host = "https://api.platoboost.com"

-- Check server connectivity
local function checkConnectivity( )
    local response = safeRequest({Url = host .. "/public/connectivity", Method = "GET"})
    if not response or (response.StatusCode ~= 200 and response.StatusCode ~= 429) then
        host = "https://api.platoboost.net"
    end
end
checkConnectivity( )

local function generateNonce()
    local str = ""
    for _ = 1, 16 do str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return str
end

-- Get player's key link
local function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response, err = safeRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({service = Config.ServiceId, identifier = lDigest(fGetHwid())}),
            Headers = {["Content-Type"] = "application/json"}
        })
        if response and response.StatusCode == 200 then
            local decoded = lDecode(response.Body)
            if decoded.success then
                cachedLink = decoded.data.url
                cachedTime = fOsTime()
                return true, cachedLink
            end
        end
        return false, err or "Server Unreachable"
    end
    return true, cachedLink
end

-- Verify key on input
local function redeemKey(key)
    local nonce = generateNonce()
    local body = {identifier = lDigest(fGetHwid()), key = key}
    if useNonce then body.nonce = nonce end
    
    local response, err = safeRequest({
        Url = host .. "/public/redeem/" .. fToString(Config.ServiceId),
        Method = "POST",
        Body = lEncode(body),
        Headers = {["Content-Type"] = "application/json"}
    })
    
    if response and response.StatusCode == 200 then
        local decoded = lDecode(response.Body)
        if decoded.success and decoded.data.valid then
            if useNonce then
                if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. Config.PlatoSecret) then 
                    if writefile then writefile(Config.KeyFileName, key) end
                    return true, "Success" 
                end
                return false, "Integrity Check Failed"
            end
            if writefile then writefile(Config.KeyFileName, key) end
            return true, "Success"
        end
        return false, decoded.message or "Invalid Key"
    end
    return false, err or "Server Error"
end

-------------------------------------------------------------------------------
--! GUI & MAIN SCRIPT EXECUTION
-------------------------------------------------------------------------------

local function StartMainScript()
    local player = game:GetService("Players").LocalPlayer
    local pGui = player:WaitForChild("PlayerGui")
    
    if pGui:FindFirstChild(Config.OldGuiName) then 
        pGui[Config.OldGuiName]:Destroy() 
        task.wait(0.1)
    end
    
    _G[Config.Secret] = true 
    loadstring(game:HttpGet(Config.MainScriptURL))()
end

local function CreateGUI()
    local player = game:GetService("Players").LocalPlayer
    local coreGui = game:GetService("CoreGui")
    local targetParent = pcall(function() return coreGui end) and coreGui or player:WaitForChild("PlayerGui")
    
    if targetParent:FindFirstChild("JakesHub_KeySystem") then targetParent.JakesHub_KeySystem:Destroy() end

    local ScreenGui = Instance.new("ScreenGui", targetParent)
    ScreenGui.Name = "JakesHub_KeySystem"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Main Frame
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 400, 0, 520)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -260)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    MainFrame.BackgroundTransparency = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.ClipsDescendants = true
    
    local Corner = Instance.new("UICorner", MainFrame)
    Corner.CornerRadius = UDim.new(0, 12)
    
    -- Inner glow border
    local InnerBorder = Instance.new("Frame", MainFrame)
    InnerBorder.Size = UDim2.new(1, -4, 1, -4)
    InnerBorder.Position = UDim2.new(0, 2, 0, 2)
    InnerBorder.BackgroundTransparency = 1
    InnerBorder.BorderSizePixel = 2
    InnerBorder.BorderColor3 = Color3.fromRGB(0, 255, 255)
    local InnerCorner = Instance.new("UICorner", InnerBorder)
    InnerCorner.CornerRadius = UDim.new(0, 10)
    
    -- Header
    local Header = Instance.new("Frame", MainFrame)
    Header.Size = UDim2.new(1, 0, 0, 70)
    Header.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    local HeaderCorner = Instance.new("UICorner", Header)
    HeaderCorner.CornerRadius = UDim.new(0, 12)
    
    -- Header gradient line
    local GradientLine = Instance.new("Frame", Header)
    GradientLine.Size = UDim2.new(1, 0, 0, 3)
    GradientLine.Position = UDim2.new(0, 0, 1, -3)
    GradientLine.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    
    -- Title
    local Title = Instance.new("TextLabel", Header)
    Title.Size = UDim2.new(1, -80, 0, 40)
    Title.Position = UDim2.new(0, 15, 0, 15)
    Title.BackgroundTransparency = 1
    Title.Text = "JAKE'S HUB"
    Title.TextColor3 = Color3.fromRGB(0, 255, 255)
    Title.Font = Enum.Font.GothamBlack
    Title.TextSize = 28
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Subtitle
    local Subtitle = Instance.new("TextLabel", Header)
    Subtitle.Size = UDim2.new(1, -80, 0, 20)
    Subtitle.Position = UDim2.new(0, 18, 0, 45)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = Config.HubDescription or "PREMIUM ROBLOX CHEAT"
    Subtitle.TextColor3 = Color3.fromRGB(150, 150, 180)
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextSize = 12
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Close Button
    local CloseBtn = Instance.new("TextButton", Header)
    CloseBtn.Size = UDim2.new(0, 32, 0, 32)
    CloseBtn.Position = UDim2.new(1, -42, 0, 19)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseBtn.BackgroundTransparency = 0.8
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 18
    CloseBtn.BorderSizePixel = 0
    local CloseCorner = Instance.new("UICorner", CloseBtn)
    CloseCorner.CornerRadius = UDim.new(1, 0)
    
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Content Container
    local ContentContainer = Instance.new("Frame", MainFrame)
    ContentContainer.Size = UDim2.new(0.92, 0, 0, 370)
    ContentContainer.Position = UDim2.new(0.04, 0, 0, 85)
    ContentContainer.BackgroundTransparency = 1
    
    -- Discord Button
    if Config.ShowDiscord then
        local DiscordBtn = Instance.new("TextButton", ContentContainer)
        DiscordBtn.Size = UDim2.new(1, 0, 0, 50)
        DiscordBtn.Position = UDim2.new(0, 0, 0, 0)
        DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        DiscordBtn.Text = "  JOIN DISCORD SERVER"
        DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        DiscordBtn.Font = Enum.Font.GothamBold
        DiscordBtn.TextSize = 16
        local DiscordCorner = Instance.new("UICorner", DiscordBtn)
        DiscordCorner.CornerRadius = UDim.new(0, 8)
        
        local DiscordIcon = Instance.new("ImageLabel", DiscordBtn)
        DiscordIcon.Size = UDim2.new(0, 24, 0, 24)
        DiscordIcon.Position = UDim2.new(0, 15, 0.5, -12)
        DiscordIcon.BackgroundTransparency = 1
        DiscordIcon.Image = "rbxassetid://18505728201"
        
        DiscordBtn.MouseButton1Click:Connect(function()
            fSetClipboard(Config.DiscordURL)
            local Status = MainFrame:FindFirstChild("StatusLabel")
            if Status then 
                Status.Text = "✓ Discord link copied!"
                Status.TextColor3 = Color3.fromRGB(88, 101, 242)
                task.wait(2)
                Status.Text = "Enter your license key to continue"
                Status.TextColor3 = Color3.fromRGB(150, 150, 150)
            end
            local inviteCode = string.match(Config.DiscordURL, "discord%.gg/([%w-]+)")
            if syn and syn.request and inviteCode then
                syn.request({Url = "http://localhost:1111/discord?invite=" .. inviteCode, Method = "GET"})
            end
        end)
    end
    
    -- Instagram Button
    local instaY = 0
    if Config.ShowDiscord then instaY = 60 end
    
    if Config.ShowInstagram then
        local InstaBtn = Instance.new("TextButton", ContentContainer)
        InstaBtn.Size = UDim2.new(1, 0, 0, 50)
        InstaBtn.Position = UDim2.new(0, 0, 0, instaY)
        InstaBtn.BackgroundColor3 = Color3.fromRGB(225, 48, 108)
        InstaBtn.Text = "  FOLLOW INSTAGRAM"
        InstaBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        InstaBtn.Font = Enum.Font.GothamBold
        InstaBtn.TextSize = 16
        local InstaCorner = Instance.new("UICorner", InstaBtn)
        InstaCorner.CornerRadius = UDim.new(0, 8)
        
        local InstaIcon = Instance.new("ImageLabel", InstaBtn)
        InstaIcon.Size = UDim2.new(0, 24, 0, 24)
        InstaIcon.Position = UDim2.new(0, 15, 0.5, -12)
        InstaIcon.BackgroundTransparency = 1
        InstaIcon.Image = "rbxassetid://18355586382"
        
        InstaBtn.MouseButton1Click:Connect(function()
            fSetClipboard(Config.InstagramURL)
            local Status = MainFrame:FindFirstChild("StatusLabel")
            if Status then 
                Status.Text = "✓ Instagram link copied!"
                Status.TextColor3 = Color3.fromRGB(225, 48, 108)
                task.wait(2)
                Status.Text = "Enter your license key to continue"
                Status.TextColor3 = Color3.fromRGB(150, 150, 150)
            end
        end)
    end
    
    -- YouTube Button
    local ytY = instaY
    if Config.ShowInstagram then ytY = ytY + 60
    elseif Config.ShowDiscord then ytY = ytY + 60
    end
    
    if Config.ShowYoutube then
        local YTBtn = Instance.new("TextButton", ContentContainer)
        YTBtn.Size = UDim2.new(1, 0, 0, 50)
        YTBtn.Position = UDim2.new(0, 0, 0, ytY)
        YTBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        YTBtn.Text = "  SUBSCRIBE ON YOUTUBE"
        YTBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        YTBtn.Font = Enum.Font.GothamBold
        YTBtn.TextSize = 16
        local YTCorner = Instance.new("UICorner", YTBtn)
        YTCorner.CornerRadius = UDim.new(0, 8)
        
        local YTIcon = Instance.new("ImageLabel", YTBtn)
        YTIcon.Size = UDim2.new(0, 24, 0, 24)
        YTIcon.Position = UDim2.new(0, 15, 0.5, -12)
        YTIcon.BackgroundTransparency = 1
        YTIcon.Image = "rbxassetid://82532989017804"
        
        YTBtn.MouseButton1Click:Connect(function()
            fSetClipboard(Config.YoutubeURL)
            local Status = MainFrame:FindFirstChild("StatusLabel")
            if Status then 
                Status.Text = "✓ YouTube link copied!"
                Status.TextColor3 = Color3.fromRGB(255, 0, 0)
                task.wait(2)
                Status.Text = "Enter your license key to continue"
                Status.TextColor3 = Color3.fromRGB(150, 150, 150)
            end
        end)
    end
    
    -- Key Input Area
    local keyY = ytY
    if Config.ShowYoutube then keyY = keyY + 70
    elseif Config.ShowInstagram then keyY = keyY + 70
    elseif Config.ShowDiscord then keyY = keyY + 70
    else keyY = 0
    end
    
    -- Separator line
    local Separator = Instance.new("Frame", ContentContainer)
    Separator.Size = UDim2.new(1, 0, 0, 1)
    Separator.Position = UDim2.new(0, 0, 0, keyY - 15)
    Separator.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    
    local KeyInput = Instance.new("TextBox", ContentContainer)
    KeyInput.Size = UDim2.new(1, 0, 0, 45)
    KeyInput.Position = UDim2.new(0, 0, 0, keyY)
    KeyInput.PlaceholderText = "ENTER LICENSE KEY"
    KeyInput.Text = ""
    KeyInput.Font = Enum.Font.GothamSemibold
    KeyInput.TextSize = 14
    KeyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.TextXAlignment = Enum.TextXAlignment.Center
    local KeyCorner = Instance.new("UICorner", KeyInput)
    KeyCorner.CornerRadius = UDim.new(0, 8)
    
    -- Buttons
    local VerifyBtn = Instance.new("TextButton", ContentContainer)
    VerifyBtn.Size = UDim2.new(0.48, 0, 0, 45)
    VerifyBtn.Position = UDim2.new(0, 0, 0, keyY + 55)
    VerifyBtn.Text = "VERIFY KEY"
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.TextSize = 14
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    local VerifyCorner = Instance.new("UICorner", VerifyBtn)
    VerifyCorner.CornerRadius = UDim.new(0, 8)
    
    local GetKeyBtn = Instance.new("TextButton", ContentContainer)
    GetKeyBtn.Size = UDim2.new(0.48, 0, 0, 45)
    GetKeyBtn.Position = UDim2.new(0.52, 0, 0, keyY + 55)
    GetKeyBtn.Text = "GET FREE KEY"
    GetKeyBtn.Font = Enum.Font.GothamBold
    GetKeyBtn.TextSize = 14
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    GetKeyBtn.TextColor3 = Color3.fromRGB(0, 150, 255)
    local GetKeyCorner = Instance.new("UICorner", GetKeyBtn)
    GetKeyCorner.CornerRadius = UDim.new(0, 8)
    
    -- Status Label
    local Status = Instance.new("TextLabel", MainFrame)
    Status.Name = "StatusLabel"
    Status.Size = UDim2.new(0.92, 0, 0, 35)
    Status.Position = UDim2.new(0.04, 0, 0, 470)
    Status.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    Status.BackgroundTransparency = 0.5
    Status.Text = "Enter your license key to continue"
    Status.TextColor3 = Color3.fromRGB(150, 150, 150)
    Status.Font = Enum.Font.Gotham
    Status.TextSize = 12
    local StatusCorner = Instance.new("UICorner", Status)
    StatusCorner.CornerRadius = UDim.new(0, 6)
    
    -- Hover effects
    local function AddHoverEffect(button, defaultColor, hoverColor)
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = hoverColor
            button:TweenSize(UDim2.new(button.Size.X.Scale, button.Size.X.Offset + 2, button.Size.Y.Scale, button.Size.Y.Offset), "Out", "Quad", 0.1, true)
        end)
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = defaultColor
            button:TweenSize(UDim2.new(button.Size.X.Scale, button.Size.X.Offset - 2, button.Size.Y.Scale, button.Size.Y.Offset), "Out", "Quad", 0.1, true)
        end)
    end
    
    AddHoverEffect(VerifyBtn, Color3.fromRGB(0, 150, 255), Color3.fromRGB(0, 170, 255))
    AddHoverEffect(GetKeyBtn, Color3.fromRGB(30, 30, 40), Color3.fromRGB(40, 40, 50))
    AddHoverEffect(CloseBtn, Color3.fromRGB(255, 50, 50), Color3.fromRGB(255, 30, 30))
    
    if Config.ShowDiscord then
        AddHoverEffect(DiscordBtn, Color3.fromRGB(88, 101, 242), Color3.fromRGB(100, 113, 255))
    end
    if Config.ShowInstagram then
        AddHoverEffect(InstaBtn, Color3.fromRGB(225, 48, 108), Color3.fromRGB(245, 68, 128))
    end
    if Config.ShowYoutube then
        AddHoverEffect(YTBtn, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 30, 30))
    end
    
    -- Verify Logic
    VerifyBtn.MouseButton1Click:Connect(function()
        local key = KeyInput.Text
        if key == "" then 
            Status.Text = "✗ Please enter a license key!"
            Status.TextColor3 = Color3.fromRGB(255, 50, 50)
            return 
        end
        Status.Text = "✓ Verifying key..."
        Status.TextColor3 = Color3.fromRGB(0, 200, 255)
        
        local success, msg = redeemKey(key)
        if success then
            Status.Text = "✓ Key verified! Loading Jake's Hub..."
            Status.TextColor3 = Color3.fromRGB(0, 255, 100)
            task.wait(0.8)
            ScreenGui:Destroy()
            StartMainScript()
        else
            Status.Text = "✗ " .. msg
            Status.TextColor3 = Color3.fromRGB(255, 50, 50)
            task.wait(2)
            Status.Text = "Enter your license key to continue"
            Status.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
    end)
    
    -- Get Key Logic
    GetKeyBtn.MouseButton1Click:Connect(function()
        Status.Text = "✓ Fetching key link..."
        Status.TextColor3 = Color3.fromRGB(0, 200, 255)
        
        local success, link = cacheLink()
        if success then
            fSetClipboard(link)
            Status.Text = "✓ Key link copied to clipboard!"
            Status.TextColor3 = Color3.fromRGB(0, 255, 100)
            task.wait(2)
            Status.Text = "Enter your license key to continue"
            Status.TextColor3 = Color3.fromRGB(150, 150, 150)
        else
            Status.Text = "✗ Error: " .. tostring(link)
            Status.TextColor3 = Color3.fromRGB(255, 50, 50)
            task.wait(2)
            Status.Text = "Enter your license key to continue"
            Status.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
    end)
    
    -- Auto Load Saved Key
    if isfile and isfile(Config.KeyFileName) then
        local savedKey = readfile(Config.KeyFileName)
        if savedKey ~= "" then
            Status.Text = "✓ Found saved key, verifying..."
            Status.TextColor3 = Color3.fromRGB(0, 200, 255)
            task.spawn(function()
                local success, msg = redeemKey(savedKey)
                if success then
                    Status.Text = "✓ Auto-login successful! Loading Jake's Hub..."
                    Status.TextColor3 = Color3.fromRGB(0, 255, 100)
                    task.wait(0.8)
                    ScreenGui:Destroy()
                    StartMainScript()
                else
                    Status.Text = "✗ Saved key expired or invalid"
                    Status.TextColor3 = Color3.fromRGB(255, 150, 0)
                    task.wait(2)
                    Status.Text = "Enter your license key to continue"
                    Status.TextColor3 = Color3.fromRGB(150, 150, 150)
                end
            end)
        end
    end
    
    -- Animate GUI entrance
    MainFrame.BackgroundTransparency = 1
    MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0, true)
    MainFrame.Size = UDim2.new(0, 400, 0, 520)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -260)
    
    for i = 0, 1, 0.05 do
        task.wait()
        MainFrame.BackgroundTransparency = 1 - i
        if i >= 1 then break end
    end
end

-- Start
local player = game:GetService("Players").LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

if pGui:FindFirstChild(Config.MainGuiName) then
    StartMainScript()
    return
end

CreateGUI()
