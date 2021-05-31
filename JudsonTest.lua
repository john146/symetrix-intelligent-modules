function UrlCallback(Table, ReturnCode, Data, Error, Headers)
    -- Handle the error.
    if ReturnCode < 200 or ReturnCode > 299 then
        print("Error when returned: " .. ReturnCode .. ", " .. Error)
        return
    end

    -- Handle success
    print("Success: " .. ReturnCode .. ", " .. Data)
end

function TimerClick()
   -- isSubmit = NamedControl.GetValue("Submit")
    --print("isSubmit = %i", isSubmit)
    --if isSubmit == 1 then
        print("Ready to POST to BirdDog")
        HttpClient.Upload({Url = "http://birddog-e4689:8080/connectTo",
                        Timeout = 3,
                        Method = "POST",
                        Data = "{\"connectToIp\":\"10.0.1.4\",\"port\":5961,\"sourceName\":\"birddog-e4cef\",\"sourcePcName\":\"Symetrix\"}",
                        EventHandler = UrlCallback})
    --    NamedControl.SetValue("Submit", 0)
    --end
end

MyTimer = Timer.New()
MyTimer.EventHandler = TimerClick
MyTimer:Start(2)

