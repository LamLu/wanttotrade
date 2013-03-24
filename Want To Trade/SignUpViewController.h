//
//  SignUpViewController.h
//  Want To Trade
//
//  Created by Lam Lu on 3/17/13.
//
//

#import <UIKit/UIKit.h>

@interface SignUpViewController :  UIViewController<NSURLConnectionDataDelegate>

@property (nonatomic, retain) IBOutlet UITextField *emailField;
@property (nonatomic, retain) IBOutlet UITextField *pwField;
@property (nonatomic, retain) IBOutlet UIButton *allDoneButton;
@property (atomic, retain) NSMutableData *receivedData;
@property (nonatomic, retain) NSString *responseString;
@property (readwrite) BOOL done;
@property (nonatomic, retain) UIActivityIndicatorView *activity;

-(void)createSignUp:(NSString *)withEmail andPw:(NSString *)pw;
-(IBAction)buttonPressed:(id)sender;

@end
