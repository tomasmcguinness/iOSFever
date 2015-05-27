//
//  SoundsTableViewController.m
//  Blackswan
//
//  Created by Tomas McGuinness on 27/05/2015.
//  Copyright (c) 2015 Cold Bear Ltd. All rights reserved.
//

#import "SoundsTableViewController.h"

@interface SoundsTableViewController ()

@end

@implementation SoundsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.service = [SpaceSoundsService new];
    
    [self.service fetchSounds:^(SpaceSoundsModel *model, NSError *error) {
        
        if(error)
        {
            self.model = nil;
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed To Load Sounds"
                                                            message:@"Sorry, we failed to load the sounds. Check you are connected to the internet"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            self.model = model;
        }
        
        [self.tableView reloadData];
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.model.numberOfSounds integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    SpaceSound *sound = [self.model.sounds objectAtIndex:indexPath.row];
    
    cell.textLabel.text = sound.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@s", sound.duration];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    SoundViewController *soundVC = (SoundViewController *)segue.destinationViewController;
    
    SpaceSound *selectedSound = [self.model.sounds objectAtIndex:indexPath.row];
    soundVC.sound = selectedSound;
}

@end
