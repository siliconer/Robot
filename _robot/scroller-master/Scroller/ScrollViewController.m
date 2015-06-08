//
//  ScrollViewController.m
//  Scroller
//
//  Created by reefaq on 25/04/12.
//  Copyright (c) 2012 raw engineering. All rights reserved.
//

#import "ScrollViewController.h"
#import "UserBoxView.h"

@implementation ScrollViewController

@synthesize scrollView;


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];
    
    self.title = @"Scroller";
    
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
	self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    UIBarButtonItem* addContactBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewContact:)];
    self.navigationItem.rightBarButtonItem = addContactBarButton;
		
	scrollView  = [[ScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
	scrollView.scrollViewDelegate = self;
	scrollView.backgroundColor = RGBACOLOR(0,0,0,0.2);
	scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:scrollView];
    
    UIButton *button_gravity = [UIButton buttonWithType:UIButtonTypeCustom];
    button_gravity.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    button_gravity.frame = CGRectMake(0, 0, 26, 18);
    button_gravity.bounds = CGRectMake(0, 0, 30.0, 30.0);
    
    UIButton* button_Hongwai =[UIButton buttonWithType:UIButtonTypeCustom];
    button_Hongwai.frame= CGRectMake(30, 0, 26, 18);



//    CGRect playButtonframe = CGRectMake((320 - 100) * 0.2, 200, 100, 47);
//    CGRect setButtonframe = CGRectMake((320 - 100) * 0.8, 200, 100, 47);
//    [self createButtonWithTitle:@"play" frame:playButtonframe];
//    [self createButtonWithTitle:@"setting" frame:setButtonframe];
//    ABAddressBookRef addressBook = ABAddressBookCreate();
//    
//    NSArray* peopleArray = (__bridge_transfer NSArray*)ABAddressBookCopyArrayOfAllPeople(addressBook);
//    
//    for (id per in peopleArray) {
//        ABRecordRef person = (__bridge ABRecordRef)per;
//        
//        NSString* firstName = (__bridge_transfer NSString*) ABRecordCopyValue(person, kABPersonFirstNameProperty);
//        NSString* lastName = (__bridge_transfer NSString*) ABRecordCopyValue(person, kABPersonLastNameProperty);
//        CFDataRef image = ABPersonCopyImageDataWithFormat(person, kABPersonImageFormatThumbnail);
//        NSData* imageData = (__bridge_transfer NSData*)image;
//
//        UIImage* imageObj = nil;
//        
//        if (imageData) {
//            imageObj = [UIImage imageWithData:imageData];
//        }
//        
//        UserBoxView* boxView = [[UserBoxView alloc] init];
//        [boxView.userImageView setImage:[UIImage imageNamed:@"defaultPersonImage.png"]];
//        
//        [boxView.displayTextLabel setText:[NSString stringWithFormat:@"%@ %@",firstName,(lastName.length>0 ? lastName : @"")]];
//        if (imageObj != nil) {
//            [boxView.userImageView setImage:imageObj];
//        }else {
//            [boxView.userImageView setImage:[UIImage imageNamed:@"userdefault.jpg"]];
//        }
    
        //[boxView.badgeLabel setText:[NSString stringWithFormat:@" %d ",1]];

    [scrollView addSubview:button_gravity];
    [scrollView addSubview:button_Hongwai];
    scrollView.canCancelContentTouches=YES;
    scrollView.delaysContentTouches =YES;
    scrollView.userInteractionEnabled= YES;
    scrollView.exclusiveTouch = YES;
    
    
	[scrollView bringViewAtIndexToFront:0 animated:YES];
    

    
}
- (UIButton *)createButtonWithTitle:(NSString *)string frame:(CGRect)frame
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor blackColor];
    
    [button setTitle:string forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didTapButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}


-(void)addNewContact:(id)sender {

    ABNewPersonViewController* picker = [[ABNewPersonViewController alloc] init];
	picker.newPersonViewDelegate = self;
	
	UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:picker];
	[self presentModalViewController:navigation animated:YES];
    
}
#pragma mark ABNewPersonViewControllerDelegate methods
// Dismisses the new-person view controller. 
- (void)newPersonViewController:(ABNewPersonViewController *)newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person
{
	[self dismissModalViewControllerAnimated:YES];

    if (person) {
        NSString* firstName = (__bridge_transfer NSString*) ABRecordCopyValue(person, kABPersonFirstNameProperty);
        NSString* lastName = (__bridge_transfer NSString*) ABRecordCopyValue(person, kABPersonLastNameProperty);
        CFDataRef image = ABPersonCopyImageDataWithFormat(person, kABPersonImageFormatThumbnail);
        NSData* imageData = (__bridge_transfer NSData*)image;
        
        UIImage* imageObj = nil;
        
        if (imageData) {
            imageObj = [UIImage imageWithData:imageData];
        }
        
        UserBoxView* boxView = [[UserBoxView alloc] init];
        [boxView.userImageView setImage:[UIImage imageNamed:@"defaultPersonImage.png"]];
        
        [boxView.displayTextLabel setText:[NSString stringWithFormat:@"%@ %@",firstName,(lastName.length>0 ? lastName : @"")]];
        if (imageObj != nil) {
            [boxView.userImageView setImage:imageObj];
        }else {
            [boxView.userImageView setImage:[UIImage imageNamed:@"userdefault.jpg"]];
        }
        
        [boxView.badgeLabel setText:[NSString stringWithFormat:@" %d ",1]];
        
        [scrollView addUserView:boxView];

        [scrollView jumpToLast:YES];
    }
    
}

- (void) selectedView:(UserBoxView*)selectedview {
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Clicked !!" message:[NSString stringWithFormat:@"You Clicked %@ !",selectedview.displayTextLabel.text] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alertView show];
    
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
