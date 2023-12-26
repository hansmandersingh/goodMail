//
//  InboxesPageViewController.h
//  goodMail
//
//  Created by Hansmander Singh on 2023-12-17.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface InboxesPageViewController : UIViewController

@property (nonatomic) NSString *titleName;

- (id)initWithTitle:(NSString *) withName;

@end

NS_ASSUME_NONNULL_END
