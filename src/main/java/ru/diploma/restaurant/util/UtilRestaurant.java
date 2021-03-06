package ru.diploma.restaurant.util;


import ru.diploma.restaurant.model.Restaurant;

import ru.diploma.restaurant.model.Vote;

import ru.diploma.restaurant.to.RestaurantTo;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Dmitriy Panfilov
 * 18.11.2020
 */
public class UtilRestaurant {


    public static List<RestaurantTo> getTos(List<Vote> votes, List<Restaurant> restaurants){
        return votes.stream()
                .map(vote -> new RestaurantTo(restaurantName(restaurants, vote.getRestaurantId()),
                        vote.getVoteDate(),   (int) getCountVote(vote.getVoteDate(), vote.getRestaurantId(), votes) ))

                .distinct()
                .collect(Collectors.toList());

    }

    public static long getCountVote(LocalDate date, int restaurantId, List<Vote> votes){
        long sum = 0;
        sum = votes.stream()
                .filter(vote -> vote.getVoteDate().equals(date) && vote.getRestaurantId()==restaurantId)
                .count();
        return sum;
    }

    public static String restaurantName(List<Restaurant> restaurants, int restaurantId){
        return restaurants.stream()
                .filter(restaurant -> restaurant.getId() == restaurantId)
                .map(Restaurant::getName)
                .collect(Collectors.joining());
    }

}
