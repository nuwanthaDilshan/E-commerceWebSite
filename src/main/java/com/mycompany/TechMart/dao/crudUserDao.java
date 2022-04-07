
package com.mycompany.TechMart.dao;


import com.mycompany.TechMart.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;



public class crudUserDao {
    private SessionFactory factory;

    public crudUserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //addUser database
    public boolean addUser(User user){
        boolean test =false;
        
        try{
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(user);

            tx.commit();
            session.close();
            test = true;
            
            
        }catch(Exception e){
            e.printStackTrace();
            test = false;
        }
        return test;
        
    }
      
}

