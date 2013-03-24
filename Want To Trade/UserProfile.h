//
//  UserProfile.h
//  Want To Trade
//  This class is to hold the user profile
//  Created by Lam Lu on 3/22/13.
//
//

#import <Foundation/Foundation.h>

@interface UserProfile : NSObject

@property (nonatomic, retain) UIImage  * userimg;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * school;
@property (nonatomic, retain) NSString * major;

@end
