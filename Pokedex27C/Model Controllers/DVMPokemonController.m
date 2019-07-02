//
//  DVMPokemonController.m
//  Pokedex27C
//
//  Created by Drew Seeholzer on 7/2/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

#import "DVMPokemonController.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon/";

@implementation DVMPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(Pokemon *))completion
{
    // Step 1) - Create the URL from the Base URL and search term
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    // Print the URL for testing <3
    NSLog(@"%@", finalURL);
    
     // Step 2) Start my dataTask with the Completion
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // Was there an error
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        //Check the response
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        //Get the data
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error: &error];
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            //If we made it here then I have succeedfully parsed my JSON and should be able to complete with a Pokemon object
            Pokemon *pokemon = [[Pokemon alloc] initWithDictionary:topLevelDictionary];
            completion(pokemon);
        }
    }] resume];
}

@end
