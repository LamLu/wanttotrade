//
//  UserProfile.m
//  Want To Trade
//
//  Created by Lam Lu on 3/22/13.
//
//

#import "UserProfile.h"

@implementation UserProfile

@synthesize userimg;
@synthesize username;
@synthesize email;
@synthesize school;
@synthesize major;

//initialize the dish
- (id) init
{
    return [self initUserProfile:nil initUsername:nil initEmail:nil initSchool:nil initMajor:nil];
}


//custom initialize
//this is designated initilizer
- (id) initUserProfile: (UIImage *) img initUsername : (NSString *) usrname initEmail: (NSString *) e initSchool : (NSString *) sch initMajor: (NSString *) mj
{
    if (self = [super init])
    {
        userimg = img;
        username = usrname;
        email = e;
        school = sch;
        major = mj;
    }
    return self;
}
@end
