//
//  HomeFeedViewController.m
//  SafeBet
//
//  Created by Isaac Oluwakuyide on 7/10/21.
//

#import "HomeFeedViewController.h"
#import <Parse/Parse.h>
#import "SceneDelegate.h"
#import "LoginViewController.h"
#import "EventCell.h"
#import "APIManager.h"

@interface HomeFeedViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *logOutButton;
@property (strong, nonatomic) NSMutableArray *arrayOfBets;



@end

@implementation HomeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fetchBets];
    
}

- (void) fetchBets  {
    APIManager *api = [APIManager shared];
    
    [api fetchEventsWithCompletion:^(NSArray *bets, NSError *error)  {
        if (error)  {
            NSLog(@"Error fetching bets: %@", [error localizedDescription]);
        }   else    {
            NSLog(@"%@", bets);
        }
    }];
}

- (IBAction)logOutButton:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        SceneDelegate *myDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        myDelegate.window.rootViewController = loginViewController;
    }];
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
