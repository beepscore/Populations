//
//  RootViewController.h
//  Populations
//
//  Created by Steve Baker on 1/17/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

@class States;

@interface RootViewController : UITableViewController {
    States *states;
}

@property (nonatomic, retain) States *states;

@end
