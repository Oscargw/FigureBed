
local iOSNotificationTimeIntervalTrigger = CS.Unity.Notifications.iOS.iOSNotificationTimeIntervalTrigger
local iOSNotificationCalendarTrigger = CS.Unity.Notifications.iOS.iOSNotificationCalendarTrigger
local iOSNotificationCenter =  CS.Unity.Notifications.iOS.iOSNotificationCenter
local iOSNotification = CS.Unity.Notifications.iOS.iOSNotification
local iOSNotificationData = CS.Unity.Notifications.iOS.iOSNotificationData
local PresentationOption = CS.Unity.Notifications.iOS.PresentationOption
local TimeSpan = CS.System.TimeSpan
local DateTime = CS.System.DateTime


-- iOSNotificationCenter:RemoveAllDeliveredNotifications();
-- iOSNotificationCenter:RemoveAllScheduledNotifications();

local timeTrigger = iOSNotificationTimeIntervalTrigger()
timeTrigger.TimeInterval = TimeSpan(0, 1, 0)
timeTrigger.Repeats = true

print("aosika ---------- begin ---------");

local timeTrigger2 = iOSNotificationCalendarTrigger()
-- timeTrigger2.Year = 2022
-- timeTrigger2.Month = 5
-- timeTrigger2.Day = 10
timeTrigger2.Hour = 12
timeTrigger2.Minute = 05
-- timeTrigger2.Second = 0
timeTrigger2.Repeats = true

local notification = iOSNotification()
notification.Identifier = "_notification_01"
notification.Title = "Title123"
notification.Subtitle = "SubTitleABC"
local bodyStr = string.format("%s%s%s", "Scheduled at: ", DateTime.Now:ToString("yyyy-MM-dd-HH-mm-ss"), " triggered in 5 seconds")
notification.Body = bodyStr
notification.ShowInForeground = true
-- notification.ForegroundPresentationOption = (PresentationOption.Alert | PresentationOption.Sound)
notification.CategoryIdentifier = "category_a"
notification.ThreadIdentifier = "thread1"
notification.Trigger = timeTrigger

print("aosika, notification = ", notification.ForegroundPresentationOption)
iOSNotificationCenter.ScheduleNotification(notification);

local retSNs = iOSNotificationCenter.GetScheduledNotifications()
print("aosika, #retSNs = ", retSNs)


print("aosika ---------- end ------------------")