--Auto-generated script

function TimerTick()
    faderValue = NamedControl.GetValue("bitrateFader")
    newValue = faderValue * 100 + Minq
    NamedControl.SetValue("bitrateValue", newValue)
    if System.IsDebugging then
        print("Fader value = ", faderValue)
        print("New value = ", newValue)
    end
end

function SubmitEncodeSettings()
    ndiaudio = NamedControl.GetValue("muteButton")
    nditally = NamedControl.GetValue("tallyButton")
    ndivideoq = NamedControl.GetValue("bitrateValue")
    if System.IsDebugging then
        print("NDI Audio = ", ndiaudio)
        print("NDI Tally = ", nditally)
        print("NDI Video quality = ", ndivideoq)
    end
end

if System.IsDebugging then
    NamedControl.SetValue("tallyButton", 1)
    NamedControl.SetValue("bitrateFader", 0.4)
    NamedControl.SetValue("bitrateValue", 120)
    print("Fader = ", NamedControl.GetValue("bitrateFader"))
    print("Value = ", NamedControl.GetValue("bitrateValue"))
end

Maxq = 180
Minq = 80
Defaultq = 120
FaderInit = ((Defaultq - Minq) / 100)
NamedControl.SetValue("bitrateFader", FaderInit)
NamedControl.SetValue("bitrateValue", Defaultq)

SubmitEncodeSettings()

MyTimer = Timer.New()
MyTimer.EventHandler = TimerTick
MyTimer:Start(1.0)
