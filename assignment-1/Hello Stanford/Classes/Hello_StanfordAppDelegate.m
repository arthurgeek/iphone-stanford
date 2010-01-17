//
//  Hello_StanfordAppDelegate.m
//  Hello Stanford
//
//  Created by Arthur Zapparoli on 17/01/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "Hello_StanfordAppDelegate.h"

@implementation Hello_StanfordAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
