//
//  RootViewController.h
//  Populations
//
//  Created by Steve Baker on 1/17/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

@interface RootViewController : UITableViewController {
    // ????: Make a separate model class and load plist into it?
    NSDictionary *states;
}

@property (nonatomic, copy) NSDictionary *states;
@end
