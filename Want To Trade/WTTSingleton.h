//
//  WTTSingleton.h
//  Want To Trade
//  This is the singleton for want to trade
//  Created by Lam Lu on 3/22/13.
//
//

#import <Foundation/Foundation.h>
#import "KeychainItemWrapper.h"
#import "UserProfile.h"

@interface WTTSingleton : NSObject

//property to check the login
@property (nonatomic, assign) BOOL isLogin;

//keychain to hold user credentials: username and password
@property (nonatomic, retain) KeychainItemWrapper* keychainItem;

//userprofile property
@property (nonatomic, retain) UserProfile * userprofile;

// method to return this Singleton
+ (WTTSingleton *) sharedManager;

// method to store username and password into keychain
// @param: username the username to be stored
// @password: the password to be stored
- (void) storeUserCredentials : (NSString *) username  storePassword: (NSString *) password;
@end
