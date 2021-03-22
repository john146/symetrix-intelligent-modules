--Auto-generated script

function TimerTick()
    newValue = NamedControl.GetValue("bitrateFader")
    print(newValue)
    newValue = newValue * 100 + 80
    NamedControl.SetValue("bitrateValue", newValue)
    if System.IsDebugging then
        print(newValue)
    end
end

function SubmitEncodeSettings()
    ndiaudio = NamedControl.GetValue("muteButton")
    nditally = NamedControl.GetValue("tallyButton")
    ndivideoq = NamedControl.GetValue("bitrateText")
    if System.IsDebugging then
        print(ndiaudio)
        print(nditally)
        print(ndivideoq)
    end
end

if System.IsDebugging then
    NamedControl.SetValue("tallyButton", 1)
end

faderInit = ((120 - 80) / 100)
print("FaderInit = $faderInit")
NamedControl.SetValue("bitrateFader", faderInit)

MyTimer = Timer.New()
MyTimer.EventHandler = TimerTick
MyTimer:Start(0.1)

SubmitEncodeSettings()