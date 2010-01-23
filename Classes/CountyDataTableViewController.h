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
}
@property (nonatomic, copy) NSArray *countyArray;

// designated initializer
- (id)initWithStyle:(UITableViewStyle)aStyle 
              state:(NSString *)aState 
             county:(NSString *)aCounty;

@end
