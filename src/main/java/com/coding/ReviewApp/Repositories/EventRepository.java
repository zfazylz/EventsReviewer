package com.coding.ReviewApp.Repositories;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.ReviewApp.Models.Event;

@Repository 

public interface EventRepository extends CrudRepository<Event, Long> {
	List<Event> findAll();
	

	@Query(value="select * from events where state = ?1", nativeQuery=true)
	List<Event> findAllEventsInUserCountry(String country);
	@Query(value="select * from events where state != ?1", nativeQuery=true)
	List<Event> findAllEventsOutOfCountry(String country);
}
