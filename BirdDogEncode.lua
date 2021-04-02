--Auto-generated script
JSON = require('json')

function TimerTick()
    local faderValue = NamedControl.GetValue("bitrateValue")
    if System.IsDebugging then
        print("Fader value = ", faderValue)
    end

    SubmitEncodeSettings()
end

function SendGetRequest(ndiaudio, nditally, ndivideoq)
    local url = NamedControl.GetText('birdDogAddr')
    HttpClient.Download({Url = url, EventHandler = GetResponse})
end

function SendPostRequest(data)
    local url = NamedControl.GetText('birdDogAddr')
    HttpClient.Upload({Url = url, Data = data, EventHandler = GetResponse})
end

function GetResponse(Table, ReturnCode, Data, Error, Headers)
    if (200 == ReturnCode) then
        if System.IsDebugging then
            print(string.format("URL requested = %s", Table.Url))
            print("Success!")
            print(string.format("Data returned = %s", Data))
            decoded = JSON.decode(Data)
            for i, k in pairs(decoded) do
                print(i, k)
            end
        end

        if decoded['ndiaudio'] == "mute" then
            NamedControl.SetValue('muteButton', 1)
        else
            NamedControl.SetValue('muteButton', 0)
        end

        if decoded['nditally'] == "tallyoff" then
            NamedControl.SetValue('tallyButton', 0)
        else
            NamedControl.SetValue('tallyButton', 1)
        end

        NamedControl.SetValue('faderValue', decoded['ndivideoq'])
    else
        print(string.format("Failed, error code %d, %s", ReturnCode, Error))
    end
end

function SubmitEncodeSettings()
    local data = {}
    if NamedControl.GetValue('muteButton') == 1 then
        data['ndiaudio'] = "mute"
    else
        data['ndiaudio'] = "unmute"
    end

    if NamedControl.GetValue('tallyButton') == 1 then
        data['nditally'] = "tallyon"
    else
        data['nditaly'] = "tallyoff"
    end

    data['ndivideoq'] = math.floor(NamedControl.GetValue('bitrateValue') + 0.5)
    if System.IsDebugging then
        print("NDI Audio = ", ndiaudio)
        print("NDI Tally = ", nditally)
        print("NDI Video quality = ", ndivideoq)
    end

    SendPostRequest(data)
end

if System.IsDebugging then
    NamedControl.SetValue("tallyButton", 1)
    NamedControl.SetValue("bitrateFader", Defaultq)
--    print("Fader = ", NamedControl.GetValue("bitrateValue"))
    print("Value = ", NamedControl.GetValue("bitrateValue"))
end

Maxq = 180
Minq = 80
Defaultq = 120
NamedControl.SetValue("bitrateFader", math.floor(Defaultq + 0.5))

SubmitEncodeSettings()

MyTimer = Timer.New()
MyTimer.EventHandler = TimerTick
MyTimer:Start(5.0)
