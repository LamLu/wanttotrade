//
//  SignInViewController.m
//  Want To Trade
//  
//  Created by Lam Lu on 3/17/13.
//
//

#import "SignInViewController.h"
#import "HomeViewController.h"
#import "SignUpViewController.h"
#import "FBConnect.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

@synthesize emailField;
@synthesize pwField;
@synthesize facebook;
@synthesize fbLoginButton;

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
	// Do any additional setup after loading the view.
    emailField.returnKeyType = UIReturnKeyDone;
    emailField.keyboardType = UIKeyboardTypeEmailAddress;
    pwField.returnKeyType = UIReturnKeyDone;
    pwField.keyboardType = UIKeyboardTypeDefault;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
//    emailField = nil;
//    pwField = nil;
//    facebook = nil;
//    fbLoginButton = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//prepare the segue if the bar button is clicked
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"SignInCancelSegue"])
    {
        HomeViewController *hvc = [segue destinationViewController];
        hvc.navigationItem.hidesBackButton = YES;
        hvc = nil;
    }
    
    //if sucesslogin
    else if ([[segue identifier] isEqualToString:@"LoginSuccess"])
    {
        
    }
    else if ([[segue identifier] isEqualToString:@"SignUpDoneSegue"]) {
        
    }
    else if ([[segue identifier] isEqualToString:@"LoginToSignUpSegue"]) {
        
    }
}


//Dismisses Keyboard when anything but the text field is touched
- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]])
            [view resignFirstResponder];
    }
}

// Pre iOS 4.2 support
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    NSLog(@"4.2 URL Support");
    return [facebook handleOpenURL:url];
}

// For iOS 4.2+ support
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    NSLog(@"Handle URL");
    return [facebook handleOpenURL:url];
}

- (void)fbDidLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    NSLog(@"Did login token: %@", [defaults valueForKey:@"FBAccessTokenKey"]);
    [defaults synchronize];
    
}

-(void)fbSignin:(id)sender{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    facebook = [[Facebook alloc] initWithAppId:@"152570318200694" andDelegate:self];
    
    if ([defaults objectForKey:@"FBAccessTokenKey"]
        && [defaults objectForKey:@"FBExpirationDateKey"]) {
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    
    if (![facebook isSessionValid]) {
        NSArray *permissions = [[NSArray alloc] initWithObjects:
                                @"user_education_history",
                                @"email",
                                @"publish_stream",
                                nil];
        [facebook authorize:permissions];
    }
    [defaults setBool:YES forKey:@"UsedFBLogin"];
    [defaults synchronize];
}

-(void)fbDidNotLogin:(BOOL)cancelled{
    
}

// delegation method, refer to the method in Connection class
// @param login : Yes = success, No = fail
- (void) isLogInSuccessful : (BOOL)login;
{
    if(login == YES)
    {
        [WTTSingleton sharedManager].isLogin = YES;
        [[WTTSingleton sharedManager] storeUserCredentials:self.emailField.text storePassword:self.pwField.text];
        [self performSegueWithIdentifier: @"LoginSuccess" sender:self];

    }
    
    else if (login == NO)
    {
        //[self performSegueWithIdentifier:@"LoginFail" sender:self];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed"
                                                        message:@"Could not find your username or password on the server"
                                                       delegate:nil
                                              cancelButtonTitle:@"Try Again" otherButtonTitles: nil];
        [alert show];
        alert = nil; //release arlet when done
    }
}

/*
 * Dissmis the keyboard when the return button is pressed
 * Connect this function to Did End on Exit of the text field from
 * storyboard
 * @param sender, the textfield responder
 */
- (IBAction) textFieldFinishedWithKeyBoard:(id)sender {
    [sender resignFirstResponder];
}


/**
 * Action performed when signIn button is click
 */

- (IBAction) signInButtonClicked:(id)sender
{
    
    // create connection and process
    LoginConnection * connection = [[LoginConnection alloc] init];
    
    NSString * username = self.emailField.text;
    NSString *password = self.pwField.text;
    
    
    //always check if user enter username and password.
    if(username.length == 0 || password.length == 0 )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty Input"
                                                        message:@"Enter username or password"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil; //release arlet when done
    }
    
    else
    {
        [connection setDelegate:self];
        [connection createConnection:username :password];
        
    }
    connection= nil;
    username = nil;
    password = nil;
    
    
}

@end
