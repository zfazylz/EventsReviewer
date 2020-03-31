package com.coding.ReviewApp.Services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coding.ReviewApp.Models.Comment;
import com.coding.ReviewApp.Models.Event;
import com.coding.ReviewApp.Models.User;
import com.coding.ReviewApp.Repositories.CommentRepository;
import com.coding.ReviewApp.Repositories.EventRepository;
import com.coding.ReviewApp.Repositories.UserRepository;

@Service
public class MainService {
	private final EventRepository eventRepository;
	public final UserRepository userRepository;
	public final CommentRepository commentRepository;

	public MainService(EventRepository eventRepository, UserRepository userRepository, CommentRepository commentRepository) {
		this.eventRepository = eventRepository;
		this.userRepository = userRepository;
		this.commentRepository = commentRepository;
	}
	
	public List<Event> allEvents() {
		return eventRepository.findAll();
	}
	
	public Event findEventById(Long id) {
		return 
		eventRepository.findById(id).isPresent() 
			? eventRepository.findById(id).get() 
			: null;
	}
	public Event createEvent(Event event) {
		Event newevent = eventRepository.save(event);
		newevent.getGuestList().add(newevent.getOwner());
		eventRepository.save(newevent);
		return newevent;
	}
	public Event editEvent(Event event) {
		Event newevent = findEventById(event.getId());
			newevent.setEvent_date(event.getEvent_date());
			newevent.setEvent_name(event.getEvent_name());
			newevent.setCountry(event.getCountry());
			newevent.setLocation(event.getLocation());
		return eventRepository.save(newevent);
	}
	public void deleteEvent(Event event) {
		eventRepository.delete(event);
	}

	public List<Event> findAllEventsInUserCountry(String country){
		return eventRepository.findAllEventsInUserCountry(country);
	}

	public List<Event> findAllEventsOutOfCountry(String country){
		return eventRepository.findAllEventsOutOfCountry(country);
	}

	public List<Event> findJoinedEventsByUserId(Long id){
		return userRepository.findById(id).get().getEventsJoined();
	}
	public boolean isOwner(Long id, long eventid) {
		System.out.println("comparing event.id :" + eventid+ " vs " + " long :"+ id);
		return eventid == id;
	}

	public void joinEvent(Long eventid, User user) {
    	Event event =  findEventById(eventid);
    	if(event == null || user == null ) {return;}
    	if(event.getGuestList().contains(user)) {return;}
		event.getGuestList().add(user);
		eventRepository.save(event);
		System.out.println("join event completed");
	}

	public void leaveEvent(Long eventid, User user) {
    	Event event =  findEventById(eventid);
    	if(event == null || user == null ) {return;}
    	if(!event.getGuestList().contains(user)) {return;}
		event.getGuestList().remove(user);
		eventRepository.save(event);
		System.out.println("join event completed");		
	}

	public void createComment(Long eventid, User author, Comment comment) {
		Comment newcomment = new Comment();
		Event event = findEventById(eventid);
		newcomment.setEvent(event);
		newcomment.setAuthor(author);
		newcomment.setContent(comment.getContent());
		commentRepository.save(newcomment);		
	}
}
