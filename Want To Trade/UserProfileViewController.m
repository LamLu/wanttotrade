//
//  UserProfileViewController.m
//  Want To Trade
//
//  Created by Lam Lu on 3/26/13.
//
//

#import "UserProfileViewController.h"

@interface UserProfileViewController ()
@end

@implementation UserProfileViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    if([WTTSingleton sharedManager].userprofile.username != nil)
        self.nameTextField.text  = [WTTSingleton sharedManager].userprofile.username;
    
    if([WTTSingleton sharedManager].userprofile.username != nil)
        self.emailTextField.text = [WTTSingleton sharedManager].userprofile.email;
    
    if([WTTSingleton sharedManager].userprofile.school != nil)
        self.schoolTextField.text = [WTTSingleton sharedManager].userprofile.school;
    
    if([WTTSingleton sharedManager].userprofile.major != nil)
        self.majorTextField.text = [WTTSingleton sharedManager].userprofile.major;
    if ([WTTSingleton sharedManager].userprofile.userimg != nil)
        [self.imageView setImage:[WTTSingleton sharedManager].userprofile.userimg];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)viewDidUnload {
    [self setNameTextField:nil];
    [self setEmailTextField:nil];
    [self setSchoolTextField:nil];
    [self setMajorTextField:nil];
    [self setImageView:nil];
    [self setDoneButton:nil];
    [super viewDidUnload];
}

- (IBAction)dismissView
{
    [self dismissModalViewControllerAnimated:YES];
}
@end
