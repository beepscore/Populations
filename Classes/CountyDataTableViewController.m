//
//  CountyDataTableViewController.m
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "CountyDataTableViewController.h"
#import "States.h"


@implementation CountyDataTableViewController

@synthesize countyDictionary;


#pragma mark initializers
- (id)initWithStyle:(UITableViewStyle)aStyle {
    // call designated initializer
    return [self initWithStyle:aStyle state:@"Alabama" county:@"Autauga County"];
}


// designated initializer
- (id)initWithStyle:(UITableViewStyle)aStyle 
              state:(NSString *)aState 
             county:(NSString *)aCounty {
    // call super's designated intializer.  
    // Note UITableViewController may have 3 designated initializers.
    self = [super initWithStyle:aStyle];
    if (self) {
        // Set title using aCountyName.
        self.title = aCounty;

        States *tempStates = [[States alloc] init];
        self.countyDictionary = [tempStates countyDictionaryWithState:aState county:aCounty];
        [tempStates release];
    }
    return self;    
}


#pragma mark -
#pragma mark destructors and memory cleanUp
// use cleanUp method to avoid repeating code in dealloc, setView, and viewDidUnload
-(void)cleanUp {
    [countyDictionary release], countyDictionary = nil;
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
    return [self.countyDictionary count];
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	// cell.textLabel.text = [self.countyDictionary objectAtIndex:indexPath.row];
	cell.textLabel.text = [self.countyDictionary objectForKey:@"4/1/2000 resident total population estimates base"];
    
    return cell;
}

@end