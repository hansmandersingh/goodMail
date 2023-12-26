//
//  InboxesPageViewController.m
//  goodMail
//
//  Created by Hansmander Singh on 2023-12-17.
//

#import "InboxesPageViewController.h"
#import <GoogleSignIn/GoogleSignIn.h>

@interface InboxesPageViewController ()

@end

@implementation InboxesPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self toggleDarkMode];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStyleDone target:self action:@selector(signOutUser)];
    // Do any additional setup after loading the view.
}

-(void)signOutUser {
    [GIDSignIn.sharedInstance signOut];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (id)initWithTitle:(NSString *) withName
{
    self = [super init];
    if (self) {
        NSMutableString *nameString = [NSMutableString stringWithString:withName];
        [nameString appendString:@"'s Mailbox"];
        self.title = nameString;
    }
    return self;
}

- (void) traitCollectionDidChange: (UITraitCollection *) previousTraitCollection {
   [super traitCollectionDidChange: previousTraitCollection];
   [self toggleDarkMode];
}

-(void) toggleDarkMode {
    if(self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        self.view.backgroundColor = [UIColor blackColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
