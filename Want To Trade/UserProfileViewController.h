//
//  UserProfileViewController.h
//  Want To Trade
//  This is the user profile table view controller
//  Created by Lam Lu on 3/26/13.
//
//

#import <UIKit/UIKit.h>
#import "WTTSingleton.h"

@interface UserProfileViewController : UITableViewController


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *schoolTextField;
@property (weak, nonatomic) IBOutlet UITextField *majorTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

//dismiss this Modal View Controller
- (IBAction) dismissView;
@end
