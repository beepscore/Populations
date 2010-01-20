//
//  CountiesTableViewController.m
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "CountiesTableViewController.h"
#import "States.h"
#import "CountyDataTableViewController.h"


@implementation CountiesTableViewController

@synthesize countiesArray;


#pragma mark initializers
- (id)init {
    return [self initWithStateName:@"Alabama"];
}


// designated initializer
- (id)initWithStateName:(NSString *)aStateName {
    self = [super init];
    if (self) {
        // Set title using aStateName.  Also this will be displayed in the next higher view's back button.
        self.title = aStateName;

        States *tempStates = [[States alloc] init];
        self.countiesArray = [tempStates countiesArrayWithState:aStateName];
        [tempStates release];        
    }
    return self;    
}


#pragma mark -
#pragma mark destructors and memory cleanUp
// use cleanUp method to avoid repeating code in dealloc, setView, and viewDidUnload
-(void)cleanUp {
    [countiesArray release], countiesArray = nil;
}

- (void)dealloc {
    [self cleanUp];
    [super dealloc];
}

// Release IBOutlets in setView.  
// Ref http://developer.apple.com/iPhone/library/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/mmNibObjects.html
//
// http://moodle.extn.washington.edu/mod/forum/discuss.php?d=3162
- (void)setView:(UIView *)aView {
    
    if (!aView) { // view is being set to nil        
        // set outlets to nil, e.g. 
        // self.anOutlet = nil;
        [self cleanUp];
    }    
    // Invoke super's implementation last    
    [super setView:aView];    
}


- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
    [self cleanUp];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.countiesArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	cell.textLabel.text = [self.countiesArray objectAtIndex:indexPath.row];
    
    return cell;
}


// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Navigation logic may go here -- for example, create and push another view controller.
        
    CountyDataTableViewController *countyDataTableViewController = 
    [[CountyDataTableViewController alloc] initWithState:self.title
                                                  county:[self.countiesArray objectAtIndex:indexPath.row]];
    
	[self.navigationController pushViewController:countyDataTableViewController animated:YES];
	[countyDataTableViewController release];
    
}


@end