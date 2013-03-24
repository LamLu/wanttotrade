//
//  HomeViewController.m
//  Want To Trade
//
//  Created by Sam  on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
@interface HomeViewController ()

@end

@implementation HomeViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([WTTSingleton sharedManager].isLogin == NO)
    {
        UIImage* image3 = [UIImage imageNamed:@"individual login button.png"];
        CGRect frameimg = CGRectMake(0, 0, image3.size.width, image3.size.height);
        UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
        [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
        [someButton addTarget:self action:@selector(login:)
             forControlEvents:UIControlEventTouchUpInside];
        [someButton setShowsTouchWhenHighlighted:YES];
        
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:someButton];
        someButton.tag = 1;
        self.navigationItem.rightBarButtonItem   = rightButton;

        someButton = nil;
        image3 = nil;
        rightButton = nil;
    }
    else
    {
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log Out" style:UIBarButtonItemStyleBordered target:self action:@selector(login:)];
    }
        
    
}
- (void)viewDidUnload
{

    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//reload the  view whenever the view appears
-(void)viewWillAppear:(BOOL)animated
{
    [self.view setNeedsDisplay];
}


//this 
-(IBAction)login : (id) sender
{

    if([WTTSingleton sharedManager].isLogin == NO)
        [self performSegueWithIdentifier:@"LoginSegue" sender:self];
    else
        NSLog(@"Log Out In Home View Controller");
}
@end
