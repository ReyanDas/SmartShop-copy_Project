
package com.learn.mycart.dao;

import com.learn.mycart.entities.Product;
import com.learn.mycart.entities.User;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}

	// get user by email and password
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;

		try {

			String query = "from User where userEmail =: e and userPassword=: p";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			user = (User) q.uniqueResult();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;

	}

	public User getUserByEmail(String email) {
		User user = null;
		try {

			String query = "from User where userEmail =: e";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			user = (User) q.uniqueResult();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();

		}
		return user;
	}

	public List<User> getAllUsers(){
		List<User> users=null;
		
		Session s = this.factory.openSession();
        Query query = s.createQuery("from User");
        users = query.list();
		return users;
	}




}



