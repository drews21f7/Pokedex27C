//
//  Pokemon.h
//  Pokedex27C
//
//  Created by Drew Seeholzer on 7/2/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pokemon : NSObject

@property (nonatomic, copy, readonly) NSString *pokemonName;
//let pokemonName: String
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
// *1 is for the individual strings, *2 is for the array

- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                          abilities:(NSArray<NSString *> *)abilities;
/*
 init(name: String, identifier: Int, abilities: [String]) {
 
 }
 */

@end

@interface Pokemon (JSONCovertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

//init(with dictionary: [String:Any]) {
@end

NS_ASSUME_NONNULL_END
