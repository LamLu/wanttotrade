//
//  SignInViewController.h
//  Want To Trade
//
//  Created by Lam Lu on 3/17/13.
//
//

#import <UIKit/UIKit.h>
#import "Facebook.h"
#import "LoginConnection.h"
#import "WTTSingleton.h"

@interface SignInViewController : UIViewController<FBSessionDelegate, FBLoginDialogDelegate, ProcessAfterLogin>

@property (nonatomic, retain) IBOutlet UITextField *emailField;
@property (nonatomic, retain) IBOutlet UITextField *pwField;
@property (nonatomic, retain) Facebook *facebook;
@property (nonatomic, retain) IBOutlet UIButton *fbLoginButton;


// delegation method, refer to the method in Connection class
// @param login : Yes = success, No = fail
- (void) isLogInSuccessful : (BOOL)login;

// dismiss the keyboard when return button is hit
- (IBAction) textFieldFinishedWithKeyBoard:(id)sender;

// action performed when signin button is click
- (IBAction) signInButtonClicked:(id)sender;
@end
