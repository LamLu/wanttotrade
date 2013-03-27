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

/*
 * method to set user profile
 * @param img : UIImage for profile photo
 * @param usrname: NSString username
 * @param em: the email
 * @param sch: the school
 * @param mj: the major
 */
- (void) setUserProfile : (UIImage *) img setUserName : (NSString *) usrname  setEmail: (NSString*) em setSchool: (NSString *) sch setMajor : (NSString *)mj;

@end
