//
//  AppDelegate.m
//  CEFBrowserTask
//
//  Created by Ashutosh Chavan on 16/04/15.
//  Copyright (c) 2015 Radix. All rights reserved.
//

#import "AppDelegate.h"


#import "include/cef_app.h"
#import "include/cef_application_mac.h"
#import "include/cef_base.h"
#import "include/cef_browser.h"
#import "include/cef_client.h"
#import "include/cef_command_line.h"
#import "include/cef_frame.h"
#import "include/cef_runnable.h"
#import "include/cef_web_plugin.h"
#import "include/cef_web_urlrequest.h"
    
#import "ClientHandler.h"
#include <iostream>

@implementation AppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    CefSettings appSettings;
    CefBrowserSettings browserSettings;
    
    CefRefPtr<CefApp> cefApplication;
    CefRefPtr<CefClient> client(new ClientHandler());
    
    CefWindowInfo info;
    info.SetAsChild([window contentView], 0, 0, [[window contentView] frame].size.width, [[window contentView] frame].size.height);
    
    CefInitialize(appSettings, cefApplication);
    
    std::string path = [[[NSBundle mainBundle] resourcePath] cStringUsingEncoding:NSUTF8StringEncoding];
    
    path = "http://www.google.com";
    
    CefBrowser::CreateBrowser(info, client, path, browserSettings);
    
    CefRunMessageLoop();
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
