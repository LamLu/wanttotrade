//
//  WTTSingleton.m
//  Want To Trade
//  This is the singleton for want to trade
//  Created by Lam Lu on 3/22/13.
//
//

#import "WTTSingleton.h"

@implementation WTTSingleton
@synthesize isLogin;
@synthesize  keychainItem;

#pragma mark Singleton Methods

+ (WTTSingleton *)sharedManager
{
    static WTTSingleton *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WTTSingleton alloc] init];
        sharedInstance.isLogin = NO;
        sharedInstance.keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"WTTLoginData" accessGroup:nil];
        
        sharedInstance.userprofile = [[UserProfile alloc] init];
    });
    
    return sharedInstance;
}

- (void) storeUserCredentials : (NSString *) username storePassword: (NSString *) password
{
    [[WTTSingleton sharedManager].keychainItem resetKeychainItem];
    
    [keychainItem setObject:username forKey:(__bridge id)kSecAttrAccount];
    [keychainItem setObject:password forKey:(__bridge id)kSecValueData];
    self.userprofile.email = username;
 
}
@end
