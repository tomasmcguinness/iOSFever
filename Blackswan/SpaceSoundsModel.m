//
//  SpaceSoundsModel.m
//  Blackswan
//
//  Created by Tomas McGuinness on 27/05/2015.
//  Copyright (c) 2015 Cold Bear Ltd. All rights reserved.
//

#import "SpaceSoundsModel.h"

@implementation SpaceSoundsModel

- (NSNumber *)numberOfSounds
{
    return _count;
}

- (NSArray *)sounds
{
    return _sounds;
}

- (void)loadData:(NSData *)data withError:(NSError *__autoreleasing *)error
{
    NSError *jsonParsingError;
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonParsingError];
    
    if(jsonParsingError)
    {
        *error = [NSError errorWithDomain:@"" code:1001 userInfo:nil];
        return;
    }
    
    _count = [jsonDictionary valueForKey:@"count"];
    
    NSMutableArray *processedSounds  = [[NSMutableArray alloc] initWithCapacity:[_count integerValue]];
    NSArray *soundsArray = [jsonDictionary objectForKey:@"results"];
    
    for(NSDictionary *soundArray in soundsArray)
    {
        SpaceSound *sound = [SpaceSound new];
        sound.title = [soundArray valueForKey:@"title"];
        
        if([soundArray valueForKey:@"description"] != [NSNull null])
        {
            sound.desc = [soundArray valueForKey:@"description"];
        }
        
        sound.streamUrl = [soundArray valueForKey:@"stream_url"];
        sound.duration = [soundArray valueForKey:@"duration"];

        [processedSounds addObject:sound];
    }
    
    _sounds = [NSArray arrayWithArray:processedSounds];
}

@end
