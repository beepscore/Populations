//
//  PopulationsAppDelegate.h
//  Populations
//
//  Created by Steve Baker on 1/17/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

@interface PopulationsAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

