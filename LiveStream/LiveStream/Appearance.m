//
//  Appearance.m
//  LiveStream
//
//  Created by Dalton on 9/25/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "Appearance.h"

@implementation Appearance

+ (void)initializeAppearanceDefaults {
    
    
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:32/255.0 green:95/255.0 blue:254/255.0 alpha:1]];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[UITabBar appearance] setTranslucent:NO];
    
    [[UITextField appearance] setBackgroundColor:[UIColor clearColor]];
    [[UITextField appearance] setBorderStyle:UITextBorderStyleNone];
    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor],                                                           NSForegroundColorAttributeName,
                                                           [UIFont fontWithName:@"SystemFont" size: 22.0],
                                                           NSFontAttributeName,
                                                           nil]];
    
}




@end
