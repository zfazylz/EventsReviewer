package com.coding.ReviewApp.Repositories;

import org.springframework.data.repository.CrudRepository;

import com.coding.ReviewApp.Models.Comment;

public interface CommentRepository extends CrudRepository<Comment, Long> {

}
