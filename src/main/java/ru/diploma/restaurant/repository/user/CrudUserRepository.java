package ru.diploma.restaurant.repository.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.diploma.restaurant.model.User;

/**
 * @author Panfilov Dmitriy
 * 12.11.2020
 */
public interface CrudUserRepository extends JpaRepository<User, Integer> {

//    @Query("select u from User u join fetch u.restorans restaurant where restaurant.id=:id")
//    List<User> findAllByRestorans(@Param("id") int id);
    @Query("select u from User u inner join Restaurant r where r.user.id=:id and r.id=:restaurant_id")
    User getAdmin(@Param("id") int id, @Param("restaurant_id") int idRestaurant);
}