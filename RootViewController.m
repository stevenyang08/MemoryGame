//
//  RootViewController.m
//  MemoryGame
//
//  Created by Steven Yang on 1/25/16.
//  Copyright © 2016 Le Mont. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UIView *instructionView;
@property NSMutableArray *cards;
@property NSMutableArray *cardsInPlay;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cards = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Assets" ofType:@"xcassets"]];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if (![userDefault boolForKey:@"firstLaunch"]) {
        [userDefault setBool:YES forKey:@"firstLaunch"];
        self.instructionView.hidden = NO;
        
    }
    
}

-(void)loadCardsInPlay {
    NSMutableArray *randomStorage = [NSMutableArray new];
    for (int i = 0; i < 8; i++) {
        int random = arc4random_uniform(self.cards.count);
        if (![randomStorage containsObject:[NSNumber numberWithInt:random]])
        {
            [self.cardsInPlay addObject:[self.cards objectAtIndex:random]];
            [self.cardsInPlay addObject:[self.cards objectAtIndex:random]];
            [randomStorage addObject:[NSNumber numberWithInt:random]];
        } else
        {
            i--;
        }
        
    }
    
}


-(void)shuffleCards
{
    
}


#pragma mark -actions

- (IBAction)onDuelButtonTapped:(UIButton *)sender {
    [sender.superview removeFromSuperview];
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
