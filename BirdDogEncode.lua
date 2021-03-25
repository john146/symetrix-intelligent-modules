--Auto-generated script

function TimerTick()
    faderValue = NamedControl.GetValue("bitrateFader")
    NamedControl.SetValue("bitrateValue", faderValue)
    if System.IsDebugging then
        print("Fader value = ", faderValue)
    end

    SubmitEncodeSettings()
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
    NamedControl.SetValue("bitrateFader", Defaultq)
    NamedControl.SetValue("bitrateValue", Defaultq)
    print("Fader = ", NamedControl.GetValue("bitrateFader"))
    print("Value = ", NamedControl.GetValue("bitrateValue"))
end

Maxq = 180
Minq = 80
Defaultq = 120
NamedControl.SetValue("bitrateFader", Defaultq)
--NamedControl.SetValue("bitrateValue", Defaultq)

SubmitEncodeSettings()

MyTimer = Timer.New()
MyTimer.EventHandler = TimerTick
MyTimer:Start(1.0)
