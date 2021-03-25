--Auto-generated script

function TimerTick()
    newValue = NamedControl.GetValue("bitrateFader")
--    print(newValue)
    lPnewValue = newValue * 100 + 80
--    print(newValue)
    NamedControl.SetValue("bitrateValue", newValue)
    if System.IsDebugging then
--        print(newValue)
    end
end

function SubmitEncodeSettings()
    ndiaudio = NamedControl.GetValue("muteButton")
    nditally = NamedControl.GetValue("tallyButton")
    ndivideoq = NamedControl.GetValue("bitrateValue")
    if System.IsDebugging then
        print(ndiaudio)
        print(nditally)
        print(ndivideoq)
    end
end

if System.IsDebugging then
    NamedControl.SetValue("tallyButton", 1)
end

Maxq = 180
Minq = 80
Defaultq = 120
faderInit = ((Defaultq - Minq) / 100)
print("FaderInit = ", faderInit)
NamedControl.SetValue("bitrateFader", faderInit)
NamedControl.SetValue("bitrateValue", Defaultq)

MyTimer = Timer.New()
MyTimer.EventHandler = TimerTick
MyTimer:Start(1.0)

SubmitEncodeSettings()