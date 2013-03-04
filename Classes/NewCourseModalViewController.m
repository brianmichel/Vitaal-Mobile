//
//  NewCourseModalViewController.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 2/20/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import "NewCourseModalViewController.h"


@implementation NewCourseModalViewController

@synthesize entryTable, tableData, starsPicker, starsArray, sheet, cTitleCell, diffCell, courseTitle, mapCell, commentCell, commentView;

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSArray *array = [[NSArray alloc] initWithObjects:@"Course Name", @"Course Map", @"Comments", nil];
	self.tableData = array;
	
	NSArray *sarray = [[NSArray alloc] initWithObjects:@"◊ Very Easy", @"◊◊ Easy", @"◊◊◊ Moderate", @"◊◊◊◊ Hard", @"◊◊◊◊◊ Very Hard", nil];
	self.starsArray = sarray;
	
	[sarray release];
	[array release];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
		return 2;
	} else if (section == 1) {
		return 1;
	} else {
		return 1;
	}

}

- (CGFloat)tableView:(UITableView *)tv heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		//return 40.0f;
		return 58.0f;
	} else if (indexPath.section == 1) {
		return 287.0f;
	} else if (indexPath.section == 2) {
		return 172.0f;
	} 
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.section == 0) {
		if (indexPath.row == 0) {
			return cTitleCell;
		} else if (indexPath.row == 1) {
			return diffCell;
		}
	} if (indexPath.section == 1) {
		return mapCell;
	} else if (indexPath.section == 2) {
		return commentCell;
	}
	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	// Set up the cell...
	cell.text = [tableData objectAtIndex:[indexPath row]];
	return cell;
}
    

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{
	if (section == 0) {
		return @"Course Information";
	} else if (section == 1) {
		return @"Course Map";
	} else if (section == 2) {
		return @"Comments";
	} 
	return @"oops";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[courseTitle resignFirstResponder];
	return NO;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	if ([text isEqualToString:@"\n"]) {
		[commentView resignFirstResponder];
		return FALSE;
	}
	return TRUE;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	[self showPicker:nil];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [starsArray count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	[sheet dismissWithClickedButtonIndex:5 animated:YES];
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
	return [starsArray count];
}

- (void)showPicker:(id)sender {

	sheet = [[UIActionSheet alloc] initWithTitle:@"Please Choose Difficulty" 
													   delegate:self 
											  cancelButtonTitle:nil 
										 destructiveButtonTitle:@"okay"
											  otherButtonTitles:nil];
	
	
	[starsPicker setBounds:CGRectMake(0, 185, 0, 0)];
	[sheet setBounds:CGRectMake(0, 0, 320, 700)];
	[sheet addSubview:starsPicker];
	[sheet showInView:entryTable];

}


- (void)dealloc {
    [super dealloc];
	[entryTable release];
	[tableData release];
	[starsArray release];
	[starsPicker release];
	[sheet release];
	[cTitleCell release];
	[diffCell release];
}


@end

