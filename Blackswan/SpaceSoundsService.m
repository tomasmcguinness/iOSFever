//
//  SoundsService.m
//  Blackswan
//
//  Created by Tomas McGuinness on 27/05/2015.
//  Copyright (c) 2015 Cold Bear Ltd. All rights reserved.
//

#import "SpaceSoundsService.h"

@implementation SpaceSoundsService

- (void)fetchSounds:(void(^)(SpaceSoundsModel *model, NSError *error))callback
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // We want RAW data here, rather than deserialized JSON (for the purposes of this demo!)
    // I wanted to use the Unit Tests to show the test of the population and creation of the model.
    //
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"https://api.nasa.gov/planetary/sounds?q=apollo&api_key=DEMO_KEY"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             SpaceSoundsModel *model = [SpaceSoundsModel new];
             
             NSError *error;
             
             [model loadData:responseObject withError:&error];
             
             if(error)
             {
                 callback(nil, error);
             }
             else
             {
                 callback(model, nil);
             }
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
        callback(nil, error);
    
    }];
}

@end
