//
//  ViewController.m
//  goodMail
//
//  Created by Hansmander Singh on 2023-12-17.
//

#import "ViewController.h"
#import <GoogleSignIn/GoogleSignIn.h>
#import "InboxesPageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"Sign In"];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    [self toggleDarkMode];
    [self initializationDoneHere];
    
    [_googleSignInButton setTitle:@"Sign in with google" forState:UIControlStateNormal];
    [_googleSignInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_googleSignInButton setBackgroundColor:[UIColor systemBlueColor]];
    _googleSignInButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_googleSignInButton addTarget:self action:@selector(signInPart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_googleSignInButton];
    
    [_googleSignInButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [_googleSignInButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
}

-(void) signInPart {
    [GIDSignIn.sharedInstance
          signInWithPresentingViewController:self
                                  completion:^(GIDSignInResult * _Nullable signInResult,
                                               NSError * _Nullable error) {
        if (error) {
          return;
        }

        // If sign in succeeded, display the app's main content View.
        NSLog(@"%@", signInResult.serverAuthCode);
        [[self navigationController] pushViewController:[[InboxesPageViewController alloc] initWithTitle:signInResult.user.profile.familyName] animated:YES];
      }];
}

-(void) initializationDoneHere {
    _googleSignInButton = [[UIButton alloc] init];
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

@end
