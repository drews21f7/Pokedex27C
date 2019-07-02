//
//  Pokemon.m
//  Pokedex27C
//
//  Created by Drew Seeholzer on 7/2/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon
- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self != nil) {
        _pokemonName = name;
        //self.pokemonName = name
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}


@end

@implementation Pokemon (JSONCovertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary // C
{
    NSString *name = dictionary[@"name"];
    // let name = dictionary["name"] as? String
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray *abilitiesDict = dictionary[@"abilities"]; // B
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDict isKindOfClass:[NSArray class]]) {
        return nil;
    }
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc]init];
    //let abilities : [String] = []
    for (NSDictionary *dictionary in abilitiesDict) // B
    {
        NSDictionary *abilityDict = dictionary[@"ability"]; // A
        NSString *abilityName = abilityDict[@"name"];
        [abilities addObject:abilityName];
    }
    return [self initWithPokemonName:name identifier:identifier abilities:abilities];
    
}

@end
