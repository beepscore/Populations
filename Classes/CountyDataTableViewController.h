//
//  CountyDataTableViewController.h
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CountyDataTableViewController : UITableViewController {
    NSArray *countyArray;
    NSString *viewTitle;
}
@property (nonatomic, copy) NSArray *countyArray;
@property (nonatomic, copy) NSString *viewTitle;

// designated initializer
- (id)initWithStyle:(UITableViewStyle)aStyle 
              stateName:(NSString *)aStateName 
             countyName:(NSString *)aCountyName;

@end
