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

- (void) setUserProfile : (UIImage *) img setUserName : (NSString *) usrname  setEmail: (NSString*) em setSchool: (NSString *) sch setMajor : (NSString *)mj
{
    self.userimg = img;
    self.username = usrname;
    self.email = em;
    self.school = sch;
    self.major = mj;
    img = nil;
    usrname = nil;
    em = nil;
    sch = nil;
    mj = nil;
}
@end
