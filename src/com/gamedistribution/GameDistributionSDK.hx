package com.gamedistribution;

import openfl.external.ExternalInterface;

/**
	@see <https://gamedistribution.com/sdk/html5>
**/
class GameDistributionSDK
{
    public static var allEventListeners = new Array<(eventName:String)->Void>();

	public static function init():Void
    {
        if (ExternalInterface.available)
        {
            ExternalInterface.addCallback("onGameDistributionEvent", onGameDistributionEvent);
            js.Syntax.code("gdsdkReady();");
        }
    }

    public static function showAd():Void
    {
        js.Syntax.code("
            if (typeof gdsdk !== 'undefined' && gdsdk.showAd !== 'undefined') {
                gdsdk.showAd();
            }
        ");
    }

    static function onGameDistributionEvent(event):Void
    {
        for(listener in allEventListeners)
        {
            listener(event.name);
        }
    }
}