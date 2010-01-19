//
//  CountiesTableViewController.h
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CountiesTableViewController : UITableViewController {
    NSArray *countiesArray;
}
@property (nonatomic, copy) NSArray *countiesArray;

// designated initializer
- (id)initWithStateName:(NSString *)aStateName;

@end
