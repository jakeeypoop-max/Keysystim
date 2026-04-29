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

local function CreateGUI()
    print("Creating Jake's Hub GUI...")
    
    -- Get parent (CoreGui or PlayerGui)
    local success, targetParent = pcall(function()
        return game:GetService("CoreGui")
    end)
    
    if not success or not targetParent then
        targetParent = LocalPlayer:WaitForChild("PlayerGui")
    end
    
    -- Remove existing GUI
    local existingGui = targetParent:FindFirstChild("JakesHubKeySystem")
    if existingGui then
        existingGui:Destroy()
    end
    
    -- Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "JakesHubKeySystem"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = targetParent
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 420, 0, 460)
    MainFrame.Position = UDim2.new(0.5, -210, 0.5, -230)
    MainFrame.BackgroundColor3 = Color3.fromRGB(13, 13, 18)
    MainFrame.BackgroundTransparency = 0
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    -- Corner
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 16)
    MainCorner.Parent = MainFrame
    
    -- Glowing border effect
    local Border = Instance.new("Frame")
    Border.Size = UDim2.new(1, 0, 1, 0)
    Border.BackgroundTransparency = 1
    Border.BorderSizePixel = 3
    Border.BorderColor3 = Color3.fromRGB(0, 200, 255)
    Border.Parent = MainFrame
    
    local BorderCorner = Instance.new("UICorner")
    BorderCorner.CornerRadius = UDim.new(0, 16)
    BorderCorner.Parent = Border
    
    -- Header Frame
    local HeaderFrame = Instance.new("Frame")
    HeaderFrame.Size = UDim2.new(1, 0, 0, 80)
    HeaderFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    HeaderFrame.BorderSizePixel = 0
    HeaderFrame.Parent = MainFrame
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 16)
    HeaderCorner.Parent = HeaderFrame
    
    -- Accent line
    local AccentLine = Instance.new("Frame")
    AccentLine.Size = UDim2.new(1, 0, 0, 3)
    AccentLine.Position = UDim2.new(0, 0, 1, -3)
    AccentLine.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
    AccentLine.BorderSizePixel = 0
    AccentLine.Parent = HeaderFrame
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -80, 0, 45)
    Title.Position = UDim2.new(0, 20, 0, 15)
    Title.BackgroundTransparency = 1
    Title.Text = Config.HubName or "JAKE'S HUB"
    Title.TextColor3 = Color3.fromRGB(0, 200, 255)
    Title.TextSize = 32
    Title.Font = Enum.Font.GothamBlack
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = HeaderFrame
    
    -- Subtitle
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Size = UDim2.new(1, -80, 0, 25)
    Subtitle.Position = UDim2.new(0, 22, 0, 52)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = Config.HubDescription or "PREMIUM ROBLOX EXECUTIVE CHEAT"
    Subtitle.TextColor3 = Color3.fromRGB(150, 150, 170)
    Subtitle.TextSize = 11
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    Subtitle.Parent = HeaderFrame
    
    -- Close Button
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 34, 0, 34)
    CloseBtn.Position = UDim2.new(1, -48, 0, 23)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseBtn.BackgroundTransparency = 0.85
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 20
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Parent = HeaderFrame
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(1, 0)
    CloseCorner.Parent = CloseBtn
    
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Content Frame
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(0.92, 0, 0, 280)
    ContentFrame.Position = UDim2.new(0.04, 0, 0, 95)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Parent = MainFrame
    
    -- Track Y position for dynamic placement
    local currentY = 0
    
    -- Discord Button (only if enabled in Config)
    if Config.ShowDiscord then
        local DiscordBtn = Instance.new("TextButton")
        DiscordBtn.Size = UDim2.new(1, 0, 0, 52)
        DiscordBtn.Position = UDim2.new(0, 0, 0, currentY)
        DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        DiscordBtn.Text = "     JOIN OUR DISCORD"
        DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        DiscordBtn.TextSize = 15
        DiscordBtn.Font = Enum.Font.GothamBold
        DiscordBtn.TextXAlignment = Enum.TextXAlignment.Left
        DiscordBtn.BorderSizePixel = 0
        DiscordBtn.Parent = ContentFrame
        
        local DiscordCorner = Instance.new("UICorner")
        DiscordCorner.CornerRadius = UDim.new(0, 10)
        DiscordCorner.Parent = DiscordBtn
        
        local DiscordIcon = Instance.new("ImageLabel")
        DiscordIcon.Size = UDim2.new(0, 24, 0, 24)
        DiscordIcon.Position = UDim2.new(0, 18, 0.5, -12)
        DiscordIcon.BackgroundTransparency = 1
        DiscordIcon.Image = "rbxassetid://18505728201"
        DiscordIcon.Parent = DiscordBtn
        
        DiscordBtn.MouseButton1Click:Connect(function()
            fSetClipboard(Config.DiscordURL)
            StatusLabel.Text = "✓ Discord link copied!"
            StatusLabel.TextColor3 = Color3.fromRGB(88, 101, 242)
            task.wait(2)
            StatusLabel.Text = "⚡ READY TO ACTIVATE ⚡"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        end)
        
        currentY = currentY + 62
    end
    
    -- Instagram Button (only if enabled in Config)
    if Config.ShowInstagram then
        local InstaBtn = Instance.new("TextButton")
        InstaBtn.Size = UDim2.new(1, 0, 0, 52)
        InstaBtn.Position = UDim2.new(0, 0, 0, currentY)
        InstaBtn.BackgroundColor3 = Color3.fromRGB(225, 48, 108)
        InstaBtn.Text = "     FOLLOW INSTAGRAM"
        InstaBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        InstaBtn.TextSize = 15
        InstaBtn.Font = Enum.Font.GothamBold
        InstaBtn.TextXAlignment = Enum.TextXAlignment.Left
        InstaBtn.BorderSizePixel = 0
        InstaBtn.Parent = ContentFrame
        
        local InstaCorner = Instance.new("UICorner")
        InstaCorner.CornerRadius = UDim.new(0, 10)
        InstaCorner.Parent = InstaBtn
        
        local InstaIcon = Instance.new("ImageLabel")
        InstaIcon.Size = UDim2.new(0, 24, 0, 24)
        InstaIcon.Position = UDim2.new(0, 18, 0.5, -12)
        InstaIcon.BackgroundTransparency = 1
        InstaIcon.Image = "rbxassetid://18355586382"
        InstaIcon.Parent = InstaBtn
        
        InstaBtn.MouseButton1Click:Connect(function()
            fSetClipboard(Config.InstagramURL)
            StatusLabel.Text = "✓ Instagram link copied!"
            StatusLabel.TextColor3 = Color3.fromRGB(225, 48, 108)
            task.wait(2)
            StatusLabel.Text = "⚡ READY TO ACTIVATE ⚡"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        end)
        
        currentY = currentY + 62
    end
    
    -- YouTube Button (only if enabled in Config)
    if Config.ShowYoutube then
        local YTBtn = Instance.new("TextButton")
        YTBtn.Size = UDim2.new(1, 0, 0, 52)
        YTBtn.Position = UDim2.new(0, 0, 0, currentY)
        YTBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        YTBtn.Text = "     SUBSCRIBE ON YT"
        YTBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        YTBtn.TextSize = 15
        YTBtn.Font = Enum.Font.GothamBold
        YTBtn.TextXAlignment = Enum.TextXAlignment.Left
        YTBtn.BorderSizePixel = 0
        YTBtn.Parent = ContentFrame
        
        local YTCorner = Instance.new("UICorner")
        YTCorner.CornerRadius = UDim.new(0, 10)
        YTCorner.Parent = YTBtn
        
        local YTIcon = Instance.new("ImageLabel")
        YTIcon.Size = UDim2.new(0, 24, 0, 24)
        YTIcon.Position = UDim2.new(0, 18, 0.5, -12)
        YTIcon.BackgroundTransparency = 1
        YTIcon.Image = "rbxassetid://82532989017804"
        YTIcon.Parent = YTBtn
        
        YTBtn.MouseButton1Click:Connect(function()
            fSetClipboard(Config.YoutubeURL)
            StatusLabel.Text = "✓ YouTube link copied!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            task.wait(2)
            StatusLabel.Text = "⚡ READY TO ACTIVATE ⚡"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        end)
        
        currentY = currentY + 62
    end
    
    -- Add separator if any social buttons were shown
    if Config.ShowDiscord or Config.ShowInstagram or Config.ShowYoutube then
        local Separator = Instance.new("Frame")
        Separator.Size = UDim2.new(1, 0, 0, 1)
        Separator.Position = UDim2.new(0, 0, 0, currentY - 10)
        Separator.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        Separator.BorderSizePixel = 0
        Separator.Parent = ContentFrame
    end
    
    -- Key Input Box position (after social buttons)
    local inputStartY = currentY + 15
    
    local KeyInput = Instance.new("TextBox")
    KeyInput.Size = UDim2.new(1, 0, 0, 48)
    KeyInput.Position = UDim2.new(0, 0, 0, inputStartY)
    KeyInput.PlaceholderText = " 🔑  ENTER YOUR LICENSE KEY"
    KeyInput.Text = ""
    KeyInput.Font = Enum.Font.GothamSemibold
    KeyInput.TextSize = 14
    KeyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    KeyInput.TextColor3 = Color3.fromRGB(200, 200, 220)
    KeyInput.TextXAlignment = Enum.TextXAlignment.Left
    KeyInput.ClearTextOnFocus = false
    KeyInput.BorderSizePixel = 0
    KeyInput.Parent = ContentFrame
    
    local KeyCorner = Instance.new("UICorner")
    KeyCorner.CornerRadius = UDim.new(0, 10)
    KeyCorner.Parent = KeyInput
    
    -- Verify Button
    local VerifyBtn = Instance.new("TextButton")
    VerifyBtn.Size = UDim2.new(0.48, 0, 0, 48)
    VerifyBtn.Position = UDim2.new(0, 0, 0, inputStartY + 58)
    VerifyBtn.Text = "VERIFY KEY"
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.TextSize = 15
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyBtn.BorderSizePixel = 0
    VerifyBtn.Parent = ContentFrame
    
    local VerifyCorner = Instance.new("UICorner")
    VerifyCorner.CornerRadius = UDim.new(0, 10)
    VerifyCorner.Parent = VerifyBtn
    
    -- Get Key Button (uses PlatoBoost to get actual key link)
    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Size = UDim2.new(0.48, 0, 0, 48)
    GetKeyBtn.Position = UDim2.new(0.52, 0, 0, inputStartY + 58)
    GetKeyBtn.Text = "GET FREE KEY"
    GetKeyBtn.Font = Enum.Font.GothamBold
    GetKeyBtn.TextSize = 15
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    GetKeyBtn.TextColor3 = Color3.fromRGB(0, 150, 255)
    GetKeyBtn.BorderSizePixel = 0
    GetKeyBtn.Parent = ContentFrame
    
    local GetKeyCorner = Instance.new("UICorner")
    GetKeyCorner.CornerRadius = UDim.new(0, 10)
    GetKeyCorner.Parent = GetKeyBtn
    
    -- Status Label
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Name = "StatusLabel"
    StatusLabel.Size = UDim2.new(0.92, 0, 0, 38)
    StatusLabel.Position = UDim2.new(0.04, 0, 0, 410)
    StatusLabel.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    StatusLabel.BackgroundTransparency = 0.7
    StatusLabel.Text = "⚡ READY TO ACTIVATE ⚡"
    StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
    StatusLabel.TextSize = 12
    StatusLabel.Font = Enum.Font.GothamBold
    StatusLabel.Parent = MainFrame
    
    local StatusCorner = Instance.new("UICorner")
    StatusCorner.CornerRadius = UDim.new(0, 8)
    StatusCorner.Parent = StatusLabel
    
    -- Adjust main frame height based on content
    local totalHeight = 460
    if not Config.ShowDiscord and not Config.ShowInstagram and not Config.ShowYoutube then
        MainFrame.Size = UDim2.new(0, 420, 0, 380)
        StatusLabel.Position = UDim2.new(0.04, 0, 0, 330)
        totalHeight = 380
    end
    
    -- Hover Effects
    local function AddHover(btn, defaultColor, hoverColor)
        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = hoverColor
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = defaultColor
        end)
    end
    
    AddHover(VerifyBtn, Color3.fromRGB(0, 150, 255), Color3.fromRGB(0, 170, 255))
    AddHover(GetKeyBtn, Color3.fromRGB(28, 28, 36), Color3.fromRGB(40, 40, 50))
    AddHover(CloseBtn, Color3.fromRGB(255, 50, 50), Color3.fromRGB(255, 30, 30))
    
    -- Verify Button Logic (uses actual PlatoBoost verification)
    VerifyBtn.MouseButton1Click:Connect(function()
        local key = KeyInput.Text
        if key == "" then
            StatusLabel.Text = "❌ Please enter a license key!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
            task.wait(2)
            StatusLabel.Text = "⚡ READY TO ACTIVATE ⚡"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
            return
        end
        
        StatusLabel.Text = "🔄 Verifying key with PlatoBoost..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        
        -- Use the actual redeemKey function from your PlatoBoost system
        local success, msg = redeemKey(key)
        
        if success then
            StatusLabel.Text = "✅ Key verified! Loading Jake's Hub..."
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
            task.wait(1)
            ScreenGui:Destroy()
            StartMainScript()
        else
            StatusLabel.Text = "❌ " .. msg
            StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
            task.wait(2)
            StatusLabel.Text = "⚡ READY TO ACTIVATE ⚡"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        end
    end)
    
    -- Get Key Button Logic (uses PlatoBoost to get actual key link)
    GetKeyBtn.MouseButton1Click:Connect(function()
        StatusLabel.Text = "🔗 Fetching key link from PlatoBoost..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        
        -- Use the actual cacheLink function from your PlatoBoost system
        local success, link = cacheLink()
        
        if success and link then
            fSetClipboard(link)
            StatusLabel.Text = "✓ Key link copied to clipboard!"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
            task.wait(2)
            StatusLabel.Text = "⚡ READY TO ACTIVATE ⚡"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        else
            StatusLabel.Text = "❌ Failed to fetch key link: " .. tostring(link)
            StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
            task.wait(2)
            StatusLabel.Text = "⚡ READY TO ACTIVATE ⚡"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        end
    end)
    
    -- Auto Load Saved Key
    if isfile and isfile(Config.KeyFileName) then
        local savedKey = readfile(Config.KeyFileName)
        if savedKey and savedKey ~= "" then
            StatusLabel.Text = "🔄 Found saved key, verifying..."
            StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
            task.spawn(function()
                local success, msg = redeemKey(savedKey)
                if success then
                    StatusLabel.Text = "✅ Auto-login successful! Loading Jake's Hub..."
                    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
                    task.wait(1)
                    ScreenGui:Destroy()
                    StartMainScript()
                else
                    StatusLabel.Text = "⚠️ Saved key expired or invalid"
                    StatusLabel.TextColor3 = Color3.fromRGB(255, 150, 0)
                    task.wait(2)
                    StatusLabel.Text = "⚡ READY TO ACTIVATE ⚡"
                    StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
                end
            end)
        end
    end
    
    -- Animate entrance
    MainFrame.BackgroundTransparency = 1
    for i = 0, 1, 0.05 do
        task.wait(0.01)
        MainFrame.BackgroundTransparency = 1 - i
    end
    
    print("GUI Created Successfully!")
end

-- Start
local player = game:GetService("Players").LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

if pGui:FindFirstChild(Config.MainGuiName) then
    StartMainScript()
    return
end

CreateGUI()
